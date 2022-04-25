<div class="modal fade modal-form" id="form1" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Запрос прайс листа</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Заполните, пожалуйста форму</p>
                <form class="form" action="<?php echo e(route('callback')); ?>" method="post">
                    <?php echo csrf_field(); ?>
                    <input type="text" name="name" placeholder="Как к Вам обращаться?">
                    <input type="text" name="phone" class="phonee" placeholder="+7 (___) ___ - __ - __">
                    <input type="hidden" name="type" value="Запрос прайс листа">
                    <input type="submit" class="send" value="Отправить заявку">
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade modal-form" id="form-services" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Заказать выездное обслуживание</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Заполните, пожалуйста форму</p>
                <form class="form" action="<?php echo e(route('callback')); ?>" method="post">
                    <?php echo csrf_field(); ?>
                    <input type="text" name="name" placeholder="Как к Вам обращаться?">
                    <input type="text" name="phone" class="phonee" placeholder="+7 (___) ___ - __ - __">
                    <input type="hidden" name="type" value="Заказать выездное обслуживание">
                    <input type="submit" class="send" value="Отправить заявку">
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade modal-form" id="form2" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Запрос на консультацию</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Заполните, пожалуйста форму</p>
                <form class="form" action="<?php echo e(route('callback')); ?>" method="post">
                    <?php echo csrf_field(); ?>
                    <input type="text" name="name" placeholder="Как к Вам обращаться?">
                    <input type="text" name="phone" class="phonee" placeholder="+7 (___) ___ - __ - __">
                    <input type="hidden" name="type" value="Запрос на консультацию">
                    <?php if(isset($page) && $page->type == 'franchise'): ?>
                        <a href="<?php echo e(Voyager::image(json_decode(setting('site.franchize_form'))[0]->download_link)); ?>"
                           class="text_link" download="Franchize_anketa">Анкета Франчайзи</a>
                    <?php endif; ?>
                    <input type="submit" class="send" value="Отправить заявку">
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="dostavkaa" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                <div class="container-fluid dostavka_modal">
                    <img src="/img/close2.svg" data-bs-dismiss="modal" alt="" class="close_modal">
                    <div class="row">
                        <div class="col-12">
                            <h4>Условия доставки</h4>
                        </div>
                        <div class="col-12">
                            <?php echo setting('site.delivery_terms'); ?>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="form3" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm">
        <div class="modal-content">
            <div class="modal-body text-center">
                <picture>
                    <img src="/img/logo.svg" alt="">
                </picture>
                <h3>Спасибо</h3>
                <p>Наш менеджер свяжется с Вами в ближайшее время.</p>
                <a href="#" class="button_1" data-bs-dismiss="modal">ОК</a>
            </div>
        </div>
    </div>
</div>
<?php /**PATH /home/users/0/004/domains/tutto.testkz.ru/resources/views/partials/modals.blade.php ENDPATH**/ ?>