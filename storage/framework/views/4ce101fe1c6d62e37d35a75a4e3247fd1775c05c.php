<?php $__env->startSection('page_title','Ожидание оплаты'); ?>
<?php $__env->startSection('seo_title', 'Ожидание оплаты'); ?>
<?php $__env->startSection('meta_keywords','Ожидание оплаты'); ?>
<?php $__env->startSection('meta_description', 'Ожидание оплаты'); ?>
<?php $__env->startSection('image',Voyager::image(setting('site.logo'))); ?>
<?php $__env->startSection('url',url()->current()); ?>
<?php $__env->startSection('page_class','page'); ?>
<?php $__env->startSection('content'); ?>
    <div class="container inner_container">
        <div class="row inner_head">
            <div class="col">
                <?php echo $__env->make('partials.breadcrumbs',['title'=>'Ожидание оплаты'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>
            <h1>Ожидание оплаты</h1>
        </div>
        <div class="row text_page">
            <check-payment-status order-id="<?php echo e($orderId); ?>" payment-id="<?php echo e($paymentId); ?>"></check-payment-status>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/users/0/004/domains/tutto.testkz.ru/resources/views/cart/awaiting.blade.php ENDPATH**/ ?>