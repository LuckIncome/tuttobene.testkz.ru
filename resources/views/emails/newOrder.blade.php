<!DOCTYPE HTML>
<html>
<head>
    <title>Новый заказ с сайта</title>
</head>
<body>
<h1>Новый заказ # {{$order->id}} от {{$order->name}}</h1>
<br>
<p style="font-weight: 600; font-size: 18px">Личные данные клиента :</p>
<p>ФИО : {{$order->name}}</p>
<p>Телефон : {{$order->phone}}</p>
<p>Доставка : {{$order->delivery == 'self' ? 'Самовывоз' : 'Доставка'}}</p>
<p>Оплата : {{$order->payment == 'card' ? 'Онлайн оплата' : ($order->payment == 'cash' ? 'Наличными' : 'Счет на оплату')}}</p>
{{--<p>Email : {{$order->email}}</p>--}}
<p>Сумма заказа : {{number_format($order->amount,0,","," ")}} тг</p>
<table style="margin-bottom: 20px;width: 80%">
    @foreach($products as $product)
        <tr>
            <td style="border: 1px solid #ccc;width: 110px">
                <img style="width: 100px"
                     src="{{ $product->type != 'custom' ? ($product->type != 'waffle' ? \Voyager::image($product->image) : env('APP_URL').'/img/waffle_cone.svg') : env('APP_URL').'/img/ic_2.svg'}}"
                     class=""/>
            </td>
            <td style="border: 1px solid #ccc">
                <p style="font-weight: 600;">{{ $product->name }}</p>
                <p>{!! $product->data !!}</p>
            </td>
            <td style="border: 1px solid #ccc">
                <div>
                    <p style="font-weight: 600;">{{ $product->qty }} шт</p>
                </div>
            <td style="border: 1px solid #ccc">
                <p style="font-weight: 600;">{{number_format($product->price,0,","," ")}} тг</p>
            </td>
        </tr>
    @endforeach
</table>
</body>
</html>
