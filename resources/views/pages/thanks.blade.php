@extends('partials.layout')
@section('page_title','Ваш заказ оформлен')
@section('seo_title', 'Ваш заказ оформлен')
@section('meta_keywords','Ваш заказ оформлен')
@section('meta_description', 'Ваш заказ оформлен')
@section('image',Voyager::image(setting('site.logo')))
@section('url',url()->current())
@section('page_class','page')
@section('content')
    <div class="container inner_container">
        <div class="row inner_head">
            <div class="col">
                <ul>
                    <li><a href="#">Главная</a></li>
                    <li>Ваш заказ оформлен</li>
                </ul>
            </div>
            <h1>Ваш заказ оформлен</h1>
        </div>
        <div class="row align-items-center thank">
            <div class="col text-center">
                <picture>
                    <img src="/img/thank.svg" alt="">
                </picture>
                <h2>Спасибо!</h2>
                <p>Ваш заказ успешно оформлен!</p>
                <p>Вам отправлено смс-подтверждение заказа на указанный Вами телефон. В случае, если оно не прийдет в течение пяти минут, свяжитесь, пожалуйста  с нами: +7 (747) 846-72-38</p>
                <a href="/">Вернуться на главную страницу</a>
            </div>
        </div>
    </div>
@endsection
