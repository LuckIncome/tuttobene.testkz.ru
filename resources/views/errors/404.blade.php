@extends('partials.layout')
@section('page_title','Страница не найдена')
@section('seo_title', 'Страница не найдена')
@section('meta_keywords','Страница не найдена')
@section('meta_description', 'Страница не найдена')
@section('image',Voyager::image(setting('site.logo')))
@section('url',url()->current())
@section('page_class','page')
@section('content')
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
@endsection
