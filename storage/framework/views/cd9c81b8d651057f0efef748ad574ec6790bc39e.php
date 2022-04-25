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
                            'title'=>'Мороженое в баночках',
                            'titleLink' => route('products.index',\App\Models\Icecream::ICECREAM),
                            'subtitle' => $product->title
                            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>
            <h1><?php echo e($product->title); ?></h1>
        </div>
        <div class="row justify-content-between align-items-start">
            <div class="col-lg-4 tovar_inner_image">
                <div class="sticky-lg-top">
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
            <div class="col-lg-8 col-xl-7">
                <?php if($product->portions()->count() > 0): ?>
                    <?php $__currentLoopData = $product->portions; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $portion): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <add-to-cart-single
                            icon="<?php echo e(Voyager::image($portion->icon)); ?>"
                            title="<?php echo e($portion->title); ?>"
                            excerpt="<?php echo e($portion->excerpt); ?>"
                            price="<?php echo e(number_format($portion->price,0,'',' ')); ?>"
                            product-id="<?php echo e($product->id); ?>"
                            product-type="<?php echo e(\App\Models\Icecream::ICECREAM); ?>"
                            portion-id="<?php echo e($portion->id); ?>"
                        ></add-to-cart-single>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                <?php endif; ?>
                <div class="row inner_tovar_opisanie">
                    <div class="col">
                        <?php echo $product->body; ?>

                    </div>
                </div>
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
        <div class="row">
            <div class="col-12 text-center zag">
                Смотрите также
            </div>
            <div class="col-12">
                <ul class="nav nav-tabs d-flex justify-content-between" id="myTab" role="tablist">
                    <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <li class="nav-item" role="presentation">
                            <a class="<?php if($loop->first): ?> active <?php endif; ?>" id="<?php echo e($category->slug); ?>-tab" data-bs-toggle="tab"
                               data-bs-target="#<?php echo e($category->slug); ?>" role="tab"
                               aria-controls="<?php echo e($category->slug); ?>"
                               aria-selected="<?php echo e($loop->first ? 'true' : 'false'); ?>"><?php echo e($category->title); ?></a>
                        </li>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <li class="nav-item" role="presentation">
                        <a id="popular-tab" data-bs-toggle="tab" data-bs-target="#popular" role="tab"
                           aria-controls="popular" aria-selected="false">Популярное</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="tab-pane fade <?php if($loop->first): ?> show active <?php endif; ?>" id="<?php echo e($category->slug); ?>"
                             role="tabpanel"
                             aria-labelledby="<?php echo e($category->slug); ?>-tab">
                            <div class="owl-carousel owl-carousel3 owl-theme">
                                <?php $__currentLoopData = $category->limitedIcecreams; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $otherProduct): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <div class="item">
                                        <div class="tovar_image">
                                            <div class="tovar_info">
                                                <div class="container-fluid">
                                                    <div class="row align-items-md-center text-end text-md-center">
                                                        <div class="col">
                                                            <div>
                                                                <a href="<?php echo e(route('products.show',[\App\Models\Icecream::ICECREAM, $otherProduct->slug])); ?>">Подробнее</a>
                                                                <?php if($otherProduct->portions()->count() > 0): ?>
                                                                    <add-to-cart
                                                                        product-type="<?php echo e(\App\Models\Icecream::ICECREAM); ?>"
                                                                        product-id="<?php echo e($otherProduct->id); ?>"
                                                                        portion-id="<?php echo e($otherProduct->defaultPortion()->first()->id); ?>"
                                                                    ></add-to-cart>
                                                                <?php endif; ?>
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
                                        <a href="<?php echo e(route('products.show',[\App\Models\Icecream::ICECREAM, $otherProduct->slug])); ?>"
                                           class="tovar_name_link"><?php echo e($otherProduct->title); ?></a>
                                    </div>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <div class="tab-pane fade" id="popular" role="tabpanel" aria-labelledby="popular-tab">
                        <div class="owl-carousel owl-carousel3 owl-theme">
                            <?php $__currentLoopData = $popularProducts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $popularProduct): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="item">
                                    <div class="tovar_image">
                                        <div class="tovar_info">
                                            <div class="container-fluid">
                                                <div class="row align-items-md-center text-end text-md-center">
                                                    <div class="col">
                                                        <div>
                                                            <a href="<?php echo e(route('products.show',[\App\Models\Icecream::ICECREAM, $popularProduct->slug])); ?>">Подробнее</a>
                                                            <?php if($popularProduct->portions()->count() > 0): ?>
                                                                <add-to-cart
                                                                    product-type="<?php echo e(\App\Models\Icecream::ICECREAM); ?>"
                                                                    product-id="<?php echo e($popularProduct->id); ?>"
                                                                    portion-id="<?php echo e($popularProduct->defaultPortion()->first()->id); ?>"
                                                                ></add-to-cart>
                                                            <?php endif; ?>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <picture>
                                            <source srcset="<?php echo e($popularProduct->webpImage); ?>" type="image/webp"/>
                                            <source srcset="<?php echo e(Voyager::image($popularProduct->image)); ?>" type="image/jpg"/>
                                            <img src="<?php echo e(Voyager::image($popularProduct->image)); ?>"
                                                 alt="<?php echo e($popularProduct->title); ?>">
                                        </picture>
                                    </div>
                                    <a href="<?php echo e(route('products.show',[\App\Models\Icecream::ICECREAM, $popularProduct->slug])); ?>"
                                       class="tovar_name_link"><?php echo e($popularProduct->title); ?></a>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\webdev\htdocs\tuttobene\resources\views/catalog/ice-cream.blade.php ENDPATH**/ ?>