<?php

namespace App\Http\Controllers;

use App\Mail\SendEmail;
use App\Models\Branch;
use App\Models\Cake;
use App\Models\CakeProduct;
use App\Models\Contact;
use App\Models\District;
use App\Models\Icecream;
use App\Models\IcePortion;
use App\Models\Order;
use App\Models\OrderEntity;
use App\Models\OrderProduct;
use App\Models\Payment;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;
use JsonSchema\Uri\Retrievers\Curl;
use Paybox\Pay\Facade as Paybox;

class CartController extends Controller
{
    public function index()
    {
        return view('cart.index');
    }

    public function getCartAddons()
    {
        $branches = Branch::select('id', 'title', 'status', 'sort_id')->where('status', true)->orderBy('sort_id')->get();
        $branches->shift();
        $branches->map(function ($branch) {
            $branch->setAttribute('full_title', $branch->title . ' 10:00 — 22:00 ежедневно');
        });

        $districts = District::where('status', true)->orderBy('sort_id')->get();

        return response()->json(['branches' => $branches, 'districts' => $districts]);
    }

    public function add(Request $request)
    {
        $product_id = $request->get('productId');
        $productType = (string)$request->get('productType');
        $qty = (int)$request->get('qty');
        $inCartAction = (boolean)$request->has('inCartAction');

        if ($productType === Icecream::ICECREAM) {

            $portionId = (int)$request->get('portionId');

            $product = Icecream::with('portions')->find($product_id);
            $portion = IcePortion::with(['icecream.iceType'])->find($portionId);
            $portion->setAttribute('link', route('products.show', [Icecream::ICECREAM, $portion->icecream->slug]));
            $portion->setAttribute('category', 'Мороженое в банках / ' . $portion->icecream->iceType->title);

            if (!\Cart::has($productType . '_' . $product_id . '_' . $portionId) || !$inCartAction) {
                \Cart::add([
                    'id' => $productType . '_' . $product_id . '_' . $portionId,
                    'name' => $product->slug,
                    'price' => (int)$portion->price,
                    'quantity' => $qty,
                    'associatedModel' => $portion,
                    'attributes' => [
                        'product_type' => 'icecream',
                        'image' => \Voyager::image($product->image),
                        'title' => $product->title,
                        'excerpt' => $portion->title
                    ]
                ]);
            } else {
                \Cart::update($productType . '_' . $product_id . '_' . $portionId, [
                    'quantity' => array(
                        'relative' => false,
                        'value' => $qty
                    ),
                ]);
            }
        }

        if ($productType === Icecream::CAKE) {
            $weight = (float)$request->get('weight');
            $cakeText = (string)$request->get('cakeText');
            $price = (int)$request->get('price');

            $portionId = (strlen($cakeText) > 0) ? $weight . '_' . Str::slug($cakeText) : $weight;

            $product = Cake::find($product_id);
            $product->setAttribute('link', route('products.show', [Icecream::CAKE, $product->slug]));
            $product->setAttribute('category', 'Торты из мороженого');
            $excerpt = strlen($cakeText) > 0 ? 'Вес - ' . $weight . ' кг. <br>Надпись - ' . $cakeText : 'Вес - ' . $weight . ' кг.';

            if (!\Cart::has($productType . '_' . $product_id . '_' . $portionId) || !$inCartAction) {
                \Cart::add([
                    'id' => $productType . '_' . $product_id . '_' . $portionId,
                    'name' => $product->slug,
                    'price' => $price,
                    'quantity' => $qty,
                    'associatedModel' => $product,
                    'attributes' => [
                        'product_type' => 'cake',
                        'text' => $cakeText,
                        'weight' => $weight,
                        'image' => \Voyager::image($product->image),
                        'title' => $product->title,
                        'excerpt' => $excerpt
                    ]
                ]);
            } else {
                \Cart::update($productType . '_' . $product_id . '_' . $portionId, [
                    'quantity' => array(
                        'relative' => false,
                        'value' => $qty
                    ),
                ]);
            }
        }

        if ($productType === 'waffle') {
            if (!\Cart::has($productType) || !$inCartAction) {
                \Cart::add([
                    'id' => $productType,
                    'name' => $productType,
                    'price' => (int)setting('site.waffle_price'),
                    'quantity' => $qty,
                    'attributes' => [
                        'product_type' => 'waffle',
                        'image' => '/img/waffle_cone.svg',
                        'title' => 'Вафельные рожки',
                        'excerpt' => 'Вафельные рожки'
                    ]
                ]);
            } else {
                \Cart::update($productType, [
                    'quantity' => array(
                        'relative' => false,
                        'value' => $qty
                    ),
                ]);
            }
        }

        return $this->getContent();
    }


