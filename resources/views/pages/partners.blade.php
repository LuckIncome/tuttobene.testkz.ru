@extends('partials.layout')
@section('page_title',(strlen($page->title) > 1 ? $page->title : ''))
@section('seo_title', (strlen($page->seo_title) > 1 ? $page->seo_title : ''))
@section('meta_keywords',(strlen($page->meta_keywords) > 1 ? $page->meta_keywords : ''))
@section('meta_description', (strlen($page->meta_description) > 1 ? $page->meta_description : ''))
@section('image',$page->thumbic)
@section('url',url()->current())
@section('page_class','page')
@section('content')
    <div class="container inner_container">
        <div class="row inner_head">
            <div class="col">
                @include('partials.breadcrumbs',['title'=>$parentPage->title,'titleLink' => route('pages.show',$parentPage->slug), 'subtitle' => $page->title])
            </div>
            <h1>{{$page->title}}</h1>
        </div>
        <div class="row cert_block">
            @foreach($partners as $partner)
                <div class="col-6 col-md-4 col-lg-3 text-center">
                    <div class="partner">
                        <div class="partner_image">
                            <a href="{{$partner->link}}">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <picture>
                                            <source srcset="{{$partner->webpImage}}" type="image/webp"/>
                                            <source srcset="{{Voyager::image($partner->image)}}" type="image/jpg"/>
                                            <img src="{{Voyager::image($partner->image)}}" alt="{{$partner->name}}">
                                        </picture>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <a href="{{$partner->link}}" class="partner_link">{{$partner->name}}</a>
                    </div>
                </div>
            @endforeach
        </div>
        <div class="row">
            <div class="col text-center question_block">
                <b>По вопросам о партнерстве</b>
                <p>Ответим на любые вопросы о взаимовыгодном сотрудничестве.</p>
                <p><a href="https://api.whatsapp.com/send?phone={{(int) filter_var(setting('site.whatsapp'), FILTER_SANITIZE_NUMBER_INT)}}">{{setting('site.whatsapp')}}</a> (WhatsApp)</p>
            </div>
        </div>
    </div>
@endsection
