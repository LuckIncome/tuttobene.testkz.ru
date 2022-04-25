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
                <?php echo $__env->make('partials.breadcrumbs',['title'=>$page->title], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>
            <h1><?php echo e($page->title); ?></h1>
        </div>
        <Constructor
            price="<?php echo e(setting('site.c_price')); ?>"
            max-weight="<?php echo e((float) setting('site.c_maxWeight')); ?>"
            min-weight1="<?php echo e((float) setting('site.c_minWeight_1')); ?>"
            min-weight2="<?php echo e((float) setting('site.c_minWeight_2')); ?>"
            min-weight3="<?php echo e((float) setting('site.c_minWeight_3')); ?>"
        ></Constructor>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\webdev\htdocs\tuttobene\resources\views/catalog/constructor.blade.php ENDPATH**/ ?>