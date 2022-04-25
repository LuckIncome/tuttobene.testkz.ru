<?php $__env->startSection('page_title','Страница не найдена'); ?>
<?php $__env->startSection('seo_title', 'Страница не найдена'); ?>
<?php $__env->startSection('meta_keywords','Страница не найдена'); ?>
<?php $__env->startSection('meta_description', 'Страница не найдена'); ?>
<?php $__env->startSection('image',Voyager::image(setting('site.logo'))); ?>
<?php $__env->startSection('url',url()->current()); ?>
<?php $__env->startSection('page_class','page'); ?>
<?php $__env->startSection('content'); ?>
    <div class="container inner_container">
        <div class="row inner_head">
            <div class="col">
                <ul>
                    <li><a href="#">Главная</a></li>
                    <li>Страница не найдена</li>
                </ul>
            </div>
            <h1>Страница не найдена</h1>
        </div>
        <div class="row align-items-center thank">
            <div class="col text-center">
                <picture>
                    <img src="/img/404.svg" alt="">
                </picture>
                <h2>404</h2>
                <p>Запрашиваемая Вами страница не найдена!</p>
                <p>Попробуйте вернуться на главную страницу и продолжить поиск.</p>
                <a href="/">Вернуться на главную страницу</a>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/users/0/004/domains/tutto.testkz.ru/resources/views/errors/404.blade.php ENDPATH**/ ?>