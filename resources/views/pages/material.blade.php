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
        <div class="row inner_head" style="margin-bottom: 0px;">
            <div class="col">
                @include('partials.breadcrumbs',['title'=>$parentPage->title,'titleLink' => route('pages.show',$parentPage->slug), 'subtitle' => $page->title])
            </div>
            <!--<h1>{{$page->title}}</h1>-->
        </div>
        <div class="freedom-fluid">
            <div class="row inner_block_1 s_1">
                <div class="col inner_block_1_text"
                     style="background: url({{Voyager::image($mainBlock->image)}}) center no-repeat;">
                    <div class=" freedom-block d-none d-md-block">
                        <div class="row">
                            <div class="col">
                                <div class="row align-items-center">
                                    <div class="col-lg-4 text-center">
                                        <picture>
                                            <img src="{{Voyager::image($mainBlock->icon)}}" style="width: 100%;" alt="">
                                        </picture>
                                    </div>
                                    <div class="col-lg-12 text-center text-lg-start">
                                        <b>{{$mainBlock->title}}</b>
                                        {!! $mainBlock->body !!}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container d-md-none mobile_slide_text">
            <div class="row">
                <div class="col text-center">
                    <b>{{$mainBlock->title}}</b>
                    {!! $mainBlock->body !!}
                    <picture>
                        <img src="{{Voyager::image($mainBlock->icon)}}" style="width: 100%;" alt="">
                    </picture>
                </div>
            </div>
        </div>
        @if($textBlocks && $textBlocks->count() > 0)
            <div class="row syrye_preim_block">
                <div class="col-12">
                    Все для приготовления самого вкусного мороженого
                </div>
                @foreach($textBlocks as $textBlock)
                    <div class="col-md-6 col-lg-4">
                        <div class="syrye_preim">
                            {!! $textBlock->body !!}
                        </div>
                    </div>
                @endforeach
            </div>
        @endif
        <div class="row syrye_links">
            <div class="col text-center">
                <a href="{{setting('site.partners_website')}}" target="_blank" class="s_l_1">Перейти на сайт партнеров с описанием продукции</a>
                <div class="clearfix"></div>
                <a href="#" class="s_l_2" data-bs-toggle="modal" data-bs-target="#form1">Получить прайс лист</a>
                <div class="clearfix"></div>
                <a href="#" class="s_l_3" data-bs-toggle="modal" data-bs-target="#form2">Получить консультацию</a>
            </div>
        </div>
        @if($iconBlocks && $iconBlocks->count() > 0)
            <div class="row">
                <div class="col-12 sotr_zag_block">
                    <b>Условия сотрудничества</b>
                </div>
                @foreach($iconBlocks as $iconBlock)
                    <div class="col-lg-4">
                        <div class="sort_inner_block">
                            <div class="row">
                                <div class="col">
                                    <div class="row align-items-center">
                                        <div class="col-3 text-center">
                                            <picture>
                                                <img src="{{Voyager::image($iconBlock->icon)}}" alt="">
                                            </picture>
                                        </div>
                                        <div class="col-9">{{$iconBlock->title}}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        @endif
        <div class="row">
            <div class="col text-center question_block">
                <b>Остались вопросы?</b>
                <p>Ответим на любые вопросы о взаимовыгодном сотрудничестве.</p>
                <p><a href="https://api.whatsapp.com/send?phone={{(int) filter_var(setting('site.whatsapp'), FILTER_SANITIZE_NUMBER_INT)}}">{{setting('site.whatsapp')}}</a> (WhatsApp)</p>
            </div>
        </div>
    </div>
@endsection
