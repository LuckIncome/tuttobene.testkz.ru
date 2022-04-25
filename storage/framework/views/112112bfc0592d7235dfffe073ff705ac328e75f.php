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
                <?php echo $__env->make('partials.breadcrumbs',['title'=>$parentPage->title,'titleLink' => route('pages.show',$parentPage->slug), 'subtitle' => $page->title], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>
            <h1><?php echo e($page->title); ?></h1>
        </div>
        <div class="row cert_block">
            <?php $__currentLoopData = $partners; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $partner): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="col-6 col-md-4 col-lg-3 text-center">
                    <div class="partner">
                        <div class="partner_image">
                            <a href="<?php echo e($partner->link); ?>">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <picture>
                                            <source srcset="<?php echo e($partner->webpImage); ?>" type="image/webp"/>
                                            <source srcset="<?php echo e(Voyager::image($partner->image)); ?>" type="image/jpg"/>
                                            <img src="<?php echo e(Voyager::image($partner->image)); ?>" alt="<?php echo e($partner->name); ?>">
                                        </picture>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <a href="<?php echo e($partner->link); ?>" class="partner_link"><?php echo e($partner->name); ?></a>
                    </div>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
        <div class="row">
            <div class="col text-center question_block">
                <b>По вопросам о партнерстве</b>
                <p>Ответим на любые вопросы о взаимовыгодном сотрудничестве.</p>
                <p><a href="https://api.whatsapp.com/send?phone=<?php echo e((int) filter_var(setting('site.whatsapp'), FILTER_SANITIZE_NUMBER_INT)); ?>"><?php echo e(setting('site.whatsapp')); ?></a> (WhatsApp)</p>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/users/0/004/domains/tutto.testkz.ru/resources/views/pages/partners.blade.php ENDPATH**/ ?>