<?php $__env->startSection('page_title',(strlen($page->title) > 1 ? $page->title : '')); ?>
<?php $__env->startSection('seo_title', (strlen($page->seo_title) > 1 ? $page->seo_title : '')); ?>
<?php $__env->startSection('meta_keywords',(strlen($page->meta_keywords) > 1 ? $page->meta_keywords : '')); ?>
<?php $__env->startSection('meta_description', (strlen($page->meta_description) > 1 ? $page->meta_description : '')); ?>
<?php $__env->startSection('image',$page->thumbic); ?>
<?php $__env->startSection('url',url()->current()); ?>
<?php $__env->startSection('page_class','page'); ?>
<?php $__env->startSection('content'); ?>
    <div class="container slider_text">
        <div class="row">
            <div class="col">
                <div class="slide_text d-none d-md-block">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col">
                                <b><?php echo $page->title; ?></b>
                                <?php echo e($page->excerpt); ?>

                                <div class="sl_buttons">
                                    <a href="<?php echo e(route('products.index',\App\Models\Icecream::ICECREAM)); ?>">Мороженое в
                                        баночках</a>
                                    <a href="<?php echo e(route('products.index',\App\Models\Icecream::CAKE)); ?>">Торты из
                                        мороженого</a>
                                    <?php if($servicePage): ?>
                                        <a href="<?php echo e(route('pages.show',$servicePage->slug)); ?>"><?php echo e($servicePage->title); ?></a>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid slider_block">
        <div class="row">
            <div class="col">
                <div class="owl-carousel owl-carousel2 owl-theme">
                    <?php $__currentLoopData = $sliders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $slider): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="item">
                            <picture>
                                <source srcset="<?php echo e($slider->webpImage); ?>" type="image/webp"/>
                                <source srcset="<?php echo e(Voyager::image($slider->image)); ?>" type="image/jpg"/>
                                <img src="<?php echo e(Voyager::image($slider->image)); ?>" alt="<?php echo e($slider->title); ?>">
                            </picture>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
        </div>
    </div>
    <div class="container d-md-none mobile_slide_text">
        <div class="row">
            <div class="col text-center">
                <b><?php echo $page->title; ?></b>
                <?php echo e($page->excerpt); ?>

            </div>
        </div>
    </div>
    <div class="container sl_buttons_2 d-md-none">
        <div class="row text-center justify-content-center">
            <div class="col-10 col-md-4">
                <a href="<?php echo e(route('products.index',\App\Models\Icecream::ICECREAM)); ?>">Мороженое в баночках</a>
            </div>
            <div class="col-10 col-md-4">
                <a href="<?php echo e(route('products.index',\App\Models\Icecream::CAKE)); ?>">Торты из мороженого</a>
            </div>
            <div class="col-10 col-md-4">
                <?php if($servicePage): ?>
                    <a href="<?php echo e(route('pages.show',$servicePage->slug)); ?>"><?php echo e($servicePage->title); ?></a>
                <?php endif; ?>
            </div>
        </div>
    </div>
    <div class="container gallery_new">
        <div class="row align-items-center zag">
            <div class="col-sm-6 text-center text-sm-start">
                <b>Галерея новинок</b>
            </div>
            <div class="col-sm-6 text-center text-sm-end">
                <a href="<?php echo e(route('products.index',\App\Models\Icecream::ICECREAM)); ?>">Смотреть все</a>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="owl-carousel owl-carousel3 owl-theme">
                    <?php $__currentLoopData = $newProducts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="item">
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
                            <a href="<?php echo e(route('products.show',[\App\Models\Icecream::ICECREAM, $product->slug])); ?>"
                               class="tovar_name_link"><?php echo e($product->title); ?></a>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid sostav_block">
        <div class="container">
            <div class="row zag">
                <div class="col text-center">
                    <?php echo e($mainBlock->title); ?>

                </div>
            </div>
            <div class="row text-center align-items-center">
                <div class="col-lg-4">
                    <div class="row justify-content-center">
                        <?php $__currentLoopData = $compoundBlocks[1]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $block): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <div class="col-9 col-sm-6 col-lg-9 <?php if($loop->first || $loop->last): ?> offset-lg-3 <?php endif; ?>">
                                <div class="sostav">
                                    <picture>
                                        <img src="<?php echo e(Voyager::image($block->icon)); ?>" alt="">
                                    </picture>
                                    <?php echo e($block->title); ?>

                                </div>
                            </div>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>
                </div>
                <div class="col-lg-4">
                    <picture>
                        <source srcset="<?php echo e($mainBlock->webpImage); ?>" type="image/webp"/>
                        <source srcset="<?php echo e(Voyager::image($mainBlock->image)); ?>" type="image/jpg"/>
                        <img src="<?php echo e(Voyager::image($mainBlock->image)); ?>" alt="<?php echo e($page->title); ?>">
                    </picture>
                </div>
                <div class="col-lg-4">
                    <div class="row justify-content-center">
                        <?php $__currentLoopData = $compoundBlocks[2]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $block): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <div class="col-9 col-sm-6 col-lg-9 <?php if(!$loop->first && !$loop->last): ?> offset-lg-3 <?php endif; ?>">
                                <div class="sostav">
                                    <picture>
                                        <img src="<?php echo e(Voyager::image($block->icon)); ?>" alt="">
                                    </picture>
                                    <?php echo e($block->title); ?>

                                </div>
                            </div>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container about_block">
        <div class="row align-items-center justify-content-between">
            <div class="col-lg-5">
                <?php echo $aboutBlock->body; ?>

            </div>
            <div class="col-lg-6">
                <picture>
                    <source srcset="<?php echo e($aboutBlock->webpImage); ?>" type="image/webp"/>
                    <source srcset="<?php echo e(Voyager::image($aboutBlock->image)); ?>" type="image/jpg"/>
                    <img src="<?php echo e(Voyager::image($aboutBlock->image)); ?>" alt="<?php echo e($page->title); ?>">
                </picture>
            </div>
        </div>
    </div>
    <div class="container-fluid cifry_block">
        <div class="container">
            <div class="row zag">
                <div class="col text-center">
                    Tutto Bene в цифрах
                </div>
            </div>
            <div class="row justify-content-center justify-content-xl-between">
                <?php $__currentLoopData = $numbers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $number): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="col-6 col-md-4 col-xl-2">
                        <div class="ratio ratio-1x1">
                            <div class="container-fluid">
                                <div class="row align-items-center text-center">
                                    <div class="col">
                                        <b><?php echo e($number->title); ?></b>
                                        <?php echo $number->body; ?>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </div>
    </div>
    <?php if($posts->count() > 0): ?>
        <div class="container gallery_new">
            <div class="row align-items-center zag">
                <div class="col-sm-6 text-center text-sm-start">
                    <b>Новости компании</b>
                </div>
                <div class="col-sm-6 text-center text-sm-end">
                    <a href="<?php echo e(route('posts.index')); ?>">Смотреть все</a>
                </div>
            </div>
            <div class="row">
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
        </div>
    <?php endif; ?>
    <div class="container-fluid map_block">
        <div class="row">
            <div class="col">
                <div class="block-map js-widget" data-widget="block_map">
                    <div class="sidebarr">
                        <div class="container-fluid">
                            <div class="row items-list align-items-center">
                                <?php $__currentLoopData = $branches; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $branch): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <div class="col-6 col-md-12 list-item" data-id="<?php echo e($branch->id); ?>">
                                        <picture>
                                            <img src="<?php echo e(Voyager::image($branch->logo)); ?>" alt="<?php echo e($branch->title); ?>">
                                        </picture>
                                        <?php echo e($branch->title); ?>

                                    </div>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                        </div>
                    </div>
                    <div class="map" id="map" data-type="yandex"
                         data-placemarks='[<?php echo $branches->implode('map',','); ?>]'
                         data-coord="" data-zoom="" data-description=''></div>
                </div>

            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/users/0/004/domains/tutto.testkz.ru/resources/views/pages/home.blade.php ENDPATH**/ ?>