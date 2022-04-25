<?php $__env->startSection('page_title','Корзина'); ?>
<?php $__env->startSection('seo_title', 'Корзина'); ?>
<?php $__env->startSection('meta_keywords',''); ?>
<?php $__env->startSection('meta_description', ''); ?>
<?php $__env->startSection('image',Voyager::image(setting('site.logo'))); ?>
<?php $__env->startSection('url',url()->current()); ?>
<?php $__env->startSection('page_class','page'); ?>
<?php $__env->startSection('content'); ?>
    <div class="container inner_container">
        <div class="row inner_head">
            <div class="col">
                <?php echo $__env->make('partials.breadcrumbs',['title'=>'Корзина'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>
            <h1>Корзина</h1>
        </div>
        <cart-items></cart-items>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/users/0/004/domains/tutto.testkz.ru/resources/views/cart/index.blade.php ENDPATH**/ ?>