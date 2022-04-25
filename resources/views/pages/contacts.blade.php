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
        <div class="row contacts_block">
            <div class="col-lg-3">
                <picture>
                    <img src="{{Voyager::image(setting('site.logo'))}}" alt="">
                </picture>
            </div>
            <div class="col-lg-3 text-center text-lg-start">
                {!! $mainBranch->body !!}
            </div>
            <div class="col-lg-6">
                <form class="contact-form" action="{{route('callback')}}" method="post">
                    @csrf
                    <div class="row text-lg-start text-center">
                        <div class="col-lg-6">
                            <input type="text" name="name" placeholder="Имя *" required="">
                        </div>
                        <div class="col-lg-6">
                            <input type="text" name="phone" class="phonee" placeholder="Телефон *" required="">
                        </div>
                        <div class="col-12">
                            <textarea name="comments" placeholder="Сообщение" required></textarea>
                        </div>
                        <div class="col-12">
                            <input type="hidden" name="type" value="Страница Контакты">
                            <input type="submit" class="send" value="Отправить сообщение">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="row contacts_filialy">
            <div class="col">
                <div class="accordion" id="accordionExample">
                    @foreach($branches as $branch)
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="heading-{{$branch->id}}">
                                <button class="accordion-button @if(!$loop->first) collapsed @endif" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#collapse-{{$branch->id}}" aria-expanded="{{$loop->first ? 'true' : 'false'}}" aria-controls="collapse-{{$branch->id}}">
                                    <picture>
                                        <img src="{{Voyager::image($branch->logo)}}" alt="">
                                    </picture>
                                    {{$branch->title}}
                                </button>
                            </h2>
                            <div id="collapse-{{$branch->id}}" class="accordion-collapse collapse {{$loop->first ? 'show' : ''}}" aria-labelledby="heading-{{$branch->id}}"
                                 data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <div class="row align-items-center">
                                        <div class="col-lg-4 offset-lg-1">
                                            {!! $branch->body !!}
                                        </div>
                                        <div class="col-lg-6 offset-lg-1">
                                            <a href="{{Voyager::image($branch->image)}}" data-fancybox="gallery"
                                               data-caption="{{$branch->title}}">
                                                <picture>
                                                    <source srcset="{{$branch->webpImage}}" type="image/webp"/>
                                                    <source srcset="{{Voyager::image($branch->image)}}" type="image/jpg"/>
                                                    <img src="{{Voyager::image($branch->image)}}" alt="{{$branch->title}}">
                                                </picture>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
@endsection
