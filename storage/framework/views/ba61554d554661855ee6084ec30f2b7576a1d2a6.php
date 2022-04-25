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
        </div>
        <div class="freedom-fluid">
            <div class="row inner_block_1 s_1">
                <div class="col inner_block_1_text" style="background: url(<?php echo e(Voyager::image($mainBlock->image)); ?>) center top no-repeat;">
                    
                        <div class=" freedom-block d-none d-md-block">
                            <div class="row">
                                <div class="col-lg-6 text-lg-start text-center">
                                    <h2><?php echo e($page->title); ?></h2>
                                    <p><?php echo e($mainBlock->title); ?></p>
                                    <a download="Презентация Франшизы Tutto Bene"
                                       href="<?php echo e(Voyager::image(json_decode(setting('site.presentation'))[0]->download_link)); ?>" class="down_button">Скачать
                                        презентацию</a>
                                </div>
                            
                             </div>
                        </div>
                </div>
            </div>
        </div>
        
        <div class="container d-md-none mobile_slide_text">
            <div class="row">
                <div class="col text-center">
                    <h2><?php echo e($page->title); ?></h2>
                    <p><?php echo e($mainBlock->title); ?></p>
                    <a download="Презентация Франшизы Tutto Bene"
                        href="<?php echo e(Voyager::image(json_decode(setting('site.presentation'))[0]->download_link)); ?>">Скачать
                        презентацию</a>
                </div>
            </div>
        </div>
        <?php if($textBlocks && $textBlocks->count() > 0): ?>
            <div class="row franshiza_acc">
                <div class="accordion" id="accordionExample">
                    <?php $__currentLoopData = $textBlocks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $textBlock): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="heading<?php echo e(\Str::slug($textBlock->title)); ?>">
                                <button class="accordion-button <?php if(!$loop->first): ?> collapsed <?php endif; ?>" type="button"
                                        data-bs-toggle="collapse"
                                        data-bs-target="#collapse<?php echo e(\Str::slug($textBlock->title)); ?>"
                                        aria-expanded="<?php echo e($loop->first ? 'true' : 'false'); ?>"
                                        aria-controls="collapse<?php echo e(\Str::slug($textBlock->title)); ?>">
                                    <?php echo e($textBlock->title); ?>

                                </button>
                            </h2>
                            <div id="collapse<?php echo e(\Str::slug($textBlock->title)); ?>"
                                 class="accordion-collapse collapse <?php if($loop->first): ?> show <?php endif; ?>"
                                 aria-labelledby="heading<?php echo e(\Str::slug($textBlock->title)); ?>"
                                 data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <div class="row justify-content-between align-items-center">
                                        <div class="col-lg-7">

                                                <div class="franshiza_acc_text double">
                                                    <div style="font-size: 20px;
                                                                line-height: 25px;
                                                                color: #8f2e1f;
                                                                margin: 15px 0;
                                                                text-transform: uppercase;"
                                                    > <?php echo e($textBlock->title); ?> </div>
                                                    <?php echo $textBlock->body; ?>

                                                </div>

                                               <div class="franshiza_acc_text double">
                                                    <div style="font-size: 20px;
                                                                line-height: 25px;
                                                                color: #8f2e1f;
                                                                margin: 15px 0;
                                                                text-transform: uppercase;"
                                                    > <?php echo e($textBlock->title_two); ?> </div>
                                                    <?php echo $textBlock->body_two; ?>

                                                </div>
              
                                        </div>
                                        <div class="col-lg-5 franshiza_acc_text_more text-center mt-3">
                                            <a href="#" data-bs-toggle="modal" data-bs-target="#form2">Получить
                                                персональную
                                                консультацию</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
        <?php endif; ?>
        <div class="row">
            <div class="col text-center question_block">
                <b>Остались вопросы?</b>
                <p>Ответим на любые вопросы о взаимовыгодном сотрудничестве.</p>
                <p>
                    <a href="https://api.whatsapp.com/send?phone=<?php echo e((int) filter_var(setting('site.whatsapp'), FILTER_SANITIZE_NUMBER_INT)); ?>"><?php echo e(setting('site.whatsapp')); ?></a>
                    (WhatsApp)</p>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/users/0/004/domains/tutto.testkz.ru/resources/views/pages/franchise.blade.php ENDPATH**/ ?>