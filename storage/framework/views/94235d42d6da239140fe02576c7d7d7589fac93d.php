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
                <ul>
                    <li><a href="#">Главная</a></li>
                    <li>О джелато</li>
                </ul>
            </div>
            <h1>О джелато</h1>
        </div>
        <div class="row inner_block_1">
            <div class="col inner_block_1_text" style="background: url(img/bg_1.png) center no-repeat;">
                <div class="row">
                    <div class="col-lg-8">
                        <h2>Что такое Джелато</h2>
                        <p>Итальянское джелато содержит в 2 раза меньше воздуха, чем в классическом мороженом, поэтому его вкус насыщенный, яркий и запоминающийся.</p>
                        <p>Подается джелато при температуре -16 градусов, вкусовые рецепторы не замораживаются и воспринимают каждый оттенок нежных сливок, шоколада, ароматной клубники или сочного арбуза.</p>
                        <p>Джелато готовят вручную из натурального молока, сливок и сахара, с добавлением орехов и шоколада. Сорбеты делают без молока с добавлением ягод и фркутов. Все полезные вещества, витамины и микроэлементы этих продуктов сохраняются в мороженом.</p>
                        <p>Джелато содержит намного меньге жира, чем фабричное мороженое — максимум 10-11%. Джелато — свежеприготовленное мороженое. Его производят и тут же продают. В витрине, такое мороженое находится не более 5-7 дней.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row preim_block">
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="img/p_1.svg" alt="">
                    </picture>
                    Регулярные поставки
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="img/p_2.svg" alt="">
                    </picture>
                    Всегда свежее мороженое
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="img/p_3.svg" alt="">
                    </picture>
                    Алматинский продукт
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="img/p_1.svg" alt="">
                    </picture>
                    Регулярные поставки
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 text-center zag">
                Описание сортов
            </div>
            <div class="col-12">
                <ul class="nav nav-tabs d-flex justify-content-between" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <a class="active" id="sorbety-tab" data-bs-toggle="tab" data-bs-target="#sorbety" role="tab" aria-controls="sorbety" aria-selected="true">Сорбеты</a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a id="slivochnoye-tab" data-bs-toggle="tab" data-bs-target="#slivochnoye" role="tab" aria-controls="slivochnoye" aria-selected="false">Сливочное</a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a id="yogurtovoye-tab" data-bs-toggle="tab" data-bs-target="#yogurtovoye" role="tab" aria-controls="yogurtovoye" aria-selected="false">Йогуртовое</a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a id="populyarnoye-tab" data-bs-toggle="tab" data-bs-target="#populyarnoye" role="tab" aria-controls="populyarnoye" aria-selected="false">Популярное</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="sorbety" role="tabpanel" aria-labelledby="sorbety-tab">
                        <div class="owl-carousel owl-carousel3 owl-theme">
                            <div class="item">
                                <div class="tovar_image">
                                    <div class="tovar_info">
                                        <div class="container-fluid">
                                            <div class="row align-items-md-center text-end text-md-center">
                                                <div class="col">
                                                    <div>
                                                        <a href="#">Подробнее</a>
                                                        <a href="#" class="added"></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <picture>
                                        <img src="img/tovar.png" alt="">
                                    </picture>
                                </div>
                                <a href="#" class="tovar_name_link">SNIKERS</a>
                            </div>
                            <div class="item">
                                <div class="tovar_image">
                                    <div class="tovar_info">
                                        <div class="container-fluid">
                                            <div class="row align-items-md-center text-end text-md-center">
                                                <div class="col">
                                                    <div>
                                                        <a href="#">Подробнее</a>
                                                        <a href="#"></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <picture>
                                        <img src="img/tovar.png" alt="">
                                    </picture>
                                </div>
                                <a href="#" class="tovar_name_link">SNIKERS</a>
                            </div>
                            <div class="item">
                                <div class="tovar_image">
                                    <div class="tovar_info">
                                        <div class="container-fluid">
                                            <div class="row align-items-md-center text-end text-md-center">
                                                <div class="col">
                                                    <div>
                                                        <a href="#">Подробнее</a>
                                                        <a href="#" class="added"></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <picture>
                                        <img src="img/tovar.png" alt="">
                                    </picture>
                                </div>
                                <a href="#" class="tovar_name_link">SNIKERS</a>
                            </div>
                            <div class="item">
                                <div class="tovar_image">
                                    <div class="tovar_info">
                                        <div class="container-fluid">
                                            <div class="row align-items-md-center text-end text-md-center">
                                                <div class="col">
                                                    <div>
                                                        <a href="#">Подробнее</a>
                                                        <a href="#"></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <picture>
                                        <img src="img/tovar.png" alt="">
                                    </picture>
                                </div>
                                <a href="#" class="tovar_name_link">SNIKERS</a>
                            </div>
                            <div class="item">
                                <div class="tovar_image">
                                    <div class="tovar_info">
                                        <div class="container-fluid">
                                            <div class="row align-items-md-center text-end text-md-center">
                                                <div class="col">
                                                    <div>
                                                        <a href="#">Подробнее</a>
                                                        <a href="#"></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <picture>
                                        <img src="img/tovar.png" alt="">
                                    </picture>
                                </div>
                                <a href="#" class="tovar_name_link">SNIKERS</a>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="slivochnoye" role="tabpanel" aria-labelledby="slivochnoye-tab">Сливочное</div>
                    <div class="tab-pane fade" id="yogurtovoye" role="tabpanel" aria-labelledby="yogurtovoye-tab">Йогуртовое</div>
                    <div class="tab-pane fade" id="populyarnoye" role="tabpanel" aria-labelledby="populyarnoye-tab">Популярное</div>
                </div>
            </div>
        </div>
        <div class="row inner_block_1">
            <div class="col inner_block_1_text" style="background: url(img/bg_2.png) center no-repeat;">
                <div class="row">
                    <div class="col-lg-8">
                        <h2>Что такое Сорбеты</h2>
                        <p>Повседневная практика показывает, что начало повседневной работы по формированию позиции способствует подготовки и реализации существенных финансовых и административных условий. Товарищи! реализация намеченных плановых заданий позволяет выполнять важные задания по разработке направлений прогрессивного развития. Разнообразный и богатый опыт новая модель организационной деятельности в значительной степени обуславливает создание форм развития. Разнообразный и богатый опыт консультация с широким активом в значительной степени обуславливает создание направлений прогрессивного развития.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row preim_block">
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="img/p_4.svg" alt="">
                    </picture>
                    Натуральные фрукты и ягоды
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="img/p_5.svg" alt="">
                    </picture>
                    Всегда свежее мороженое
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="img/p_6.svg" alt="">
                    </picture>
                    Алматинский продукт
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="img/p_2.svg" alt="">
                    </picture>
                    Регулярные поставки
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('partials.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\webdev\htdocs\tuttobene\resources\views/pages/jelato.blade.php ENDPATH**/ ?>