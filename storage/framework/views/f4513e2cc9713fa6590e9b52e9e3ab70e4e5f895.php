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
        <div class="row justify-content-between about_text">
            <?php $__currentLoopData = $mainBlocks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $block): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="col-lg-6 about_img <?php if($loop->first): ?> order-1 order-lg-1 <?php else: ?> order-3 order-lg-4 <?php endif; ?>">
                    <picture>
                        <source srcset="<?php echo e($block->webpImage); ?>" type="image/webp"/>
                        <source srcset="<?php echo e(Voyager::image($block->image)); ?>" type="image/jpg"/>
                        <img src="<?php echo e(Voyager::image($block->image)); ?>" alt="<?php echo e($page->title); ?>">
                    </picture>
                </div>
                <div class="col-lg-6 <?php if($loop->first): ?> order-1 order-lg-2 <?php else: ?> order-4 order-lg-3 <?php endif; ?>">
                    <?php echo $block->body; ?>

                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            <div class="col-12 order-5">
                <ul class="nav nav-tabs d-flex justify-content-between" id="myTab" role="tablist">
                    <?php $__currentLoopData = $tabBlocks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $tabBlock): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <li class="nav-item" role="presentation">
                            <a class="<?php echo e($loop->first ? 'active' : ''); ?>" id="<?php echo e($page->slug); ?>-tab-<?php echo e($tabBlock->id); ?>" data-bs-toggle="tab" data-bs-target="#<?php echo e($page->slug); ?>-block-<?php echo e($tabBlock->id); ?>" role="tab"
                               aria-controls="<?php echo e($page->slug); ?>-block-<?php echo e($tabBlock->id); ?>" aria-selected="<?php echo e($loop->first ? 'true' : 'false'); ?>"><?php echo e($tabBlock->title); ?></a>
                        </li>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <?php $__currentLoopData = $tabBlocks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $tabBlock): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="tab-pane fade <?php echo e($loop->first ? 'show active' : ''); ?>" id="<?php echo e($page->slug); ?>-block-<?php echo e($tabBlock->id); ?>" role="tabpanel" aria-labelledby="<?php echo e($page->slug); ?>-tab-<?php echo e($tabBlock->id); ?>">
                        <div class="row align-items-center justify-content-between">
                            <div class="col-lg-3 text-center text-lg-start">
                                <picture>
                                    <img src="<?php echo e(Voyager::image($tabBlock->icon)); ?>" alt="">
                                </picture>
                            </div>
                            <div class="col-lg-9">
                                <?php echo $tabBlock->body; ?>

                            </div>
                        </div>
                    </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
        </div>
        <div class="row preim_block">
            <?php $__currentLoopData = $pages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $innerPage): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="col-6 col-lg-3">
                    <div class="preim">
                        <picture>
                            <img src="/img/a_<?php echo e($key+1); ?>.svg" alt="">
                        </picture>
                        <a href="<?php echo e(route('pages.show',$innerPage->slug)); ?>"><?php echo e($innerPage->title); ?></a>
                    </div>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\webdev\htdocs\tuttobene\resources\views/pages/about.blade.php ENDPATH**/ ?>