<?php $__env->startSection('page_title', __('voyager::generic.'.(isset($dataTypeContent->id) ? 'edit' : 'add')).' '.$dataType->display_name_singular); ?>

<?php $__env->startSection('css'); ?>
    <style>
        .panel .mce-panel {
            border-left-color: #fff;
            border-right-color: #fff;
        }

        .panel .mce-toolbar,
        .panel .mce-statusbar {
            padding-left: 20px;
        }

        .panel .mce-edit-area,
        .panel .mce-edit-area iframe,
        .panel .mce-edit-area iframe html {
            padding: 0 10px;
            min-height: 350px;
        }

        .mce-content-body {
            color: #555;
            font-size: 14px;
        }

        .panel.is-fullscreen .mce-statusbar {
            position: absolute;
            bottom: 0;
            width: 100%;
            z-index: 200000;
        }

        .panel.is-fullscreen .mce-tinymce {
            height: 100%;
        }

        .panel.is-fullscreen .mce-edit-area,
        .panel.is-fullscreen .mce-edit-area iframe,
        .panel.is-fullscreen .mce-edit-area iframe html {
            height: 100%;
            position: absolute;
            width: 99%;
            overflow-y: scroll;
            overflow-x: hidden;
            min-height: 100%;
        }

        b, strong {
            font-weight: 600;
        }
    </style>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('page_header'); ?>
    <h1 class="page-title">
        <i class="<?php echo e($dataType->icon); ?>"></i>
    </h1>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="page-content container-fluid">
        <form class="form-edit-add" role="form"
              action="<?php if(isset($dataTypeContent->id)): ?><?php echo e(route('orders.update', $dataTypeContent->id)); ?><?php else: ?><?php echo e(route('voyager.orders.store')); ?><?php endif; ?>"
              method="POST" enctype="multipart/form-data">
            <!-- PUT Method if we are editing -->
            <?php if(isset($dataTypeContent->id)): ?>
                <?php echo e(method_field("POST")); ?>

            <?php endif; ?>
            <?php echo e(csrf_field()); ?>


            <div class="row">
                <div class="col-md-8">
                    <!-- ### TITLE ### -->
                    <div class="panel">
                        <?php if(count($errors) > 0): ?>
                            <div class="alert alert-danger">
                                <ul>
                                    <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <li><?php echo e($error); ?></li>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </ul>
                            </div>
                        <?php endif; ?>

                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <i class="voyager-dollar"></i> Заказ № <?php echo e($dataTypeContent->id); ?>

                            </h3>
                            <div class="panel-actions">
                                <a class="panel-action voyager-angle-down" data-toggle="panel-collapse"
                                   aria-hidden="true"></a>
                            </div>
                        </div>
                    </div>


                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title"><?php if($dataTypeContent->orderProducts()->count() > 0): ?>
                                    Товары <?php elseif($dataTypeContent->customCake()->count() > 0): ?> Конструктор торта <?php else: ?>
                                    Товары <?php endif; ?> : </h3>
                            <div class="panel-actions">
                                <a class="panel-action voyager-angle-down" data-toggle="panel-collapse"
                                   aria-hidden="true"></a>
                            </div>
                        </div>
                        <div class="panel-body">
                            <?php if($dataTypeContent->orderProducts()->count() > 0): ?>
                                <?php $__currentLoopData = $dataTypeContent->orderProducts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $orderProduct): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php if($orderProduct->product_type !== 'waffle'): ?>
                                        <div class="product"
                                             style="width: 100%;float: left;border-top:1px solid #ccc;padding-top: 10px;margin-bottom: 10px">
                                            <div class="product-info" style="width: 40%;float: left;">
                                                <img
                                                    style="width: 25%;float: left;max-height: 80px;object-fit:scale-down"
                                                    src="<?php echo e(Voyager::image($orderProduct->product->image)); ?>"
                                                    alt="<?php echo e($orderProduct->product->name); ?>">
                                                <div class="info"
                                                     style="width: 40%;float: left;margin-left: 10px;">
                                                    <a href="/admin/<?php echo e($orderProduct->product_type); ?>s/<?php echo e($orderProduct->product->id); ?>">
                                                        <p class="name"><?php echo e($orderProduct->product->title); ?></p>
                                                    </a>
                                                    <div class="attribute">
                                                        <span><?php echo $orderProduct->product_data; ?></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="quantity" style="width: 30%;float: left;margin-top: 20px">
                                                <p class="countText">Кол-во: <b><?php echo e($orderProduct->count); ?></b></p>
                                            </div>
                                            <div class="product-price" style="width: 30%;float: left;margin-top: 20px">
                                                <p class="cost">
                                <span
                                    class="sale-price price">Цена:   <b><?php echo e(number_format($orderProduct->price, 0, '',' ')); ?></b> <span
                                        class="currency">₸</span></span>
                                                </p>
                                            </div>
                                        </div>
                                    <?php else: ?>
                                        <div class="product"
                                             style="width: 100%;float: left;border-top:1px solid #ccc;padding-top: 10px;margin-bottom: 10px">
                                            <div class="product-info" style="width: 40%;float: left;">
                                                <img
                                                    style="width: 25%;float: left;max-height: 80px;object-fit:scale-down"
                                                    src="/img/waffle_cone.svg"
                                                    alt="<?php echo e($orderProduct->product_data); ?>">
                                                <div class="info"
                                                     style="width: 40%;float: left;margin-left: 10px;">
                                                    <p class="name"><?php echo e($orderProduct->product_data); ?></p>
                                                </div>
                                            </div>
                                            <div class="quantity" style="width: 30%;float: left;margin-top: 20px">
                                                <p class="countText">Кол-во: <b><?php echo e($orderProduct->count); ?></b></p>
                                            </div>
                                            <div class="product-price" style="width: 30%;float: left;margin-top: 20px">
                                                <p class="cost">
                                <span
                                    class="sale-price price">Цена:   <b><?php echo e(number_format($orderProduct->price, 0, '',' ')); ?></b> <span
                                        class="currency">₸</span></span>
                                                </p>
                                            </div>
                                        </div>
                                    <?php endif; ?>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                            <?php if($dataTypeContent->customCake()->count() > 0): ?>
                                <?php $__currentLoopData = $dataTypeContent->customCake; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $customCake): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <div class="product"
                                         style="width: 100%;float: left;border-top:1px solid #ccc;padding-top: 10px;margin-bottom: 10px">
                                        <div class="product-info" style="width: 40%;float: left;">
                                            <img style="width: 25%;float: left;max-height: 80px;object-fit:scale-down"
                                                 src="/img/ic_2.svg"
                                                 alt="Конструктор торта">
                                            <div class="info"
                                                 style="width: 40%;float: left;margin-left: 10px;">
                                                <p class="name">Кастомный торт</p>
                                                <div class="attribute">
                                                    <span><?php echo $customCake->product_data; ?></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="quantity" style="width: 30%;float: left;margin-top: 20px">
                                            <span class="countText"><b>Кол-во:</b> <?php echo e($customCake->count); ?></span>
                                            <br>
                                            <span><b>Ярус: </b><?php echo e($customCake->stage); ?></span>
                                            <br>
                                            <span><b>Форма: </b><?php echo e($customCake->shape === 'circle' ? 'Круг' : 'Квадрат'); ?></span>
                                            <br>
                                            <span><b>Бисквит: </b><?php echo e($customCake->biscuit ? 'Да' : 'Нет'); ?></span>
                                            <br>
                                            <?php
                                                $tastesIds = unserialize($customCake->tastes);
                                                $tastes = \App\Models\Icecream::select('id','title')->whereIn('id',$tastesIds)->get();
                                            ?>
                                            <span><b>Вкусы: </b><?php $__currentLoopData = $tastes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $taste): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?> <a style="display: inline"
                                                                                               href="/admin/icecreams/<?php echo e($taste->id); ?>"><?php echo e($taste->title); ?></a> <?php if(!$loop->last): ?>
                                                    ,<?php endif; ?> <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?></span>
                                            <br>
                                        </div>
                                        <div class="product-price" style="width: 30%;float: left;margin-top: 20px">
                                            <p class="cost">
                                <span
                                    class="sale-price price">Цена:   <b><?php echo e(number_format($customCake->price, 0, '',' ')); ?></b> <span
                                        class="currency">₸</span></span>
                                            </p>
                                        </div>
                                        <?php if(strlen($customCake->comments) > 0): ?>
                                            <p style="width:100%;float: left;margin: 10px 0;">
                                                <b>Комментарии:</b> <?php echo e($customCake->comments); ?></p>
                                        <?php endif; ?>
                                    </div>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                            <div class="form-group" style="width: 20%;float: right;">
                                <strong>Сумма заказа: </strong>
                                <p><?php echo e(number_format($dataTypeContent->amount - $dataTypeContent->delivery_price,0,'',' ')); ?>

                                    <span
                                        class="currency">₸</span></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <!-- ### INFO DATA ### -->
                    <div class="panel panel-bordered panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Информация о заказе</h3>
                            <div class="panel-actions">
                                <a class="panel-action voyager-angle-down" data-toggle="panel-collapse"
                                   aria-hidden="true"></a>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <strong>Способ оплаты</strong>
                                <?php if($dataTypeContent->payment == 'cash'): ?>
                                    <p>Наличными при получении</p>
                                <?php elseif($dataTypeContent->payment == 'card'): ?>
                                    <p>Онлайн оплата (Оплачено)</p>
                                <?php else: ?>
                                    <p>Счет на оплату</p>
                                <?php endif; ?>
                            </div>
                            <div class="form-group">
                                <strong>Способ доставки</strong>
                                <p><?php echo e(($dataTypeContent->delivery == 'self') ? 'Самовывоз': 'Доставка'); ?></p>
                            </div>
                            <?php if($dataTypeContent->delivery == 'delivery'): ?>
                                <div class="form-group">
                                    <strong>Сумма доставки:</strong>
                                    <p><b style="color: red"><?php echo $dataTypeContent->delivery_price > 0 ? number_format($dataTypeContent->delivery_price,0,'', ' ') .' <span
                                                class="currency">₸</span>' : 'Бесплатно'; ?> </b></p>
                                </div>
                            <?php endif; ?>
                            <div class="form-group">
                                <strong>Итого</strong>
                                <p style="font-size: 32px"><?php echo e(number_format($dataTypeContent->amount,0,'',' ')); ?> <span
                                        class="currency">₸</span></p>
                            </div>
                            <div class="form-group">
                                <label style="width: 100%;">
                                    <span class="panel-desc">Статус</span>
                                    <select name="status" class="form-control">
                                        <option <?php if($dataTypeContent->status == 1): ?> selected <?php endif; ?> value="1">Новый
                                            заказ
                                        </option>
                                        <option <?php if($dataTypeContent->status == 2): ?> selected <?php endif; ?> value="2">
                                            Выполняется
                                        </option>
                                        <option <?php if($dataTypeContent->status == 3): ?> selected <?php endif; ?> value="3">Выполнен
                                        </option>
                                        <option <?php if($dataTypeContent->status == 4): ?> selected <?php endif; ?> value="4">Отменен
                                        </option>
                                    </select>
                                </label>
                            </div>
                        </div>
                    </div>
                    <!-- ### CLIENT DATA ### -->
                    <div class="panel panel panel-bordered panel-warning">
                        <div class="panel-heading">
                            <h3 class="panel-title">Данные клиента :
                            </h3>
                            <div class="panel-actions">
                                <a class="panel-action voyager-angle-down" data-toggle="panel-collapse"
                                   aria-hidden="true"></a>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <strong>Покупатель :</strong>
                                <p><?php echo e($dataTypeContent->orderEntity ? 'Юридическое лицо' : 'Физическое лицо'); ?></p>
                            </div>
                            <?php if($dataTypeContent->orderEntity): ?>
                                <div class="form-group">
                                    <strong>Название Компании :</strong>
                                    <p><?php echo e($dataTypeContent->orderEntity->name); ?></p>
                                </div>
                                <div class="form-group">
                                    <strong>БИН :</strong>
                                    <p><?php echo e($dataTypeContent->orderEntity->bin); ?></p>
                                </div>
                                <div class="form-group">
                                    <strong>БИК :</strong>
                                    <p><?php echo e($dataTypeContent->orderEntity->bik); ?></p>
                                </div>
                                <div class="form-group">
                                    <strong>ИИК :</strong>
                                    <p><?php echo e($dataTypeContent->orderEntity->iik); ?></p>
                                </div>
                                <?php if(strlen($dataTypeContent->orderEntity->person) > 0): ?>
                                    <div class="form-group">
                                        <strong>Уполномоченное лицо :</strong>
                                        <p><?php echo e($dataTypeContent->orderEntity->person); ?></p>
                                    </div>
                                <?php endif; ?>
                                <div class="form-group">
                                    <strong>Юр.Адрес :</strong>
                                    <p><?php echo e($dataTypeContent->orderEntity->address); ?></p>
                                </div>
                            <?php endif; ?>
                            
                            
                            
                            
                            <div class="form-group">
                                <strong>Имя получателя :</strong>
                                <p><?php echo e($dataTypeContent->name); ?></p>
                            </div>
                            <div class="form-group">
                                <strong>Мобильный телефон:</strong>
                                <p><?php echo e($dataTypeContent->phone); ?></p>
                            </div>
                            <?php if($dataTypeContent->delivery === 'delivery'): ?>
                                <div class="form-group">
                                    <strong>Адрес доставки:</strong>
                                    <p><?php echo e($dataTypeContent->address); ?></p>
                                </div>
                                <div class="form-group">
                                    <strong>Дата доставки:</strong>
                                    <?php
                                        $date = explode(' ', $dataTypeContent->date);
                                        $array = $date;
                                        array_shift($array);
                                        $deliveryDate = \Carbon\Carbon::parse($date[0])->format('d.m.Y'). ' '. implode('', $array);
                                    ?>
                                    <p><?php echo e($deliveryDate); ?></p>
                                </div>
                                <div class="form-group">
                                    <strong>Сумма доставки:</strong>
                                    <p><b style="color: red"><?php echo e($dataTypeContent->delivery_price); ?> <span
                                                class="currency">₸</span></b></p>
                                </div>
                            <?php else: ?>
                                <div class="form-group">
                                    <strong>Пункт самовывоза:</strong>
                                    <p><?php echo e(\App\Models\Branch::find($dataTypeContent->branch_id)->title); ?></p>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>

            <button type="submit" class="btn btn-primary pull-right">
                <?php if(isset($dataTypeContent->id)): ?>Обновить <?php else: ?> <i
                    class="icon wb-plus-circle"></i> Новый заказ <?php endif; ?>
            </button>
        </form>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('javascript'); ?>
    <script>
        $('document').ready(function () {
            $('#slug').slugify();

            <?php if($isModelTranslatable): ?>
            $('.side-body').multilingual({"editing": true});
            <?php endif; ?>
        });
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('voyager::master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/users/0/004/domains/tutto.testkz.ru/resources/views/vendor/voyager/orders/edit-add.blade.php ENDPATH**/ ?>