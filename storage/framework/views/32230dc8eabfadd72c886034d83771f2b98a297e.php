<footer class="footer mt-auto py-3">
    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 foot_logo text-center text-xl-start">
                    <a href="/">
                        <picture>
                            <img src="<?php echo e(Voyager::image(setting('site.logo'))); ?>" alt="">
                        </picture>
                    </a>
                    <div class="clearfix"></div>
                    <?php echo setting('site.copyrights'); ?>

                    <div class="foot_soc">
                        <?php $__currentLoopData = $socials; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $social): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <a href="<?php echo e($social->link); ?>" target="_blank" class="foot_<?php echo e($social->value); ?>"></a>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>
                </div>
                <div class="col-md-4 col-xl-3 text-center text-xl-start">
                    <b>О нас</b>
                    <ul>
                        <?php $__currentLoopData = $aboutPages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $aboutPage): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <li><a class="<?php echo e(url()->current() === route('pages.show',$aboutPage->slug) ? 'active' : ''); ?>"
                                   href="<?php echo e(route('pages.show',$aboutPage->slug)); ?>"><?php echo e($aboutPage->title); ?></a></li>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </ul>
                </div>
                <div class="col-md-4 col-xl-3 text-center text-xl-start">
                    <b>Заказать</b>
                    <ul>
                        <li><a href="<?php echo e(route('products.index',\App\Models\Icecream::ICECREAM)); ?>">Мороженое в баночках</a></li>
                        <li><a href="<?php echo e(route('products.index',\App\Models\Icecream::CAKE)); ?>">Торты из мороженого</a></li>
                        <?php if($constructorPage): ?>
                            <li><a class="<?php echo e(url()->current() === route('pages.show',$constructorPage->slug) ? 'active' : ''); ?>"
                                   href="<?php echo e(route('pages.show',$constructorPage->slug)); ?>"><?php echo e($constructorPage->title); ?></a></li>
                        <?php endif; ?>
                        <?php if($servicePage): ?>
                            <li>
                                <a class="<?php echo e(url()->current() === route('pages.show',$servicePage->slug) ? 'active' : ''); ?>"
                                   href="<?php echo e(route('pages.show',$servicePage->slug)); ?>"><?php echo e($servicePage->title); ?></a></li>
                        <?php endif; ?>
                    </ul>
                </div>
                <div class="col-md-4 col-xl-3 text-center text-xl-start">
                    <b>Сотрудничество</b>
                    <ul>
                        <?php $__currentLoopData = $cooperatePages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $cooperatePage): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <li>
                                <a class="<?php echo e(url()->current() === route('pages.show',$cooperatePage->slug) ? 'active' : ''); ?>"
                                   href="<?php echo e(route('pages.show',$cooperatePage->slug)); ?>"><?php echo e($cooperatePage->title); ?></a>
                            </li>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container cpy">
            <div class="row align-items-xl-center">
                <div class="col-md-4 col-xl-3 text-center text-xl-start">
                    <span class="foot_location"><?php echo e($address); ?></span>
                </div>
                <div class="col-md-4 col-xl-3 text-center text-xl-start">
              <span class="foot_phones">
                  <?php $__currentLoopData = $phones; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $phone): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                      <a href="<?php echo e($phone->link); ?>"><?php echo e($phone->value); ?></a> <?php if(!$loop->last): ?> <br> <?php endif; ?>
                  <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
              </span>
                </div>
                <div class="col-md-4 col-xl-3 text-center text-xl-start">
              <span class="foot_emails">
               <?php $__currentLoopData = $emails; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $email): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                      <a href="<?php echo e($email->link); ?>"><?php echo e($email->value); ?></a> <?php if(!$loop->last): ?> <br> <?php endif; ?>
                  <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
              </span>
                </div>
                <div class="col-xl-3 text-center text-xl-start">
                    <a href="https://i-marketing.kz" target="_blank">
                        <picture>
                            <img src="/img/im.svg" alt="">
                        </picture>
                    </a>
                </div>
            </div>
        </div>
    </div>
</footer>
<?php /**PATH D:\webdev\htdocs\tuttobene\resources\views/partials/footer.blade.php ENDPATH**/ ?>