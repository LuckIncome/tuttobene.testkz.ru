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
        <div class="row inner_news">
            <?php $__currentLoopData = $posts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $post): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="col-sm-6 col-lg-3">
                    <div class="article">
                        <div class="article_img">
                            <a href="<?php echo e(route('posts.show',$post)); ?>">
                                <picture>
                                    <source srcset="<?php echo e($post->webpImage); ?>" type="image/webp"/>
                                    <source srcset="<?php echo e(Voyager::image($post->image)); ?>" type="image/jpg"/>
                                    <img src="<?php echo e(Voyager::image($post->image)); ?>" alt="<?php echo e($post->title); ?>">
                                </picture>
                            </a>
                        </div>
                        <a href="<?php echo e(route('posts.show',$post)); ?>"><?php echo e($post->title); ?></a>
                        <div class="clearfix"></div>
                        <?php echo e($post->created_at->translatedFormat('d F Y')); ?>

                    </div>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
        <div class="row">
            <div class="col pagination">
                <?php echo e($posts->links('vendor.pagination.bootstrap-4')); ?>

            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\webdev\htdocs\tuttobene\resources\views/posts/index.blade.php ENDPATH**/ ?>