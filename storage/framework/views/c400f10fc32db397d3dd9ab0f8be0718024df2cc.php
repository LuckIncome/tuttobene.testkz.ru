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
        <div class="row inner_block_1">
            <div class="col inner_block_1_text"
                 style="background: url(<?php echo e(Voyager::image($blocks[1]->first()->image)); ?>) center no-repeat;">
                <div class="row">
                    <div class="col-lg-8">
                        <h2><?php echo e($blocks[1]->first()->title); ?></h2>
                        <?php echo $blocks[1]->first()->body; ?>

                    </div>
                </div>
            </div>
        </div>
        <?php
            $blocks[1]->shift();
        ?>
        <div class="row preim_block">
            <?php $__currentLoopData = $blocks[1]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $block): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="col-6 col-lg-3">
                    <div class="preim">
                        <picture>
                            <img src="<?php echo e(Voyager::image($block->icon)); ?>" alt="">
                        </picture>
                        <?php echo e($block->title); ?>

                    </div>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
        <div class="row">
            <div class="col-12 text-center zag">
                Описание сортов
            </div>
            <div class="col-12">
                <ul class="nav nav-tabs d-flex justify-content-between" id="myTab" role="tablist">
                    <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$productType): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <li class="nav-item" role="presentation">
                            <a class="<?php echo e($loop->first ? 'active' : ''); ?>" id="<?php echo e($key); ?>-tab"
                               data-bs-toggle="tab" data-bs-target="#<?php echo e($key); ?>" role="tab"
                               aria-controls="<?php echo e($key); ?>"
                               aria-selected="<?php echo e($loop->first ? 'true' : 'false'); ?>"><?php echo e($productType->first()->iceType->title); ?></a>
                        </li>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <li class="nav-item" role="presentation">
                        <a id="populyarnoye-tab" data-bs-toggle="tab" data-bs-target="#populyarnoye" role="tab"
                           aria-controls="populyarnoye" aria-selected="false">Популярное</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$productType): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="tab-pane fade <?php echo e($loop->first ? 'show active' : ''); ?>" id="<?php echo e($key); ?>"
                             role="tabpanel" aria-labelledby="<?php echo e($key); ?>-tab">
                            <div class="owl-carousel owl-carousel3 owl-theme">
                                <?php $__currentLoopData = $productType; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $iceCream): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <div class="item">
                                        <div class="tovar_image">
                                            <div class="tovar_info">
                                                <div class="container-fluid">
                                                    <div class="row align-items-md-center text-end text-md-center">
                                                        <div class="col">
                                                            <div>
                                                                <a href="<?php echo e(route('products.show',[\App\Models\Icecream::ICECREAM, $iceCream->slug])); ?>">Подробнее</a>
                                                                <?php if($iceCream->portions()->count() > 0): ?>
                                                                    <add-to-cart
                                                                        btn-class="<?php echo e($iceCream->defaultPortion()->count()
&& \Cart::has(\App\Models\Icecream::ICECREAM.'_'.$iceCream->id .'_'.$iceCream->defaultPortion->first()->id) ? 'added' : ''); ?>"
                                                                        product-type="<?php echo e(\App\Models\Icecream::ICECREAM); ?>"
                                                                        product-id="<?php echo e($iceCream->id); ?>"
                                                                        portion-id="<?php echo e($iceCream->defaultPortion()->first()->id); ?>"
                                                                    ></add-to-cart>
                                                                <?php endif; ?>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <picture>
                                                <source srcset="<?php echo e($iceCream->webpImage); ?>" type="image/webp"/>
                                                <source srcset="<?php echo e(Voyager::image($iceCream->image)); ?>" type="image/jpg"/>
                                                <img src="<?php echo e(Voyager::image($iceCream->image)); ?>"
                                                     alt="<?php echo e($iceCream->title); ?>">
                                            </picture>
                                        </div>
                                        <a href="<?php echo e(route('products.show',[\App\Models\Icecream::ICECREAM, $iceCream->slug])); ?>"
                                           class="tovar_name_link"><?php echo e($iceCream->title); ?></a>
                                    </div>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <div class="tab-pane fade" id="populyarnoye" role="tabpanel" aria-labelledby="populyarnoye-tab">
                        <div class="owl-carousel owl-carousel3 owl-theme">
                            <?php $__currentLoopData = $popularProducts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $iceCream): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="item">
                                    <div class="tovar_image">
                                        <div class="tovar_info">
                                            <div class="container-fluid">
                                                <div class="row align-items-md-center text-end text-md-center">
                                                    <div class="col">
                                                        <div>
                                                            <a href="<?php echo e(route('products.show',[\App\Models\Icecream::ICECREAM, $iceCream->slug])); ?>">Подробнее</a>
                                                            <?php if($iceCream->portions()->count() > 0): ?>
                                                                <add-to-cart
                                                                    btn-class="<?php echo e($iceCream->defaultPortion()->count()
&& \Cart::has(\App\Models\Icecream::ICECREAM.'_'.$iceCream->id .'_'.$iceCream->defaultPortion->first()->id) ? 'added' : ''); ?>"
                                                                    product-type="<?php echo e(\App\Models\Icecream::ICECREAM); ?>"
                                                                    product-id="<?php echo e($iceCream->id); ?>"
                                                                    portion-id="<?php echo e($iceCream->defaultPortion()->first()->id); ?>"
                                                                ></add-to-cart>
                                                            <?php endif; ?>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <picture>
                                            <source srcset="<?php echo e($iceCream->webpImage); ?>" type="image/webp"/>
                                            <source srcset="<?php echo e(Voyager::image($iceCream->image)); ?>" type="image/jpg"/>
                                            <img src="<?php echo e(Voyager::image($iceCream->image)); ?>"
                                                 alt="<?php echo e($iceCream->title); ?>">
                                        </picture>
                                    </div>
                                    <a href="<?php echo e(route('products.show',[\App\Models\Icecream::ICECREAM, $iceCream->slug])); ?>"
                                       class="tovar_name_link"><?php echo e($iceCream->title); ?></a>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row inner_block_1">
            <div class="col inner_block_1_text"
                 style="background: url(<?php echo e(Voyager::image($blocks[2]->first()->image)); ?>) center no-repeat;">
                <div class="row">
                    <div class="col-lg-8">
                        <h2><?php echo e($blocks[2]->first()->title); ?></h2>
                        <?php echo $blocks[2]->first()->body; ?>

                    </div>
                </div>
            </div>
        </div>
        <?php
            $blocks[2]->shift();
        ?>
        <div class="row preim_block">
            <?php $__currentLoopData = $blocks[2]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $block): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="col-6 col-lg-3">
                    <div class="preim">
                        <picture>
                            <img src="<?php echo e(Voyager::image($block->icon)); ?>" alt="">
                        </picture>
                        <?php echo e($block->title); ?>

                    </div>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\webdev\htdocs\tuttobene\resources\views/pages/gelato.blade.php ENDPATH**/ ?>