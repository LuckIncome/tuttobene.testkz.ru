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
        </div>
        <div class="freedom-fluid">
            <div class="row inner_block_1 s_1">
                <div class="col inner_block_1_text"
                     style="background: url({{Voyager::image($mainBlock->image)}}) center no-repeat;">
                    <div class=" freedom-block d-none d-md-block">
                        <div class="row">
                            <div class="col-lg-8">
                                <h2>{{$page->title}}</h2>
                                {!! $mainBlock->body !!}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container d-md-none mobile_slide_text">
            <div class="row">
                <div class="col text-center">
                    <h2>{{$page->title}}</h2>
                    <p>{!!$mainBlock->body!!}</p>
                </div>
            </div>
        </div>
        <div class="row inner_carousel">
            <div class="col-12 text-center zag">
                Лучшие вкусы для Ваших гостей
            </div>
            <div class="col-12">
                <ul class="nav nav-tabs d-flex justify-content-between" id="myTab" role="tablist">
                    @foreach($products as $key=>$productType)
                        <li class="nav-item" role="presentation">
                            <a class="{{$loop->first ? 'active' : ''}}" id="{{$key}}-tab"
                               data-bs-toggle="tab" data-bs-target="#{{$key}}" role="tab"
                               aria-controls="{{$key}}"
                               aria-selected="{{$loop->first ? 'true' : 'false'}}">{{$productType->first()->iceType->title}}</a>
                        </li>
                    @endforeach
                    <li class="nav-item" role="presentation">
                        <a id="populyarnoye-tab" data-bs-toggle="tab" data-bs-target="#populyarnoye" role="tab"
                           aria-controls="populyarnoye" aria-selected="false">Популярное</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    @foreach($products as $key=>$productType)
                        <div class="tab-pane fade {{$loop->first ? 'show active' : ''}}" id="{{$key}}"
                             role="tabpanel" aria-labelledby="{{$key}}-tab">
                            <div class="row align-items-center">
                                <div class="col-lg-9">
                                    <div class="owl-carousel owl-carousel4 owl-theme">
                                        @foreach($productType as $iceCream)
                                            <div class="item">
                                                <div class="tovar_image">
                                                    <div class="tovar_info">
                                                        <div class="container-fluid">
                                                            <div
                                                                class="row align-items-md-center text-end text-md-center">
                                                                <div class="col">
                                                                    <div>
                                                                        <a href="{{route('products.showInfo',[\App\Models\Icecream::ICECREAM, $iceCream->slug])}}">Подробнее</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <picture>
                                                        <source srcset="{{$iceCream->webpImage}}" type="image/webp"/>
                                                        <source srcset="{{Voyager::image($iceCream->image)}}"
                                                                type="image/jpg"/>
                                                        <img src="{{Voyager::image($iceCream->image)}}"
                                                             alt="{{$iceCream->title}}">
                                                    </picture>
                                                </div>
                                                <a href="{{route('products.showInfo',[\App\Models\Icecream::ICECREAM, $iceCream->slug])}}"
                                                   class="tovar_name_link">{{$iceCream->title}}</a>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                                <div class="col-lg-3 text-center">
                                    <a href="#" class="prais_inner" data-bs-toggle="modal" data-bs-target="#form1">Получить
                                        прайс лист</a>
                                    <a href="#" class="prais_inner" data-bs-toggle="modal" data-bs-target="#form2">Получить консультацию</a>
                                </div>
                            </div>
                        </div>
                    @endforeach
                    <div class="tab-pane fade" id="populyarnoye" role="tabpanel" aria-labelledby="populyarnoye-tab">
                        <div class="row align-items-center">
                            <div class="col-lg-9">
                                <div class="owl-carousel owl-carousel4 owl-theme">
                                    @foreach($popularProducts as $iceCream)
                                        <div class="item">
                                            <div class="tovar_image">
                                                <div class="tovar_info">
                                                    <div class="container-fluid">
                                                        <div class="row align-items-md-center text-end text-md-center">
                                                            <div class="col">
                                                                <div>
                                                                    <a href="{{route('products.showInfo',[\App\Models\Icecream::ICECREAM, $iceCream->slug])}}">Подробнее</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <picture>
                                                    <source srcset="{{$iceCream->webpImage}}" type="image/webp"/>
                                                    <source srcset="{{Voyager::image($iceCream->image)}}"
                                                            type="image/jpg"/>
                                                    <img src="{{Voyager::image($iceCream->image)}}"
                                                         alt="{{$iceCream->title}}">
                                                </picture>
                                            </div>
                                            <a href="{{route('products.showInfo',[\App\Models\Icecream::ICECREAM, $iceCream->slug])}}"
                                               class="tovar_name_link">{{$iceCream->title}}</a>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                            <div class="col-lg-3 text-center">
                                <a href="#" class="prais_inner" data-bs-toggle="modal" data-bs-target="#form1">Получить прайс лист</a>
                                <a href="#" class="prais_inner" data-bs-toggle="modal" data-bs-target="#form2">Получить консультацию</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
                                    <div class="col-9">
                                        {{$iconBlock->title}}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
        <div class="row">
            <div class="col text-center question_block">
                <b>Остались вопросы?</b>
                <p>Ответим на любые вопросы о взаимовыгодном сотрудничестве.</p>
                <p>
                    <a href="https://api.whatsapp.com/send?phone={{(int) filter_var(setting('site.whatsapp'), FILTER_SANITIZE_NUMBER_INT)}}">{{setting('site.whatsapp')}}</a>
                    (WhatsApp)</p>
            </div>
        </div>
    </div>
@endsection
