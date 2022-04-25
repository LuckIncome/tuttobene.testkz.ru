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
                @include('partials.breadcrumbs',['title'=>$page->title])
            </div>
            <h1>{{$page->title}}</h1>
        </div>
        <Constructor
            price="{{setting('site.c_price')}}"
            max-weight="{{(float) setting('site.c_maxWeight')}}"
            min-weight1="{{(float) setting('site.c_minWeight_1')}}"
            min-weight2="{{(float) setting('site.c_minWeight_2')}}"
            min-weight3="{{(float) setting('site.c_minWeight_3')}}"
        ></Constructor>
    </div>
@endsection
