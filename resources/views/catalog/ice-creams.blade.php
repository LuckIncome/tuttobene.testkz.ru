@extends('partials.layout')
@section('page_title','Мороженое в баночках')
@section('seo_title', 'Мороженое в баночках')
@section('meta_keywords','Мороженое в баночках')
@section('meta_description', 'Мороженое в баночках')
@section('image',Voyager::image(setting('site.logo')))
@section('url',url()->current())
@section('page_class','page')
@section('content')
    <div class="container inner_container">
        <div class="row inner_head">
            <div class="col">
                @include('partials.breadcrumbs',['title'=>'Мороженое в баночках'])
            </div>
            <h1>Мороженое в баночках</h1>
        </div>
        <div class="row">
            <div class="col-12">
                <ul class="nav nav-tabs d-flex justify-content-between" id="myTab" role="tablist">
                    @foreach($categories as $cat)
                        <li class="nav-item" role="presentation">
                            <a href="{{route('products.index',[\App\Models\Icecream::ICECREAM, $cat->slug])}}"
                               class="@if(!is_string($category) && $category->id === $cat->id) active @endif">{{$cat->title}}</a>
                        </li>
                    @endforeach
                    <li class="nav-item" role="presentation">
                        <a class="@if(is_string($category)) active @endif"
                           href="{{route('products.index',[\App\Models\Icecream::ICECREAM, 'popular'])}}">Популярное</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active"
                         id="{{!is_string($category) ? $category->slug : $category}}" role="tabpanel"
                         aria-labelledby="{{!is_string($category) ? $category->slug : $category}}-tab">
                        <div class="row inner_catalog justify-content-center">
                            @foreach($products as $product)
                                <div class="col-6 col-lg-4 col-xl-3">
                                    <div class="tovar_inner_block">
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
                                    </div>
                                    <a href="{{route('products.show',[\App\Models\Icecream::ICECREAM, $product->slug])}}"
                                       class="tovar_name_link">{{$product->title}}</a>
                                </div>
                            @endforeach
                        </div>
                        @if(!is_string($category) && $category->infos)
                            <div class="row preim_block">
                                @foreach($category->infos as $info)
                                    <div class="col-6 col-lg-3">
                                        <div class="preim">
                                            <picture>
                                                @if(!preg_match('/(\.svg)$/i', $info->image)) <source srcset="{{$info->webpImage}}" type="image/webp"/> @endif
                                                <source srcset="{{Voyager::image($info->image)}}" type="image/jpg"/>
                                                <img src="{{Voyager::image($info->image)}}"
                                                     alt="{{$info->text}}">
                                            </picture>
                                            {{$info->text}}
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        @else
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
                        @endif
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col pagination">
                {{$products->links('vendor.pagination.bootstrap-4')}}
            </div>
        </div>
    </div>
@endsection
