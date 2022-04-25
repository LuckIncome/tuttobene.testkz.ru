<!DOCTYPE HTML>
<html>
<head>
    <title>Новый заказ с сайта</title>
</head>
<body>
<h1>Новый заказ # <?php echo e($order->id); ?> от <?php echo e($order->name); ?></h1>
<br>
<p style="font-weight: 600; font-size: 18px">Личные данные клиента :</p>
<p>ФИО : <?php echo e($order->name); ?></p>
<p>Телефон : <?php echo e($order->phone); ?></p>
<p>Доставка : <?php echo e($order->delivery == 'self' ? 'Самовывоз' : 'Доставка'); ?></p>
<p>Оплата : <?php echo e($order->payment == 'card' ? 'Онлайн оплата' : ($order->payment == 'cash' ? 'Наличными' : 'Счет на оплату')); ?></p>

<p>Сумма заказа : <?php echo e(number_format($order->amount,0,","," ")); ?> тг</p>
<table style="margin-bottom: 20px;width: 80%">
    <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <tr>
            <td style="border: 1px solid #ccc;width: 110px">
                <img style="width: 100px"
                     src="<?php echo e($product->type != 'custom' ? ($product->type != 'waffle' ? \Voyager::image($product->image) : env('APP_URL').'/img/waffle_cone.svg') : env('APP_URL').'/img/ic_2.svg'); ?>"
                     class=""/>
            </td>
            <td style="border: 1px solid #ccc">
                <p style="font-weight: 600;"><?php echo e($product->name); ?></p>
                <p><?php echo $product->data; ?></p>
            </td>
            <td style="border: 1px solid #ccc">
                <div>
                    <p style="font-weight: 600;"><?php echo e($product->qty); ?> шт</p>
                </div>
            <td style="border: 1px solid #ccc">
                <p style="font-weight: 600;"><?php echo e(number_format($product->price,0,","," ")); ?> тг</p>
            </td>
        </tr>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
</table>
</body>
</html>
<?php /**PATH /home/users/0/004/domains/tutto.testkz.ru/resources/views/emails/newOrder.blade.php ENDPATH**/ ?>