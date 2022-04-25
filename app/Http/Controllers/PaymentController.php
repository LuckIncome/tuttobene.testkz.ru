<?php

namespace App\Http\Controllers;

use App\Mail\SendEmail;
use App\Models\CakeProduct;
use App\Models\Order;
use App\Models\OrderProduct;
use App\Models\Payment;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Paybox\Pay\Facade as Paybox;

class PaymentController extends Controller
{
    public function saveTransaction(Request $request)
    {
        \Log::info(json_encode($request->all()));

        $orderId = $request->get('pg_order_id');
        $payment = Payment::where('order_id', $orderId)->first();
        $payment->payment_id = $request->get('pg_payment_id');
        $payment->save();

        return response()->json(['pg_status' => 'ok', 'pg_salt' => $request->get('pg_salt'), 'pg_sig' => $request->get('pg_sig')]);
    }

    public function confirmOrder($orderId, $paymentId)
    {
        $paymentStatus = $this->checkPaymentStatus($orderId, $paymentId);
        if ($paymentStatus == 'ok') {
            $order = Order::find($orderId);
            if ($order->confirmed) {
                return redirect(route('cart.checkout.thanks', $orderId));
            }
            $order->confirmed = true;
            $order->save();

            if ($order->customCake()->count() > 0) {
                $customCake = CakeProduct::find($order->customCake->first()->id);
                $customCake->confirmed = true;
                $customCake->save();
            }

            $payment = Payment::where('order_id', $orderId)->first();
            $payment->order_id = $order->id;
            $payment->confirmed = true;
            $payment->payment_id = $paymentId;
            $payment->save();

            \Cart::clear();

            if (!session()->exists('orderId_timestamp')) {
                session()->put('orderId_timestamp', $orderId . '_' . Carbon::now()->timestamp);
            }
            $this->sendEmailSuccess($order);

            return redirect(route('cart.checkout.thanks', $orderId));
        } elseif ($paymentStatus == 'pending') {
            return redirect(route('cart.checkout.awaiting', [$orderId, $paymentId]));
        } else {
            return redirect(route('cart.index'));
        }
    }


    public function successTransaction(Request $request)
    {
        return $this->confirmOrder($request->get('pg_order_id'), $request->get('pg_payment_id'));

    }

    public function checkPaymentStatus($orderId, $paymentId)
    {
        $paybox = new Paybox();
        $paybox->getMerchant()
            ->setId(Payment::MERCHANT_ID)
            ->setSecretKey(Payment::SECRET_KEY);
        $paybox->getPayment()
            ->setId($paymentId);

        $paybox->order->id = $orderId;

        return $paybox->getStatus();
    }

    public function checkOrderPaymentStatus($orderId, $paymentId)
    {
        $statusId = $this->checkPaymentStatus($orderId, $paymentId);
        switch ($statusId) {
            case 'pending':
                $status = 'В ожидании оплаты';
                break;
            case 'ok':
                $status = 'Оплачено. Сейчас вы автоматически перейдете на страницу успешного заказа';
                break;
            case 'failed':
                $status = 'Платеж не прошел';
                break;
            case 'partial':
                $status = 'Платеж не выполнен полностью';
                break;
            default:
                $status = 'Платеж не выполнен';
                break;
        }

        return response()->json(['paymentStatus' => $status, 'paymentStatusId' => $statusId]);
    }

    public function failureTransaction(Request $request)
    {
        return $this->confirmOrder($request->get('pg_order_id'), $request->get('pg_payment_id'));
    }

    public function checkoutAwaiting($orderId, $paymentId)
    {
        $paymentStatus = $this->checkPaymentStatus($orderId, $paymentId);
        if ($paymentStatus == 'ok') {
            $order = Order::find($orderId);
            if ($order->confirmed) {
                return redirect(route('cart.checkout.thanks', $orderId));
            }
            $order->confirmed = true;
            $order->save();

            $payment = Payment::where('order_id', $orderId)->first();
            $payment->order_id = $order->id;
            $payment->confirmed = true;
            $payment->payment_id = $paymentId;
            $payment->save();

            \Cart::clear();
            if (!session()->exists('orderId_timestamp')) {
                session()->put('orderId_timestamp', $orderId . '_' . Carbon::now()->timestamp);
            }
            $this->sendEmailSuccess($order);

            return redirect(route('cart.checkout.thanks', $orderId));
        } elseif ($paymentStatus == 'pending') {
            return view('cart.awaiting', compact('orderId', 'paymentId', 'paymentStatus'));
        } else {
            return redirect(route('cart.index'));
        }

    }

    public function sendEmailSuccess($order)
    {
        $orderedProducts = [];
        if ($order->orderProducts->count() > 0) {
            foreach ($order->orderProducts as $orderProduct) {
                $productType = $orderProduct->product_type;
                $model = 'App\\Models\\' . ucfirst($productType);

                $product = $model::find($orderProduct->product_id);
                $product->setAttribute('qty', $orderProduct->count);
                $product->setAttribute('data', $orderProduct->product_data);
                $product->setAttribute('price', $orderProduct->price);
                $product->setAttribute('type', $productType);
                $orderedProducts[] = $product;
            }
        }else {
            foreach ($order->customCake as $orderProduct) {
                $orderProduct->setAttribute('name','Кастомный торт');
                $orderProduct->setAttribute('qty', $orderProduct->count);
                $orderProduct->setAttribute('data', $orderProduct->product_data);
                $orderProduct->setAttribute('type', 'custom');
                $orderedProducts[] = $orderProduct;
            }
        }

//                 $users = User::where('role_id', 1)->select('email')->get()->pluck('email')->toArray();
        $users = ['tokkerbaz@gmail.com'];

        $this->sendSmsToClient($order);

//        \Mail::send(new SendEmail('emails.newOrder', $users, 'Новый заказ с сайта Tutto-Bene', ['order' => $order, 'products' => $orderedProducts]));
    }

    public function sendSmsToClient(Order $order)
    {
        $endpoint = "https://msg.kcell.kz/api/v3/messages";
        $text = 'Спасибо за оплату! Ваш заказ номер ' . $order->id . ' принят в работу.';
        $sender = 'Tutto Bene';
        $recipient = preg_replace('/[^\d]/','',$order->phone);
        $priority = 2;
        $user = 'Gelato_rest';
        $password = 'GxTAYiPo';

        Http::withBasicAuth($user, $password)
            ->withHeaders([
                "accept" => "application/json",
                "content-type" => "application/json"
            ])
            ->post($endpoint, [
                'sender' => $sender,
                'recipient' => $recipient,
                'priority' => $priority,
                'message_text' => $text,
            ]);
    }

}
