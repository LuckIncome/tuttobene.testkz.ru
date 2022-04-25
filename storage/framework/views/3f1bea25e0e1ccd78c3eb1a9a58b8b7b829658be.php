<?php $__env->startSection('page_title',(strlen($post->title) > 1 ? $post->title : '')); ?>
<?php $__env->startSection('seo_title', (strlen($post->seo_title) > 1 ? $post->seo_title : '')); ?>
<?php $__env->startSection('meta_keywords',(strlen($post->meta_keywords) > 1 ? $post->meta_keywords : '')); ?>
<?php $__env->startSection('meta_description', (strlen($post->meta_description) > 1 ? $post->meta_description : '')); ?>
<?php $__env->startSection('image',$post->thumbic); ?>
<?php $__env->startSection('url',url()->current()); ?>
<?php $__env->startSection('page_class','page'); ?>
<?php $__env->startSection('content'); ?>
    <div class="container inner_container">
        <div class="row inner_head">
            <div class="col">
                <?php echo $__env->make('partials.breadcrumbs',['title'=>$page->title,'titleLink' => route('pages.show',$page->slug), 'subtitle' => $post->title], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>
            <h1><?php echo e($post->title); ?></h1>
        </div>
        <div class="row article_inner">
            <div class="col-lg-5">
                <div class="image_article_inner sticky-lg-top">
                    <picture>
                        <source srcset="<?php echo e($post->webpImage); ?>" type="image/webp"/>
                        <source srcset="<?php echo e(Voyager::image($post->image)); ?>" type="image/jpg"/>
                        <img src="<?php echo e(Voyager::image($post->image)); ?>" alt="<?php echo e($post->title); ?>">
                    </picture>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="date_article"><?php echo e($post->created_at->translatedFormat('d F Y')); ?></div>
                <div class="clearfix"></div>
                <?php echo $post->body; ?>

            </div>
        </div>
        <div class="row align-items-center zag ">
            <div class="col text-center other_news_zag">
                <b>Читайте также</b>
            </div>
        </div>
        <div class="row other_news">
            <?php $__currentLoopData = $posts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $otherPost): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="col-sm-6 col-lg-3">
                    <div class="article">
                        <div class="article_img">
                            <a href="<?php echo e(route('posts.show',$otherPost)); ?>">
                                <picture>
                                    <source srcset="<?php echo e($otherPost->webpImage); ?>" type="image/webp"/>
                                    <source srcset="<?php echo e(Voyager::image($otherPost->image)); ?>" type="image/jpg"/>
                                    <img src="<?php echo e(Voyager::image($otherPost->image)); ?>" alt="<?php echo e($otherPost->title); ?>">
                                </picture>
                            </a>
                        </div>
                        <a href="<?php echo e(route('posts.show',$otherPost)); ?>"><?php echo e($otherPost->title); ?></a>
                        <div class="clearfix"></div>
                        <?php echo e($otherPost->created_at->translatedFormat('d F Y')); ?>

                    </div>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/users/0/004/domains/tutto.testkz.ru/resources/views/posts/show.blade.php ENDPATH**/ ?>