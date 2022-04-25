@extends('partials.layout')
@section('page_title','Ожидание оплаты')
@section('seo_title', 'Ожидание оплаты')
@section('meta_keywords','Ожидание оплаты')
@section('meta_description', 'Ожидание оплаты')
@section('image',Voyager::image(setting('site.logo')))
@section('url',url()->current())
@section('page_class','page')
@section('content')
    <div class="container inner_container">
        <div class="row inner_head">
            <div class="col">
                @include('partials.breadcrumbs',['title'=>'Ожидание оплаты'])
            </div>
            <h1>Ожидание оплаты</h1>
        </div>
        <div class="row text_page">
            <check-payment-status order-id="{{$orderId}}" payment-id="{{$paymentId}}"></check-payment-status>
        </div>
    </div>
@endsection