    public function update(Request $request)
    {
        $product_id = $request->get('productId');
        $qty = (int)$request->get('qty');
        $inCartAction = (boolean)$request->has('inCartAction');

        if (\Cart::has($product_id) && $inCartAction) {
            \Cart::update($product_id, [
                'quantity' => array(
                    'relative' => false,
                    'value' => $qty
                ),
            ]);
        }

        $cartCount = \Cart::getTotalQuantity();
        $cartItems = \Cart::getContent();
        $cartTotal = \Cart::getTotal();

        return response()->json(['count' => $cartCount, 'items' => $cartItems, 'total' => $cartTotal]);
    }

    public function remove(Request $request)
    {
        $product_id = $request->get('productId');
        \Cart::remove($product_id);

        return $this->getContent();
    }

    public function getContent()
    {
        $cartCount = \Cart::getTotalQuantity();
        $cartItems = \Cart::getContent();
        $cartTotal = \Cart::getTotal();

        return response()->json(['count' => $cartCount, 'items' => $cartItems, 'total' => $cartTotal]);
    }

    public function confirm(Request $request)
    {
        $data = $request->get('client');
        $companyFields = $request->get('company');

        $validator = \Validator::make($data, [
            'name' => 'required',
            'phone' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()]);
        }
        $total = \Cart::getTotal();
        if ($total > 0) {
            $order = new Order();
            $order->name = $data['name'];
            $order->phone = $data['phone'];
            $order->delivery = $data['deliveryType'];
            $order->payment = $data['paymentType'];
            if ($data['deliveryType'] === Order::SELF) {
                $order->branch_id = $data['branch'];
                $order->delivery_price = 0;
            } else {
                $order->address = District::find($data['district'])->title . ' ' . $data['address'];
                $order->date = (array_key_exists('date', $data) ? $data['date'] : null) . ' ' . (array_key_exists('time', $data) ? $data['time'] : null);
                $order->delivery_price = (int)$data['deliveryPrice'];
                $total = $total + (int)$data['deliveryPrice'];
            }
            $order->amount = $total;
            $order->confirmed = $data['paymentType'] !== Order::CARD;
            $order->status = Order::STATUS_NEW;
            $order->save();

            $products = \Cart::getContent();
            $orderedProducts = [];

            foreach ($products as $product) {
                if ($product->associatedModel) {
                    $productType = strtolower(class_basename($product->associatedModel)) === OrderProduct::ICEPORTION ? OrderProduct::ICECREAM : OrderProduct::CAKE;
                } else {
                    $productType = 'waffle';
                }
                $orderProduct = new OrderProduct();
                $orderProduct->order_id = $order->id;
                $orderProduct->product_type = $productType;

                if ($productType === OrderProduct::ICECREAM) {
                    $orderProduct->product_id = $product->associatedModel->{$productType}->id;
                    $orderProduct->product_data = strlen($product->associatedModel->excerpt) > 1 ? $product->associatedModel->title . ' - ' . $product->associatedModel->excerpt : $product->associatedModel->title;
                } else if ($productType === OrderProduct::CAKE) {
                    $orderProduct->product_id = $product->associatedModel->id;
                    $orderProduct->product_data = $product->attributes['excerpt'];
                } else {
                    $orderProduct->product_id = 0;
                    $orderProduct->product_data = $product->attributes['excerpt'];
                }

                $orderProduct->count = $product->quantity;
                $orderProduct->price = $product->price;
                $orderProduct->save();

                $orderedProducts[] = $orderProduct;
            }

            $payment = new Payment();
            $payment->order_id = $order->id;
            $payment->amount = $total;
            $payment->type = $data['paymentType'];
            $payment->confirmed = $data['paymentType'] !== Order::CARD;
            $payment->save();

            if ($data['paymentType'] === Order::CHARGE) {
                if (count($companyFields)) {
                    $orderEntity = new OrderEntity();
                    $orderEntity->order_id = $order->id;
                    $orderEntity->name = $companyFields['name'];
                    $orderEntity->person = array_key_exists('person', $companyFields) ? $companyFields['person'] : null;
                    $orderEntity->bin = $companyFields['bin'];
                    $orderEntity->bik = $companyFields['bik'];
                    $orderEntity->iik = $companyFields['iik'];
                    $orderEntity->address = $companyFields['address'];
                    $orderEntity->save();
                }
            }

            if ($order->confirmed) {
                $this->sendEmailSuccess($order);
            }
            if ($data['paymentType'] !== Order::CARD) {
                \Cart::clear();
                return response()->json(['success' => true, 'link' => route('cart.checkout.thanks', $order->id)]);
            } else {
                return $this->cardPay($order);
            }

        }
        return redirect()->route('cart.index')->with('error', 'Нельзя оформить заказ без товаров в корзине');

    }

    public function constructorConfirm(Request $request)
    {
        $data = $request->get('client');
        $companyFields = $request->get('company');
        $cake = $request->get('cake');
        $weight = (float)$cake['weight'];
        $cakeText = (string)$cake['text'];

        $validator = \Validator::make($data, [
            'name' => 'required',
            'phone' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'errors' => $validator->errors()]);
        }

        $total = (int)$cake['productTotal'];
        if ($total > 0) {
            $order = new Order();
            $order->name = $data['name'];
            $order->phone = $data['phone'];
            $order->delivery = $data['deliveryType'];
            $order->payment = $data['paymentType'];
            if ($data['deliveryType'] === Order::SELF) {
                $order->branch_id = $data['branch'];
                $order->delivery_price = 0;
            } else {
                $order->address = District::find($data['district'])->title . ' ' . $data['address'];
                $order->date = (array_key_exists('date', $data) ? $data['date'] : null) . ' ' . (array_key_exists('time', $data) ? $data['time'] : null);
                $order->delivery_price = (int)$data['deliveryPrice'];
                $total = $total + (int)$data['deliveryPrice'];
            }
            $order->amount = $total;
            $order->confirmed = $data['paymentType'] !== Order::CARD;
            $order->status = Order::STATUS_NEW;
            $order->save();

            $customCake = new CakeProduct();
            $customCake->order_id = $order->id;
            $customCake->stage = (int)$cake['stage'];
            $customCake->shape = $cake['shape'];
            $customCake->biscuit = (array_key_exists('biscuit', $cake) && $cake['biscuit']);
            $customCake->tastes = serialize($cake['tastes']);
            $customCake->count = $cake['quantity'];
            $customCake->price = (int)$cake['price'] * $weight;
            $customCake->product_data = strlen($cakeText) > 0 ? 'Вес - ' . $weight . ' кг. <br>Надпись - ' . $cakeText : 'Вес - ' . $weight . ' кг.';
            $customCake->comments = $cake['comments'];
            $customCake->confirmed = $order->confirmed;
            $customCake->save();

            $payment = new Payment();
            $payment->order_id = $order->id;
            $payment->amount = $total;
            $payment->type = $data['paymentType'];
            $payment->confirmed = $data['paymentType'] !== Order::CARD;
            $payment->save();

            if ($data['paymentType'] === Order::CHARGE) {
                if (count($companyFields)) {
                    $orderEntity = new OrderEntity();
                    $orderEntity->order_id = $order->id;
                    $orderEntity->name = $companyFields['name'];
                    $orderEntity->person = array_key_exists('person', $companyFields) ? $companyFields['person'] : null;
                    $orderEntity->bin = $companyFields['bin'];
                    $orderEntity->bik = $companyFields['bik'];
                    $orderEntity->iik = $companyFields['iik'];
                    $orderEntity->address = $companyFields['address'];
                    $orderEntity->save();
                }
            }

            if ($order->confirmed) {
                $this->sendEmailSuccess($order);
            }
            if ($data['paymentType'] !== Order::CARD) {
                \Cart::clear();
                return response()->json(['success' => true, 'link' => route('cart.checkout.thanks', $order->id)]);
            } else {
                return $this->cardPay($order);
            }

        }
        return redirect()->route('cart.index')->with('error', 'Нельзя оформить заказ без товаров в корзине');

    }


    public function clear()
    {
        \Cart::clear();
        return $this->getContent();

    }

    private function cardPay($order)
    {
        $order = Order::find($order->id);

        $paybox = new Paybox();
        $paybox->merchant->id = Payment::MERCHANT_ID;
        $paybox->merchant->secretKey = Payment::SECRET_KEY;
        $paybox->merchant->salt = 'j7aBIZrlGrbLroEo';
        $paybox->config->currency = 'KZT';
        $paybox->config->resultUrl = config('app.url') . '/api/online/saveTransaction';
        $paybox->config->successUrl = config('app.url') . '/api/online/successTransaction';
        $paybox->config->stateUrl = config('app.url') . '/api/online/stateTransaction';
        $paybox->config->stateUrlMethod = 'POST';
        $paybox->config->successUrlMethod = 'POST';
        $paybox->config->failureUrl = config('app.url') . '/api/online/failureTransaction';
        $paybox->config->failureUrlMethod = "POST";
        $paybox->config->siteUrl = config('app.url');
        $paybox->order->id = $order->id;
        $paybox->order->description = 'Покупка с сайта Tutto Bene';
        $paybox->order->amount = $order->amount;
        $paybox->customer->phone = (int)filter_var($order->phone, FILTER_SANITIZE_NUMBER_INT);;

        $paybox->config->isTestingMode = false;

        if ($paybox->init()) {
//            header('Location:' . $paybox->redirectUrl);
            return response()->json(['success' => true, 'link' => $paybox->redirectUrl]);
        }
        exit;
    }

    public function sendEmailSuccess($order)
    {
        $orderedProducts = [];
        if ($order->orderProducts->count() > 0) {
            foreach ($order->orderProducts as $orderProduct) {
                $productType = $orderProduct->product_type;
                if ($productType != 'waffle') {
                    $model = 'App\\Models\\' . ucfirst($productType);

                    $product = $model::find($orderProduct->product_id);
                    $product->setAttribute('qty', $orderProduct->count);
                    $product->setAttribute('data', $orderProduct->product_data);
                    $product->setAttribute('price', $orderProduct->price);
                    $product->setAttribute('type', $productType);
                    $orderedProducts[] = $product;
                } else {
                    $orderProduct->setAttribute('name', 'Вафельные рожки');
                    $orderProduct->setAttribute('qty', $orderProduct->count);
                    $orderProduct->setAttribute('data', $orderProduct->product_data);
                    $orderProduct->setAttribute('type', 'waffle');
                    $orderedProducts[] = $orderProduct;
                }

            }
        } else {
            foreach ($order->customCake as $orderProduct) {
                $orderProduct->setAttribute('name', 'Кастомный торт');
                $orderProduct->setAttribute('qty', $orderProduct->count);
                $orderProduct->setAttribute('data', $orderProduct->product_data);
                $orderProduct->setAttribute('type', 'custom');
                $orderedProducts[] = $orderProduct;
            }
        }


        //         $users = User::where('role_id', 1)->select('email')->get()->pluck('email')->toArray();
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


    public function checkoutThanks($orderId)
    {
        $order = Order::find($orderId);
        if (!$order->confirmed) {
            return redirect()->route('cart.index');
        }

        \Cart::clear();

        if ($order->orderProducts()->count() > 0) {
            $orderedProducts = [];
            foreach ($order->orderProducts as $orderProduct) {
                $productType = $orderProduct->product_type;
                if ($productType != 'waffle') {
                    $model = 'App\\Models\\' . ucfirst($productType);

                    $product = $model::find($orderProduct->product_id);
                    $product->setAttribute('qty', $orderProduct->count);
                    $product->setAttribute('data', $orderProduct->product_data);
                    $product->setAttribute('product_price', $orderProduct->price);
                    $orderedProducts[] = $product;
                } else {
                    $orderProduct->setAttribute('name', 'Вафельные рожки');
                    $orderProduct->setAttribute('qty', $orderProduct->count);
                    $orderProduct->setAttribute('data', $orderProduct->product_data);
                    $orderProduct->setAttribute('type', 'waffle');
                    $orderedProducts[] = $orderProduct;
                }

            }
        }

        if ($order->customCake()->count() > 0) {
            $orderedProducts[] = $order->customCake;
        }

        return view('pages.thanks', compact('order', 'orderedProducts'));
    }
}
