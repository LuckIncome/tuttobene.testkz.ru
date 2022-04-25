@extends('partials.layout')
@section('page_title',(strlen($page->title) > 1 ? $page->title : ''))
@section('seo_title', (strlen($page->seo_title) > 1 ? $page->seo_title : ''))
@section('meta_keywords',(strlen($page->meta_keywords) > 1 ? $page->meta_keywords : ''))
@section('meta_description', (strlen($page->meta_description) > 1 ? $page->meta_description : ''))
@section('image',$page->thumbic)
@section('url',url()->current())
@section('page_class','page')
@section('content')
    <div class="container slider_text">
        <div class="row">
            <div class="col">
                <div class="slide_text d-none d-md-block">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col">
                                <b>{!! $page->title !!}</b>
                                {{$page->excerpt}}
                                <div class="sl_buttons">
                                    <a href="{{route('products.index',\App\Models\Icecream::ICECREAM)}}">Мороженое в
                                        баночках</a>
                                    <a href="{{route('products.index',\App\Models\Icecream::CAKE)}}">Торты из
                                        мороженого</a>
                                    @if($servicePage)
                                        <a href="{{route('pages.show',$servicePage->slug)}}">{{$servicePage->title}}</a>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid slider_block">
        <div class="row">
            <div class="col">
                <div class="owl-carousel owl-carousel2 owl-theme">
                    @foreach($sliders as $slider)
                        <div class="item">
                            <picture>
                                <source srcset="{{$slider->webpImage}}" type="image/webp"/>
                                <source srcset="{{Voyager::image($slider->image)}}" type="image/jpg"/>
                                <img src="{{Voyager::image($slider->image)}}" alt="{{$slider->title}}">
                            </picture>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
    <div class="container d-md-none mobile_slide_text">
        <div class="row">
            <div class="col text-center">
                <b>{!! $page->title !!}</b>
                {{$page->excerpt}}
            </div>
        </div>
    </div>
    <div class="container sl_buttons_2 d-md-none">
        <div class="row text-center justify-content-center">
            <div class="col-10 col-md-4">
                <a href="{{route('products.index',\App\Models\Icecream::ICECREAM)}}">Мороженое в баночках</a>
            </div>
            <div class="col-10 col-md-4">
                <a href="{{route('products.index',\App\Models\Icecream::CAKE)}}">Торты из мороженого</a>
            </div>
            <div class="col-10 col-md-4">
                @if($servicePage)
                    <a href="{{route('pages.show',$servicePage->slug)}}">{{$servicePage->title}}</a>
                @endif
            </div>
        </div>
    </div>
    <div class="container gallery_new">
        <div class="row align-items-center zag">
            <div class="col-sm-6 text-center text-sm-start">
                <b>Галерея новинок</b>
            </div>
            <div class="col-sm-6 text-center text-sm-end">
                <a href="{{route('products.index',\App\Models\Icecream::ICECREAM)}}">Смотреть все</a>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="owl-carousel owl-carousel3 owl-theme">
                    @foreach($newProducts as $product)
                        <div class="item">
                            <div class="tovar_image">
                                <div class="tovar_info">
                                    <div class="container-fluid">
                                        <div class="row align-items-md-center text-end text-md-center">
                                            <div class="col">
                                                <div>
                                                    <a href="{{route('products.show',[\App\Models\Icecream::ICECREAM, $product->slug])}}">Подробнее</a>
                                                    @if($product->portions()->count() > 0)
                                                        <add-to-cart
                                                            btn-class="{{$product->defaultPortion()->count()
