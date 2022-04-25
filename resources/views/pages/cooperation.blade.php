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
                @include('partials.breadcrumbs',['title'=>$page->title])
            </div>
            <h1>{{$page->title}}</h1>
        </div>
        <div class="row justify-content-center">
            @foreach($pages as $innerPage)
                <div class="col-md-6 col-lg-4">
                    <div class="sotr" style="background: url({{Voyager::image($innerPage->image)}}) center no-repeat;">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col">
                                    <span>{{$innerPage->title}}</span>
                                    <p>{{$innerPage->excerpt}}</p>
                                    <div class="clearfix"></div>
                                    <a href="{{route('pages.show',$innerPage->slug)}}">Подробнее</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
@endsection
