@extends('partials.layout')
@section('page_title',(strlen($page->title) > 1 ? $page->title : ''))
@section('seo_title', (strlen($page->seo_title) > 1 ? $page->seo_title : ''))
@section('meta_keywords',(strlen($page->meta_keywords) > 1 ? $page->meta_keywords : ''))
@section('meta_description', (strlen($page->meta_description) > 1 ? $page->meta_description : ''))
@section('image',$page->thumbic)
@section('url',url()->current())
@section('page_class','page')
@section('content')
    @foreach($services as $service)
        <div class="modal fade" id="service-{{$service->id}}" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="container-fluid prazdnik_modal">
                            <img src="/img/close2.svg" data-bs-dismiss="modal" alt="" class="close_modal">
                            <div class="row">
                                <div class="col-8 col-lg-4 text-center">
                                    <picture>
                                        <source srcset="{{$service->webpImage}}" type="image/webp"/>
                                        <source srcset="{{Voyager::image($service->image)}}" type="image/jpg"/>
                                        <img src="{{Voyager::image($service->image)}}" alt="{{$service->title}}">
                                    </picture>
                                    <b>{{number_format($service->price,0,'',' ')}} тг</b>
                                    <a href="#" data-bs-toggle="modal" data-bs-target="#form-services">Заказать</a>
                                </div>
                                <div class="col-lg-7">
                                    <h2>{{$service->title}}</h2>
                                    <span>{{$service->excerpt}}</span>
                                    <b>{{$service->description}}</b>
                                    {!! $service->content !!}
                                    {!! $service->body !!}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endforeach

    <div class="container inner_container">
        <div class="row inner_head">
            <div class="col">
                @include('partials.breadcrumbs',['title'=>$page->title])
            </div>
            <h1>{{$page->title}}</h1>
        </div>
        <div class="row vyezdy_block">
            @foreach($services as $service)
                <div class="col-lg-4 text-center">
                    <div class="vyezd_block">
                        <h3>{{$service->title}}</h3>
                        <span>{{$service->excerpt}}</span>
                        <b>{{$service->description}}</b>
                        <picture>
                            <source srcset="{{$service->webpImage}}" type="image/webp"/>
                            <source srcset="{{Voyager::image($service->image)}}" type="image/jpg"/>
                            <img src="{{Voyager::image($service->image)}}" alt="{{$service->title}}">
                        </picture>
                        {!! $service->content !!}
                        <a href="#" data-bs-toggle="modal" data-bs-target="#service-{{$service->id}}">Подробнее</a>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
@endsection
