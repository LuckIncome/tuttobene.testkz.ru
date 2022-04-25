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
        @foreach($team as $spec => $members)
            <div class="row teams">
                <div class="col-12 zag_team">
                    <span>{{$spec}}</span>
                    <hr>
                </div>
                <div class="col-12">
                    <div class="owl-carousel owl-carousel3 owl-theme">
                        @foreach($members as $member)
                            <div class="item team_block">
                                <div class="ratio ratio-1x1"
                                     style="background: url({{Voyager::image($member->image)}}) center no-repeat;"></div>
                                <b>{{$member->name}}</b>
                                <span>{{$member->excerpt}}</span>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        @endforeach
    </div>
@endsection
