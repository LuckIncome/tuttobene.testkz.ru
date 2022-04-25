<?php $__env->startSection('page_title',(strlen($page->title) > 1 ? $page->title : '')); ?>
<?php $__env->startSection('seo_title', (strlen($page->seo_title) > 1 ? $page->seo_title : '')); ?>
<?php $__env->startSection('meta_keywords',(strlen($page->meta_keywords) > 1 ? $page->meta_keywords : '')); ?>
<?php $__env->startSection('meta_description', (strlen($page->meta_description) > 1 ? $page->meta_description : '')); ?>
<?php $__env->startSection('image',$page->thumbic); ?>
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
        <div class="row justify-content-center">
            <?php $__currentLoopData = $pages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $innerPage): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="col-md-6 col-lg-4">
                    <div class="sotr" style="background: url(<?php echo e(Voyager::image($innerPage->image)); ?>) center no-repeat;">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col">
                                    <span><?php echo e($innerPage->title); ?></span>
                                    <p><?php echo e($innerPage->excerpt); ?></p>
                                    <div class="clearfix"></div>
                                    <a href="<?php echo e(route('pages.show',$innerPage->slug)); ?>">Подробнее</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\webdev\htdocs\tuttobene\resources\views/pages/cooperation.blade.php ENDPATH**/ ?>