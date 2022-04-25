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
                            'title'=>'Мороженое в баночках',
                            'titleLink' => route('products.index',\App\Models\Icecream::ICECREAM),
                            'subtitle' => $product->title
                            ])
            </div>
            <h1>{{$product->title}}</h1>
        </div>
        <div class="row justify-content-between align-items-start">
            <div class="col-lg-4 tovar_inner_image">
                <div class="sticky-lg-top">
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
            <div class="col-lg-8 col-xl-7">
                @if($product->portions()->count() > 0)
                    @foreach($product->portions as $portion)
                        <add-to-cart-single
                            icon="{{Voyager::image($portion->icon)}}"
                            title="{{$portion->title}}"
                            excerpt="{{$portion->excerpt}}"
                            price="{{number_format($portion->price,0,'',' ')}}"
                            product-id="{{$product->id}}"
                            product-type="{{\App\Models\Icecream::ICECREAM}}"
                            portion-id="{{$portion->id}}"
                        ></add-to-cart-single>
                    @endforeach
                @endif
                    <add-to-cart-single
                        icon="/img/waffle_cone.svg"
                        title="Вафельные рожки"
                        price="{{number_format(setting('site.waffle_price'),0,'',' ')}}"
                        product-id="waffle"
                        product-type="waffle"
                        portion-id="waffle"
                    ></add-to-cart-single>
                <div class="row inner_tovar_opisanie">
                    <div class="col">
                        {!! $product->body !!}
                    </div>
                </div>
            </div>
        </div>
        <div class="row preim_block">
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="/storage/image-texts/October2021/qpCG1pbVlxSr7J018AXt.png" alt="">
                    </picture>
                    Всегда свежее
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="/img/natural.png" alt="">
                    </picture>
                    Натуральные ингредиенты
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="/storage/image-texts/October2021/TZDvRhq3Tm7pC9paTSp8.png" alt="">
                    </picture>
                    Всего 35% воздуха
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="preim">
                    <picture>
                        <img src="/storage/image-texts/October2021/Z2jzK1B8mc5JdPG355gM.png" alt="">
                    </picture>
                    Содержание жира 0-11%
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 text-center zag">
                Смотрите также
            </div>
            <div class="col-12">
                <ul class="nav nav-tabs d-flex justify-content-between" id="myTab" role="tablist">
                    @foreach($categories as $category)
                        <li class="nav-item" role="presentation">
                            <a class="@if($loop->first) active @endif" id="{{$category->slug}}-tab" data-bs-toggle="tab"
                               data-bs-target="#{{$category->slug}}" role="tab"
                               aria-controls="{{$category->slug}}"
                               aria-selected="{{$loop->first ? 'true' : 'false'}}">{{$category->title}}</a>
                        </li>
                    @endforeach
                    <li class="nav-item" role="presentation">
                        <a id="popular-tab" data-bs-toggle="tab" data-bs-target="#popular" role="tab"
                           aria-controls="popular" aria-selected="false">Популярное</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    @foreach($categories as $category)
                        <div class="tab-pane fade @if($loop->first) show active @endif" id="{{$category->slug}}"
                             role="tabpanel"
                             aria-labelledby="{{$category->slug}}-tab">
                            <div class="owl-carousel owl-carousel3 owl-theme">
                                @foreach($category->icecreams()->where('id','<>',$product->id)->take(8)->get() as $otherProduct)
                                    <div class="item">
                                        <div class="tovar_image">
                                            <div class="tovar_info">
                                                <div class="container-fluid">
                                                    <div class="row align-items-md-center text-end text-md-center">
                                                        <div class="col">
                                                            <div>
                                                                <a href="{{route('products.show',[\App\Models\Icecream::ICECREAM, $otherProduct->slug])}}">Подробнее</a>
                                                                @if($otherProduct->portions()->count() > 0)
                                                                    <add-to-cart
                                                                        product-type="{{\App\Models\Icecream::ICECREAM}}"
                                                                        product-id="{{$otherProduct->id}}"
                                                                        portion-id="{{$otherProduct->defaultPortion()->first()->id}}"
                                                                    ></add-to-cart>
                                                                @endif
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <picture>
                                                <source srcset="{{$otherProduct->webpImage}}" type="image/webp"/>
                                                <source srcset="{{Voyager::image($otherProduct->image)}}"
                                                        type="image/jpg"/>
                                                <img src="{{Voyager::image($otherProduct->image)}}"
                                                     alt="{{$otherProduct->title}}">
                                            </picture>
                                        </div>
                                        <a href="{{route('products.show',[\App\Models\Icecream::ICECREAM, $otherProduct->slug])}}"
                                           class="tovar_name_link">{{$otherProduct->title}}</a>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    @endforeach
                    <div class="tab-pane fade" id="popular" role="tabpanel" aria-labelledby="popular-tab">
                        <div class="owl-carousel owl-carousel3 owl-theme">
                            @foreach($popularProducts as $popularProduct)
                                <div class="item">
                                    <div class="tovar_image">
                                        <div class="tovar_info">
                                            <div class="container-fluid">
                                                <div class="row align-items-md-center text-end text-md-center">
                                                    <div class="col">
                                                        <div>
                                                            <a href="{{route('products.show',[\App\Models\Icecream::ICECREAM, $popularProduct->slug])}}">Подробнее</a>
                                                            @if($popularProduct->portions()->count() > 0)
                                                                <add-to-cart
                                                                    product-type="{{\App\Models\Icecream::ICECREAM}}"
                                                                    product-id="{{$popularProduct->id}}"
                                                                    portion-id="{{$popularProduct->defaultPortion()->first()->id}}"
                                                                ></add-to-cart>
                                                            @endif
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <picture>
                                            <source srcset="{{$popularProduct->webpImage}}" type="image/webp"/>
                                            <source srcset="{{Voyager::image($popularProduct->image)}}"
                                                    type="image/jpg"/>
                                            <img src="{{Voyager::image($popularProduct->image)}}"
                                                 alt="{{$popularProduct->title}}">
                                        </picture>
                                    </div>
                                    <a href="{{route('products.show',[\App\Models\Icecream::ICECREAM, $popularProduct->slug])}}"
                                       class="tovar_name_link">{{$popularProduct->title}}</a>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
