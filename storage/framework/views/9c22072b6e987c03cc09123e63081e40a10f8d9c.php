<?php $__env->startSection('page_title','Мороженое в баночках'); ?>
<?php $__env->startSection('seo_title', 'Мороженое в баночках'); ?>
<?php $__env->startSection('meta_keywords','Мороженое в баночках'); ?>
<?php $__env->startSection('meta_description', 'Мороженое в баночках'); ?>
<?php $__env->startSection('image',Voyager::image(setting('site.logo'))); ?>
<?php $__env->startSection('url',url()->current()); ?>
<?php $__env->startSection('page_class','page'); ?>
<?php $__env->startSection('content'); ?>
    <div class="container inner_container">
        <div class="row inner_head">
            <div class="col">
                <?php echo $__env->make('partials.breadcrumbs',['title'=>'Мороженое в баночках'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>
            <h1>Мороженое в баночках</h1>
        </div>
        <div class="row">
            <div class="col-12">
                <ul class="nav nav-tabs d-flex justify-content-between" id="myTab" role="tablist">
                    <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $cat): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <li class="nav-item" role="presentation">
                            <a href="<?php echo e(route('products.index',[\App\Models\Icecream::ICECREAM, $cat->slug])); ?>"
                               class="<?php if(!is_string($category) && $category->id === $cat->id): ?> active <?php endif; ?>"><?php echo e($cat->title); ?></a>
                        </li>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <li class="nav-item" role="presentation">
                        <a class="<?php if(is_string($category)): ?> active <?php endif; ?>"
                           href="<?php echo e(route('products.index',[\App\Models\Icecream::ICECREAM, 'popular'])); ?>">Популярное</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active"
                         id="<?php echo e(!is_string($category) ? $category->slug : $category); ?>" role="tabpanel"
                         aria-labelledby="<?php echo e(!is_string($category) ? $category->slug : $category); ?>-tab">
                        <div class="row inner_catalog justify-content-center">
                            <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="col-6 col-lg-4 col-xl-3">
                                    <div class="tovar_inner_block">
                                        <div class="tovar_image">
                                            <div class="tovar_info">
                                                <div class="container-fluid">
                                                    <div class="row align-items-md-center text-end text-md-center">
                                                        <div class="col">
                                                            <div>
                                                                <a href="<?php echo e(route('products.show',[\App\Models\Icecream::ICECREAM, $product->slug])); ?>">Подробнее</a>
                                                                <?php if($product->portions()->count() > 0): ?>
                                                                    <add-to-cart
                                                                        btn-class="<?php echo e($product->defaultPortion()->count()
&& \Cart::has(\App\Models\Icecream::ICECREAM.'_'.$product->id .'_'.$product->defaultPortion->first()->id) ? 'added' : ''); ?>"
                                                                        product-type="<?php echo e(\App\Models\Icecream::ICECREAM); ?>"
                                                                        product-id="<?php echo e($product->id); ?>"
                                                                        portion-id="<?php echo e($product->defaultPortion()->first()->id); ?>"
                                                                    ></add-to-cart>
                                                                <?php endif; ?>
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
                                    <a href="<?php echo e(route('products.show',[\App\Models\Icecream::ICECREAM, $product->slug])); ?>"
                                       class="tovar_name_link"><?php echo e($product->title); ?></a>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                        <?php if(!is_string($category) && $category->infos): ?>
                            <div class="row preim_block">
                                <?php $__currentLoopData = $category->infos; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $info): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <div class="col-6 col-lg-3">
                                        <div class="preim">
                                            <picture>
                                                <?php if(!preg_match('/(\.svg)$/i', $info->image)): ?> <source srcset="<?php echo e($info->webpImage); ?>" type="image/webp"/> <?php endif; ?>
                                                <source srcset="<?php echo e(Voyager::image($info->image)); ?>" type="image/jpg"/>
                                                <img src="<?php echo e(Voyager::image($info->image)); ?>"
                                                     alt="<?php echo e($info->text); ?>">
                                            </picture>
                                            <?php echo e($info->text); ?>

                                        </div>
                                    </div>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                        <?php else: ?>
                            <div class="row preim_block">
                                <div class="col-6 col-lg-3">
                                    <div class="preim">
                                        <picture>
                                            <img src="/storage/image-texts/October2021/qpCG1pbVlxSr7J018AXt.png" alt="">
                                        </picture>
                                        Всегда свежее
                                    </div>
                                </div>
                                <div class="col-6 col-lg-3">
                                    <div class="preim">
                                        <picture>
                                            <img src="/img/natural.png" alt="">
                                        </picture>
                                        Натуральные ингредиенты
                                    </div>
                                </div>
                                <div class="col-6 col-lg-3">
                                    <div class="preim">
                                        <picture>
                                            <img src="/storage/image-texts/October2021/TZDvRhq3Tm7pC9paTSp8.png" alt="">
                                        </picture>
                                        Всего 35% воздуха
                                    </div>
                                </div>
                                <div class="col-6 col-lg-3">
                                    <div class="preim">
                                        <picture>
                                            <img src="/storage/image-texts/October2021/Z2jzK1B8mc5JdPG355gM.png" alt="">
                                        </picture>
                                        Содержание жира 0-11%
                                    </div>
                                </div>
                            </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col pagination">
                <?php echo e($products->links('vendor.pagination.bootstrap-4')); ?>

            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/users/0/004/domains/tutto.testkz.ru/resources/views/catalog/ice-creams.blade.php ENDPATH**/ ?>