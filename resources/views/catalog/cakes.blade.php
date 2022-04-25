@extends('partials.layout')
@section('page_title','Торты из мороженого')
@section('seo_title', 'Торты из мороженого')
@section('meta_keywords','Торты из мороженого')
@section('meta_description', 'Торты из мороженого')
@section('image',Voyager::image(setting('site.logo')))
@section('url',url()->current())
@section('page_class','page')
@section('content')
    <div class="container inner_container">
        <div class="row inner_head">
            <div class="col">
                @include('partials.breadcrumbs',['title'=>'Торты из мороженого'])
            </div>
            <h1>Торты из мороженого</h1>
        </div>
        <div class="row inner_catalog justify-content-start">
            @foreach($products as $product)
                <div class="col-6 col-lg-4 col-xl-3">
                    <div class="tovar_inner_block">
                        <div class="tovar_image">
                            <div class="tovar_info">
                                <div class="container-fluid">
                                    <div class="row align-items-md-center text-end text-md-center">
                                        <div class="col">
                                            <div>
                                                <a href="{{route('products.show',[\App\Models\Icecream::CAKE, $product->slug])}}">Подробнее</a>
                                                <a href="{{route('products.show',[\App\Models\Icecream::CAKE, $product->slug])}}"></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <picture>
                                <source srcset="{{$product->webpImage}}" type="image/webp"/>
                                <source srcset="{{Voyager::image($product->image)}}" type="image/jpg"/>
                                <img src="{{Voyager::image($product->image)}}"
                                     alt="{{$product->title}}">
                            </picture>
                        </div>
                    </div>
                    <a href="{{route('products.show',[\App\Models\Icecream::CAKE, $product->slug])}}"
                       class="tovar_name_link">{{$product->title}}</a>
                </div>
            @endforeach

            @if(!$products->hasMorePages())
                <div class="col-6 col-lg-4 col-xl-3">
                    <a href="{{route('pages.show',$constructorPage->slug)}}">
                        <div class="tovar_inner_block">
                            <div class="tovar_image">
                                <div class="tovar_info tort_add">
                                    <div class="container-fluid">
                                        <div class="row align-items-center text-center">
                                            <div class="col">
                                                <picture>
                                                    <img src="/img/tort_add.svg" alt="">
                                                </picture>
                                                <span>Создай свой торт</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            @endif
        </div>
        <div class="row">
            <div class="col pagination">
                {{$products->links('vendor.pagination.bootstrap-4')}}
            </div>
        </div>
        <div class="row preim_block">
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="/img/fresh_icon.png" alt="">
                    </picture>
                    Свежо
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="/img/unusually_icon.png" alt="">
                    </picture>
                   Необычно
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="/img/original_icon.png" alt="">
                    </picture>
                    Оригинально
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="/img/tasty_icon.png" alt="">
                    </picture>
                    Необыкновенно вкусно
                </div>
            </div>
        </div>
    </div>
@endsection
