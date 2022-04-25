@extends('partials.layout')
@section('page_title',(strlen($product->title) > 1 ? $product->title : ''))
@section('seo_title', (strlen($product->seo_title) > 1 ? $product->seo_title : ''))
@section('meta_keywords',(strlen($product->meta_keywords) > 1 ? $product->meta_keywords : ''))
@section('meta_description', (strlen($product->meta_description) > 1 ? $product->meta_description : ''))
@section('image',$product->thumbic)
@section('url',url()->current())
@section('page_class','page')
@section('content')
    <div class="container inner_container">
        <div class="row inner_head">
            <div class="col">
                @include('partials.breadcrumbs',[
                             'title'=>'Торты из мороженого',
                             'titleLink' => route('products.index',\App\Models\Icecream::CAKE),
                             'subtitle' => $product->title
                             ])
            </div>
            <h1>{{$product->title}}</h1>
        </div>
        <div class="row justify-content-between align-items-start">
            <div class="col-lg-5 col-xl-4 tovar_inner_image">
                <div class=" sticky-lg-top">
                    <a href="{{Voyager::image($product->image)}}" data-fancybox="gallery"
                       data-caption="{{$product->title}}">
                        <picture>
                            <source srcset="{{$product->webpImage}}" type="image/webp"/>
                            <source srcset="{{Voyager::image($product->image)}}" type="image/jpg"/>
                            <img src="{{Voyager::image($product->image)}}" alt="{{$product->title}}">
                        </picture>
                    </a>
                </div>
            </div>
            <add-to-cart-cake
                product-id="{{$product->id}}"
                product-price="{{$product->price}}"
                product-type="{{\App\Models\Icecream::CAKE}}"
                max-weight="{{$product->max_weight}}"
                min-weight="{{$product->min_weight}}"
            ></add-to-cart-cake>
            <div class="col-lg-6 offset-lg-6 col-xl-3 offset-xl-0">
                {!! $product->body !!}
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
        <div class="row tovar_inner_4">
            <div class="col-12 text-center zag">
                Смотрите также
            </div>
            <div class="col-12">
                <div class="owl-carousel owl-carousel3 owl-theme">
                    @foreach($products as $otherProduct)
                        <div class="item">
                            <div class="tovar_image">
                                <div class="tovar_info">
                                    <div class="container-fluid">
                                        <div class="row align-items-md-center text-end text-md-center">
                                            <div class="col">
                                                <div>
                                                    <a href="{{route('products.show',[\App\Models\Icecream::CAKE, $otherProduct->slug])}}">Подробнее</a>
                                                    <a href="{{route('products.show',[\App\Models\Icecream::CAKE, $otherProduct->slug])}}"></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <picture>
                                    <source srcset="{{$otherProduct->webpImage}}" type="image/webp"/>
                                    <source srcset="{{Voyager::image($otherProduct->image)}}" type="image/jpg"/>
                                    <img src="{{Voyager::image($otherProduct->image)}}"
                                         alt="{{$otherProduct->title}}">
                                </picture>
                            </div>
                            <a href="{{route('products.show',[\App\Models\Icecream::CAKE, $otherProduct->slug])}}"
                               class="tovar_name_link">{{$otherProduct->title}}</a>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
@endsection
