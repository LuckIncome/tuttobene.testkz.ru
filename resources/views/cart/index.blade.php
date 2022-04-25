@extends('partials.layout')
@section('page_title','Корзина')
@section('seo_title', 'Корзина')
@section('meta_keywords','')
@section('meta_description', '')
@section('image',Voyager::image(setting('site.logo')))
@section('url',url()->current())
@section('page_class','page')
@section('content')
    <div class="container inner_container">
        <div class="row inner_head">
            <div class="col">
                @include('partials.breadcrumbs',['title'=>'Корзина'])
            </div>
            <h1>Корзина</h1>
        </div>
        <cart-items></cart-items>
    </div>
@endsection
