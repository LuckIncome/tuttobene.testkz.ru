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
            @foreach($certs as $cert)
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="{{Voyager::image($cert->image)}}" data-fancybox="gallery" data-caption="{{$page->title}}">
                        <div class="cert">
                            <picture>
                                <source srcset="{{$cert->webpImage}}" type="image/webp"/>
                                <source srcset="{{Voyager::image($cert->image)}}" type="image/jpg"/>
                                <img src="{{Voyager::image($cert->image)}}" alt="{{$cert->name}}">
                            </picture>
                        </div>
                    </a>
                </div>
            @endforeach
        </div>
        <div class="row">
            <div class="col pagination">
                {{$certs->links('vendor.pagination.bootstrap-4')}}
            </div>
        </div>
    </div>
@endsection