&& \Cart::has(\App\Models\Icecream::ICECREAM.'_'.$product->id .'_'.$product->defaultPortion->first()->id) ? 'added' : ''}}"
                                                            product-type="{{\App\Models\Icecream::ICECREAM}}"
                                                            product-id="{{$product->id}}"
                                                            portion-id="{{$product->defaultPortion()->first()->id}}"
                                                        ></add-to-cart>
                                                    @endif
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
                            <a href="{{route('products.show',[\App\Models\Icecream::ICECREAM, $product->slug])}}"
                               class="tovar_name_link">{{$product->title}}</a>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid sostav_block">
        <div class="container">
            <div class="row zag">
                <div class="col text-center">
                    {{$mainBlock->title}}
                </div>
            </div>
            <div class="row text-center align-items-center">
                <div class="col-lg-4">
                    <div class="row justify-content-center">
                        @foreach($compoundBlocks[1] as $block)
                            <div class="col-9 col-sm-6 col-lg-9 @if($loop->first || $loop->last) offset-lg-3 @endif">
                                <div class="sostav">
                                    <picture>
                                        <img src="{{Voyager::image($block->icon)}}" alt="">
                                    </picture>
                                    {{$block->title}}
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
                <div class="col-lg-4">
                    <picture>
                        <source srcset="{{$mainBlock->webpImage}}" type="image/webp"/>
                        <source srcset="{{Voyager::image($mainBlock->image)}}" type="image/jpg"/>
                        <img src="{{Voyager::image($mainBlock->image)}}" alt="{{$page->title}}">
                    </picture>
                </div>
                <div class="col-lg-4">
                    <div class="row justify-content-center">
                        @foreach($compoundBlocks[2] as $block)
                            <div class="col-9 col-sm-6 col-lg-9 @if(!$loop->first && !$loop->last) offset-lg-3 @endif">
                                <div class="sostav">
                                    <picture>
                                        <img src="{{Voyager::image($block->icon)}}" alt="">
                                    </picture>
                                    {{$block->title}}
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container about_block">
        <div class="row align-items-center justify-content-between">
            <div class="col-lg-5">
                {!! $aboutBlock->body !!}
            </div>
            <div class="col-lg-6">
                <picture>
                    <source srcset="{{$aboutBlock->webpImage}}" type="image/webp"/>
                    <source srcset="{{Voyager::image($aboutBlock->image)}}" type="image/jpg"/>
                    <img src="{{Voyager::image($aboutBlock->image)}}" alt="{{$page->title}}">
                </picture>
            </div>
        </div>
    </div>
    <div class="container-fluid cifry_block">
        <div class="container">
            <div class="row zag">
                <div class="col text-center">
                    Tutto Bene в цифрах
                </div>
            </div>
            <div class="row justify-content-center justify-content-xl-between">
                @foreach($numbers as $number)
                    <div class="col-6 col-md-4 col-xl-2">
                        <div class="ratio ratio-1x1">
                            <div class="container-fluid">
                                <div class="row align-items-center text-center">
                                    <div class="col">
                                        <b>{{$number->title}}</b>
                                        {!! $number->body !!}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
    @if($posts->count() > 0)
        <div class="container gallery_new">
            <div class="row align-items-center zag">
                <div class="col-sm-6 text-center text-sm-start">
                    <b>Новости компании</b>
                </div>
                <div class="col-sm-6 text-center text-sm-end">
                    <a href="{{route('posts.index')}}">Смотреть все</a>
                </div>
            </div>
            <div class="row">
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
        </div>
    @endif
    <div class="container-fluid map_block">
        <div class="row">
            <div class="col">
                <div class="block-map js-widget" data-widget="block_map">
                    <div class="sidebarr">
                        <div class="container-fluid">
                            <div class="row items-list align-items-center">
                                @foreach($branches as $branch)
                                    <div class="col-6 col-md-12 list-item" data-id="{{$branch->id}}">
                                        <picture>
                                            <img src="{{Voyager::image($branch->logo)}}" alt="{{$branch->title}}">
                                        </picture>
                                        {{$branch->title}}
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                    <div class="map" id="map" data-type="yandex"
                         data-placemarks='[{!! $branches->implode('map',',') !!}]'
                         data-coord="" data-zoom="" data-description=''></div>
                </div>

            </div>
        </div>
    </div>
@endsection
