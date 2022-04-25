<?php $__env->startSection('page_title',(strlen($product->title) > 1 ? $product->title : '')); ?>
<?php $__env->startSection('seo_title', (strlen($product->seo_title) > 1 ? $product->seo_title : '')); ?>
<?php $__env->startSection('meta_keywords',(strlen($product->meta_keywords) > 1 ? $product->meta_keywords : '')); ?>
<?php $__env->startSection('meta_description', (strlen($product->meta_description) > 1 ? $product->meta_description : '')); ?>
<?php $__env->startSection('image',$product->thumbic); ?>
<?php $__env->startSection('url',url()->current()); ?>
<?php $__env->startSection('page_class','page'); ?>
<?php $__env->startSection('content'); ?>
    <div class="container inner_container">
        <div class="row inner_head">
            <div class="col">
                <?php echo $__env->make('partials.breadcrumbs',[
                             'title'=>'Торты из мороженого',
                             'titleLink' => route('products.index',\App\Models\Icecream::CAKE),
                             'subtitle' => $product->title
                             ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>
            <h1><?php echo e($product->title); ?></h1>
        </div>
        <div class="row justify-content-between align-items-start">
            <div class="col-lg-5 col-xl-4 tovar_inner_image">
                <div class=" sticky-lg-top">
                    <a href="<?php echo e(Voyager::image($product->image)); ?>" data-fancybox="gallery"
                       data-caption="<?php echo e($product->title); ?>">
                        <picture>
                            <source srcset="<?php echo e($product->webpImage); ?>" type="image/webp"/>
                            <source srcset="<?php echo e(Voyager::image($product->image)); ?>" type="image/jpg"/>
                            <img src="<?php echo e(Voyager::image($product->image)); ?>" alt="<?php echo e($product->title); ?>">
                        </picture>
                    </a>
                </div>
            </div>
            <add-to-cart-cake
                product-id="<?php echo e($product->id); ?>"
                product-price="<?php echo e($product->price); ?>"
                product-type="<?php echo e(\App\Models\Icecream::CAKE); ?>"
                max-weight="<?php echo e($product->max_weight); ?>"
                min-weight="<?php echo e($product->min_weight); ?>"
            ></add-to-cart-cake>
            <div class="col-lg-6 offset-lg-6 col-xl-3 offset-xl-0">
                <?php echo $product->body; ?>

            </div>
        </div>
        <div class="row preim_block">
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="/img/p_1.svg" alt="">
                    </picture>
                    Регулярные поставки
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="/img/p_2.svg" alt="">
                    </picture>
                    Всегда свежее мороженое
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="/img/p_3.svg" alt="">
                    </picture>
                    Алматинский продукт
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="/img/p_1.svg" alt="">
                    </picture>
                    Регулярные поставки
                </div>
            </div>
        </div>
        <div class="row tovar_inner_4">
            <div class="col-12 text-center zag">
                Смотрите также
            </div>
            <div class="col-12">
                <div class="owl-carousel owl-carousel3 owl-theme">
                    <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $otherProduct): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="item">
                            <div class="tovar_image">
                                <div class="tovar_info">
                                    <div class="container-fluid">
                                        <div class="row align-items-md-center text-end text-md-center">
                                            <div class="col">
                                                <div>
                                                    <a href="<?php echo e(route('products.show',[\App\Models\Icecream::CAKE, $otherProduct->slug])); ?>">Подробнее</a>
                                                    <a href="<?php echo e(route('products.show',[\App\Models\Icecream::CAKE, $otherProduct->slug])); ?>"></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <picture>
                                    <source srcset="<?php echo e($otherProduct->webpImage); ?>" type="image/webp"/>
                                    <source srcset="<?php echo e(Voyager::image($otherProduct->image)); ?>" type="image/jpg"/>
                                    <img src="<?php echo e(Voyager::image($otherProduct->image)); ?>"
                                         alt="<?php echo e($otherProduct->title); ?>">
                                </picture>
                            </div>
                            <a href="<?php echo e(route('products.show',[\App\Models\Icecream::CAKE, $otherProduct->slug])); ?>"
                               class="tovar_name_link"><?php echo e($otherProduct->title); ?></a>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\webdev\htdocs\tuttobene\resources\views/catalog/cake.blade.php ENDPATH**/ ?>