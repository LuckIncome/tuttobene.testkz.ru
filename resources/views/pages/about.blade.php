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
        <div class="row justify-content-between about_text">
            @foreach($mainBlocks as $block)
                <div class="col-lg-6 about_img @if($loop->first) order-1 order-lg-1 @else order-3 order-lg-4 @endif">
                    <picture>
                        <source srcset="{{$block->webpImage}}" type="image/webp"/>
                        <source srcset="{{Voyager::image($block->image)}}" type="image/jpg"/>
                        <img src="{{Voyager::image($block->image)}}" alt="{{$page->title}}">
                    </picture>
                </div>
                <div class="col-lg-6 @if($loop->first) order-1 order-lg-2 @else order-4 order-lg-3 @endif">
                    {!! $block->body !!}
                </div>
            @endforeach
            <div class="col-12 order-5">
                <ul class="nav nav-tabs d-flex justify-content-between" id="myTab" role="tablist">
                    @foreach($tabBlocks as $tabBlock)
                        <li class="nav-item" role="presentation">
                            <a class="{{$loop->first ? 'active' : ''}}" id="{{$page->slug}}-tab-{{$tabBlock->id}}" data-bs-toggle="tab" data-bs-target="#{{$page->slug}}-block-{{$tabBlock->id}}" role="tab"
                               aria-controls="{{$page->slug}}-block-{{$tabBlock->id}}" aria-selected="{{$loop->first ? 'true' : 'false'}}">{{$tabBlock->title}}</a>
                        </li>
                    @endforeach
                </ul>
                <div class="tab-content" id="myTabContent">
                    @foreach($tabBlocks as $tabBlock)
                    <div class="tab-pane fade {{$loop->first ? 'show active' : ''}}" id="{{$page->slug}}-block-{{$tabBlock->id}}" role="tabpanel" aria-labelledby="{{$page->slug}}-tab-{{$tabBlock->id}}">
                        <div class="row align-items-center justify-content-between">
                            <div class="col-lg-3 text-center text-lg-start">
                                <picture>
                                    <img src="{{Voyager::image($tabBlock->icon)}}" alt="">
                                </picture>
                            </div>
                            <div class="col-lg-9">
                                {!! $tabBlock->body !!}
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
        <div class="row preim_block">
            @foreach($pages as $key => $innerPage)
                <div class="col-6 col-lg-3">
                    <div class="preim">
                        <picture>
                            <img src="/img/a_{{$key+1}}.svg" alt="">
                        </picture>
                        <a href="{{route('pages.show',$innerPage->slug)}}">{{$innerPage->title}}</a>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
@endsection
