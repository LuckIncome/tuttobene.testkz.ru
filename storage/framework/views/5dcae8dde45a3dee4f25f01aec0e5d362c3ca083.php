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
        <div class="row contacts_block">
            <div class="col-lg-3">
                <picture>
                    <img src="<?php echo e(Voyager::image(setting('site.logo'))); ?>" alt="">
                </picture>
            </div>
            <div class="col-lg-3 text-center text-lg-start">
                <?php echo $mainBranch->body; ?>

            </div>
            <div class="col-lg-6">
                <form class="contact-form" action="<?php echo e(route('callback')); ?>" method="post">
                    <?php echo csrf_field(); ?>
                    <div class="row text-lg-start text-center">
                        <div class="col-lg-6">
                            <input type="text" name="name" placeholder="Имя *" required="">
                        </div>
                        <div class="col-lg-6">
                            <input type="text" name="phone" class="phonee" placeholder="Телефон *" required="">
                        </div>
                        <div class="col-12">
                            <textarea name="comments" placeholder="Сообщение" required></textarea>
                        </div>
                        <div class="col-12">
                            <input type="hidden" name="type" value="Страница Контакты">
                            <input type="submit" class="send" value="Отправить сообщение">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="row contacts_filialy">
            <div class="col">
                <div class="accordion" id="accordionExample">
                    <?php $__currentLoopData = $branches; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $branch): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="heading-<?php echo e($branch->id); ?>">
                                <button class="accordion-button <?php if(!$loop->first): ?> collapsed <?php endif; ?>" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#collapse-<?php echo e($branch->id); ?>" aria-expanded="<?php echo e($loop->first ? 'true' : 'false'); ?>" aria-controls="collapse-<?php echo e($branch->id); ?>">
                                    <picture>
                                        <img src="<?php echo e(Voyager::image($branch->logo)); ?>" alt="">
                                    </picture>
                                    <?php echo e($branch->title); ?>

                                </button>
                            </h2>
                            <div id="collapse-<?php echo e($branch->id); ?>" class="accordion-collapse collapse <?php echo e($loop->first ? 'show' : ''); ?>" aria-labelledby="heading-<?php echo e($branch->id); ?>"
                                 data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <div class="row align-items-center">
                                        <div class="col-lg-4 offset-lg-1">
                                            <?php echo $branch->body; ?>

                                        </div>
                                        <div class="col-lg-6 offset-lg-1">
                                            <a href="<?php echo e(Voyager::image($branch->image)); ?>" data-fancybox="gallery"
                                               data-caption="<?php echo e($branch->title); ?>">
                                                <picture>
                                                    <source srcset="<?php echo e($branch->webpImage); ?>" type="image/webp"/>
                                                    <source srcset="<?php echo e(Voyager::image($branch->image)); ?>" type="image/jpg"/>
                                                    <img src="<?php echo e(Voyager::image($branch->image)); ?>" alt="<?php echo e($branch->title); ?>">
                                                </picture>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/users/0/004/domains/tutto.testkz.ru/resources/views/pages/contacts.blade.php ENDPATH**/ ?>