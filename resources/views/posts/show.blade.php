@extends('partials.layout')
@section('page_title',(strlen($post->title) > 1 ? $post->title : ''))
@section('seo_title', (strlen($post->seo_title) > 1 ? $post->seo_title : ''))
@section('meta_keywords',(strlen($post->meta_keywords) > 1 ? $post->meta_keywords : ''))
@section('meta_description', (strlen($post->meta_description) > 1 ? $post->meta_description : ''))
@section('image',$post->thumbic)
@section('url',url()->current())
@section('page_class','page')
@section('content')
    <div class="container inner_container">
        <div class="row inner_head">
            <div class="col">
                @include('partials.breadcrumbs',['title'=>$page->title,'titleLink' => route('pages.show',$page->slug), 'subtitle' => $post->title])
            </div>
            <h1>{{$post->title}}</h1>
        </div>
        <div class="row article_inner">
            <div class="col-lg-5">
                <div class="image_article_inner sticky-lg-top">
                    <picture>
                        <source srcset="{{$post->webpImage}}" type="image/webp"/>
                        <source srcset="{{Voyager::image($post->image)}}" type="image/jpg"/>
                        <img src="{{Voyager::image($post->image)}}" alt="{{$post->title}}">
                    </picture>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="date_article">{{ $post->created_at->translatedFormat('d F Y')  }}</div>
                <div class="clearfix"></div>
                {!! $post->body !!}
            </div>
        </div>
        <div class="row align-items-center zag ">
            <div class="col text-center other_news_zag">
                <b>Читайте также</b>
            </div>
        </div>
        <div class="row other_news">
            @foreach($posts as $otherPost)
                <div class="col-sm-6 col-lg-3">
                    <div class="article">
                        <div class="article_img">
                            <a href="{{route('posts.show',$otherPost)}}">
                                <picture>
                                    <source srcset="{{$otherPost->webpImage}}" type="image/webp"/>
                                    <source srcset="{{Voyager::image($otherPost->image)}}" type="image/jpg"/>
                                    <img src="{{Voyager::image($otherPost->image)}}" alt="{{$otherPost->title}}">
                                </picture>
                            </a>
                        </div>
                        <a href="{{route('posts.show',$otherPost)}}">{{$otherPost->title}}</a>
                        <div class="clearfix"></div>
                        {{ $otherPost->created_at->translatedFormat('d F Y')  }}
                    </div>
                </div>
            @endforeach
        </div>
    </div>
@endsection
