<?php $__env->startSection('page_title',(strlen($page->title) > 1 ? $page->title : '')); ?>
<?php $__env->startSection('seo_title', (strlen($page->seo_title) > 1 ? $page->seo_title : '')); ?>
<?php $__env->startSection('meta_keywords',(strlen($page->meta_keywords) > 1 ? $page->meta_keywords : '')); ?>
<?php $__env->startSection('meta_description', (strlen($page->meta_description) > 1 ? $page->meta_description : '')); ?>
<?php $__env->startSection('image',$page->thumbic); ?>
<?php $__env->startSection('url',url()->current()); ?>
<?php $__env->startSection('page_class','page'); ?>
<?php $__env->startSection('content'); ?>
    <?php $__currentLoopData = $services; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $service): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <div class="modal fade" id="service-<?php echo e($service->id); ?>" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="container-fluid prazdnik_modal">
                            <img src="/img/close2.svg" data-bs-dismiss="modal" alt="" class="close_modal">
                            <div class="row">
                                <div class="col-8 col-lg-4 text-center">
                                    <picture>
                                        <source srcset="<?php echo e($service->webpImage); ?>" type="image/webp"/>
                                        <source srcset="<?php echo e(Voyager::image($service->image)); ?>" type="image/jpg"/>
                                        <img src="<?php echo e(Voyager::image($service->image)); ?>" alt="<?php echo e($service->title); ?>">
                                    </picture>
                                    <b><?php echo e(number_format($service->price,0,'',' ')); ?> тг</b>
                                    <a href="#" data-bs-toggle="modal" data-bs-target="#form-services">Заказать</a>
                                </div>
                                <div class="col-lg-7">
                                    <h2><?php echo e($service->title); ?></h2>
                                    <span><?php echo e($service->excerpt); ?></span>
                                    <b><?php echo e($service->description); ?></b>
                                    <?php echo $service->content; ?>

                                    <?php echo $service->body; ?>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

    <div class="container inner_container">
        <div class="row inner_head">
            <div class="col">
                <?php echo $__env->make('partials.breadcrumbs',['title'=>$page->title], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>
            <h1><?php echo e($page->title); ?></h1>
        </div>
        <div class="row vyezdy_block">
            <?php $__currentLoopData = $services; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $service): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="col-lg-4 text-center">
                    <div class="vyezd_block">
                        <h3><?php echo e($service->title); ?></h3>
                        <span><?php echo e($service->excerpt); ?></span>
                        <b><?php echo e($service->description); ?></b>
                        <picture>
                            <source srcset="<?php echo e($service->webpImage); ?>" type="image/webp"/>
                            <source srcset="<?php echo e(Voyager::image($service->image)); ?>" type="image/jpg"/>
                            <img src="<?php echo e(Voyager::image($service->image)); ?>" alt="<?php echo e($service->title); ?>">
                        </picture>
                        <?php echo $service->content; ?>

                        <a href="#" data-bs-toggle="modal" data-bs-target="#service-<?php echo e($service->id); ?>">Подробнее</a>
                    </div>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\webdev\htdocs\tuttobene\resources\views/pages/services.blade.php ENDPATH**/ ?>