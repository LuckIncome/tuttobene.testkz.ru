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
        <div class="row inner_news">
            @foreach($posts as $post)
                <div class="col-sm-6 col-lg-3">
                    <div class="article">
                        <div class="article_img">
                            <a href="{{route('posts.show',$post)}}">
                                <picture>
                                    <source srcset="{{$post->webpImage}}" type="image/webp"/>
                                    <source srcset="{{Voyager::image($post->image)}}" type="image/jpg"/>
                                    <img src="{{Voyager::image($post->image)}}" alt="{{$post->title}}">
                                </picture>
                            </a>
                        </div>
                        <a href="{{route('posts.show',$post)}}">{{$post->title}}</a>
                        <div class="clearfix"></div>
                        {{ $post->created_at->translatedFormat('d F Y')  }}
                    </div>
                </div>
            @endforeach
        </div>
        <div class="row">
            <div class="col pagination">
                {{$posts->links('vendor.pagination.bootstrap-4')}}
            </div>
        </div>
    </div>
@endsection
