<?php $__env->startSection('page_title','Торты из мороженого'); ?>
<?php $__env->startSection('seo_title', 'Торты из мороженого'); ?>
<?php $__env->startSection('meta_keywords','Торты из мороженого'); ?>
<?php $__env->startSection('meta_description', 'Торты из мороженого'); ?>
<?php $__env->startSection('image',Voyager::image(setting('site.logo'))); ?>
<?php $__env->startSection('url',url()->current()); ?>
<?php $__env->startSection('page_class','page'); ?>
<?php $__env->startSection('content'); ?>
    <div class="container inner_container">
        <div class="row inner_head">
            <div class="col">
                <?php echo $__env->make('partials.breadcrumbs',['title'=>'Торты из мороженого'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>
            <h1>Торты из мороженого</h1>
        </div>
        <div class="row inner_catalog justify-content-start">
            <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="col-6 col-lg-4 col-xl-3">
                    <div class="tovar_inner_block">
                        <div class="tovar_image">
                            <div class="tovar_info">
                                <div class="container-fluid">
                                    <div class="row align-items-md-center text-end text-md-center">
                                        <div class="col">
                                            <div>
                                                <a href="<?php echo e(route('products.show',[\App\Models\Icecream::CAKE, $product->slug])); ?>">Подробнее</a>
                                                <a href="<?php echo e(route('products.show',[\App\Models\Icecream::CAKE, $product->slug])); ?>"></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <picture>
                                <source srcset="<?php echo e($product->webpImage); ?>" type="image/webp"/>
                                <source srcset="<?php echo e(Voyager::image($product->image)); ?>" type="image/jpg"/>
                                <img src="<?php echo e(Voyager::image($product->image)); ?>"
                                     alt="<?php echo e($product->title); ?>">
                            </picture>
                        </div>
                    </div>
                    <a href="<?php echo e(route('products.show',[\App\Models\Icecream::CAKE, $product->slug])); ?>"
                       class="tovar_name_link"><?php echo e($product->title); ?></a>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

            <?php if(!$products->hasMorePages()): ?>
                <div class="col-6 col-lg-4 col-xl-3">
                    <a href="<?php echo e(route('pages.show',$constructorPage->slug)); ?>">
                        <div class="tovar_inner_block">
                            <div class="tovar_image">
                                <div class="tovar_info tort_add">
                                    <div class="container-fluid">
                                        <div class="row align-items-center text-center">
                                            <div class="col">
                                                <picture>
                                                    <img src="/img/tort_add.svg" alt="">
                                                </picture>
                                                <span>Создай свой торт</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            <?php endif; ?>
        </div>
        <div class="row">
            <div class="col pagination">
                <?php echo e($products->links('vendor.pagination.bootstrap-4')); ?>

            </div>
        </div>
        <div class="row preim_block">
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="/img/fresh_icon.png" alt="">
                    </picture>
                    Свежо
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="/img/unusually_icon.png" alt="">
                    </picture>
                   Необычно
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="/img/original_icon.png" alt="">
                    </picture>
                    Оригинально
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="/img/tasty_icon.png" alt="">
                    </picture>
                    Необыкновенно вкусно
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/users/0/004/domains/tutto.testkz.ru/resources/views/catalog/cakes.blade.php ENDPATH**/ ?>