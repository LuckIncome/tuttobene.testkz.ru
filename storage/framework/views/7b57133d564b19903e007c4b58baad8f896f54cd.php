<?php $__env->startSection('page_title','Ваш заказ оформлен'); ?>
<?php $__env->startSection('seo_title', 'Ваш заказ оформлен'); ?>
<?php $__env->startSection('meta_keywords','Ваш заказ оформлен'); ?>
<?php $__env->startSection('meta_description', 'Ваш заказ оформлен'); ?>
<?php $__env->startSection('image',Voyager::image(setting('site.logo'))); ?>
<?php $__env->startSection('url',url()->current()); ?>
<?php $__env->startSection('page_class','page'); ?>
<?php $__env->startSection('content'); ?>
    <div class="container inner_container">
        <div class="row inner_head">
            <div class="col">
                <ul>
                    <li><a href="#">Главная</a></li>
                    <li>Ваш заказ оформлен</li>
                </ul>
            </div>
            <h1>Ваш заказ оформлен</h1>
        </div>
        <div class="row align-items-center thank">
            <div class="col text-center">
                <picture>
                    <img src="/img/thank.svg" alt="">
                </picture>
                <h2>Спасибо!</h2>
                <p>Ваш заказ успешно оформлен!</p>
                <p>Вся информация по Вашему заказу была отправлена на Вашу почту.</p>
                <a href="/">Вернуться на главную страницу</a>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\webdev\htdocs\tuttobene\resources\views/pages/thanks.blade.php ENDPATH**/ ?>