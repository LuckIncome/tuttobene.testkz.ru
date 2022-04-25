<?php $__env->startSection('page_title',(strlen($page->title) > 1 ? $page->title : '')); ?>
<?php $__env->startSection('seo_title', (strlen($page->seo_title) > 1 ? $page->seo_title : '')); ?>
<?php $__env->startSection('meta_keywords',(strlen($page->meta_keywords) > 1 ? $page->meta_keywords : '')); ?>
<?php $__env->startSection('meta_description', (strlen($page->meta_description) > 1 ? $page->meta_description : '')); ?>
<?php $__env->startSection('image',$page->thumbic); ?>
<?php $__env->startSection('url',url()->current()); ?>
<?php $__env->startSection('page_class','page'); ?>
<?php $__env->startSection('content'); ?>
    <div class="container inner_container">
        <div class="row inner_head" style="margin-bottom: 0px;">
            <div class="col">
                <?php echo $__env->make('partials.breadcrumbs',['title'=>$parentPage->title,'titleLink' => route('pages.show',$parentPage->slug), 'subtitle' => $page->title], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>
            <!--<h1><?php echo e($page->title); ?></h1>-->
        </div>
        <div class="freedom-fluid">
            <div class="row inner_block_1 s_1">
                <div class="col inner_block_1_text"
                     style="background: url(<?php echo e(Voyager::image($mainBlock->image)); ?>) center no-repeat;">
                    <div class=" freedom-block d-none d-md-block">
                        <div class="row">
                            <div class="col">
                                <div class="row align-items-center">
                                    <div class="col-lg-4 text-center">
                                        <picture>
                                            <img src="<?php echo e(Voyager::image($mainBlock->icon)); ?>" style="width: 100%;" alt="">
                                        </picture>
                                    </div>
                                    <div class="col-lg-12 text-center text-lg-start">
                                        <b><?php echo e($mainBlock->title); ?></b>
                                        <?php echo $mainBlock->body; ?>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container d-md-none mobile_slide_text">
            <div class="row">
                <div class="col text-center">
                    <b><?php echo e($mainBlock->title); ?></b>
                    <?php echo $mainBlock->body; ?>

                    <picture>
                        <img src="<?php echo e(Voyager::image($mainBlock->icon)); ?>" style="width: 100%;" alt="">
                    </picture>
                </div>
            </div>
        </div>
        <?php if($textBlocks && $textBlocks->count() > 0): ?>
            <div class="row syrye_preim_block">
                <div class="col-12">
                    Все для приготовления самого вкусного мороженого
                </div>
                <?php $__currentLoopData = $textBlocks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $textBlock): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="col-md-6 col-lg-4">
                        <div class="syrye_preim">
                            <?php echo $textBlock->body; ?>

                        </div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        <?php endif; ?>
        <div class="row syrye_links">
            <div class="col text-center">
                <a href="<?php echo e(setting('site.partners_website')); ?>" target="_blank" class="s_l_1">Перейти на сайт партнеров с описанием продукции</a>
                <div class="clearfix"></div>
                <a href="#" class="s_l_2" data-bs-toggle="modal" data-bs-target="#form1">Получить прайс лист</a>
                <div class="clearfix"></div>
                <a href="#" class="s_l_3" data-bs-toggle="modal" data-bs-target="#form2">Получить консультацию</a>
            </div>
        </div>
        <?php if($iconBlocks && $iconBlocks->count() > 0): ?>
            <div class="row">
                <div class="col-12 sotr_zag_block">
                    <b>Условия сотрудничества</b>
                </div>
                <?php $__currentLoopData = $iconBlocks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $iconBlock): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="col-lg-4">
                        <div class="sort_inner_block">
                            <div class="row">
                                <div class="col">
                                    <div class="row align-items-center">
                                        <div class="col-3 text-center">
                                            <picture>
                                                <img src="<?php echo e(Voyager::image($iconBlock->icon)); ?>" alt="">
                                            </picture>
                                        </div>
                                        <div class="col-9"><?php echo e($iconBlock->title); ?></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        <?php endif; ?>
        <div class="row">
            <div class="col text-center question_block">
                <b>Остались вопросы?</b>
                <p>Ответим на любые вопросы о взаимовыгодном сотрудничестве.</p>
                <p><a href="https://api.whatsapp.com/send?phone=<?php echo e((int) filter_var(setting('site.whatsapp'), FILTER_SANITIZE_NUMBER_INT)); ?>"><?php echo e(setting('site.whatsapp')); ?></a> (WhatsApp)</p>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/users/0/004/domains/tutto.testkz.ru/resources/views/pages/material.blade.php ENDPATH**/ ?>