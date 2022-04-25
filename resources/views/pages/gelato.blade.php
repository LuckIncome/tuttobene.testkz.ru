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
        <div class="row inner_head" style="margin-bottom: 0px;">
            <div class="col">
                @include('partials.breadcrumbs',['title'=>$page->title])
            </div>
        </div>
        <div class="freedom-fluid">
            <div class="row inner_block_1 s_1">
                <div class="col inner_block_1_text"
                     style="background: url({{Voyager::image($blocks[4]->first()->image)}}) center no-repeat;">
                    <div class=" freedom-block d-none d-md-block">
                        <div class="row">
                            <div class="col-lg-8">
                                <h2>{{$blocks[4]->first()->title}}</h2>
                                {!! $blocks[4]->first()->body !!}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container d-md-none mobile_slide_text">
            <div class="row">
                <div class="col text-center">
                    <h2>{{$blocks[4]->first()->title}}</h2>
                    {!! $blocks[4]->first()->body !!}
                </div>
            </div>
        </div>
        @php
            $blocks[4]->shift();
        @endphp
        <div class="row preim_block">
            @foreach($blocks[2] as $block)
                <div class="col-6 col-lg-3">
                    <div class="preim">
                        <picture>
                            <img src="{{Voyager::image($block->icon)}}" alt="">
                        </picture>
                        {{$block->title}}
                    </div>
                </div>
            @endforeach
        </div>
        <div class="row">
            <div class="col-12 text-center zag">
                Описание сортов
            </div>
            <div class="col-12">
                <ul class="nav nav-tabs d-flex justify-content-between" id="myTab" role="tablist">
                    @foreach($products as $key=>$productType)
                        <li class="nav-item" role="presentation">
                            <a class="{{$loop->first ? 'active' : ''}}" id="{{$key}}-tab"
                               data-bs-toggle="tab" data-bs-target="#{{$key}}" role="tab"
                               aria-controls="{{$key}}"
                               aria-selected="{{$loop->first ? 'true' : 'false'}}">{{$productType->first()->iceType->title}}</a>
                        </li>
                    @endforeach
                    <li class="nav-item" role="presentation">
                        <a id="populyarnoye-tab" data-bs-toggle="tab" data-bs-target="#populyarnoye" role="tab"
                           aria-controls="populyarnoye" aria-selected="false">Популярное</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    @foreach($products as $key=>$productType)
                        <div class="tab-pane fade {{$loop->first ? 'show active' : ''}}" id="{{$key}}"
                             role="tabpanel" aria-labelledby="{{$key}}-tab">
                            <div class="owl-carousel owl-carousel3 owl-theme">
                                @foreach($productType as $iceCream)
                                    <div class="item">
                                        <div class="tovar_image">
                                            <div class="tovar_info">
                                                <div class="container-fluid">
                                                    <div class="row align-items-md-center text-end text-md-center">
                                                        <div class="col">
                                                            <div>
                                                                <a href="{{route('products.showInfo',[\App\Models\Icecream::ICECREAM, $iceCream->slug])}}">Подробнее</a>
                                                                @if($iceCream->portions()->count() > 0)
                                                                    <add-to-cart
                                                                        btn-class="{{$iceCream->defaultPortion()->count()
&& \Cart::has(\App\Models\Icecream::ICECREAM.'_'.$iceCream->id .'_'.$iceCream->defaultPortion->first()->id) ? 'added' : ''}}"
                                                                        product-type="{{\App\Models\Icecream::ICECREAM}}"
                                                                        product-id="{{$iceCream->id}}"
                                                                        portion-id="{{$iceCream->defaultPortion()->first()->id}}"
                                                                    ></add-to-cart>
                                                                @endif
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <picture>
                                                <source srcset="{{$iceCream->webpImage}}" type="image/webp"/>
                                                <source srcset="{{Voyager::image($iceCream->image)}}" type="image/jpg"/>
                                                <img src="{{Voyager::image($iceCream->image)}}"
                                                     alt="{{$iceCream->title}}">
                                            </picture>
                                        </div>
                                        <a href="{{route('products.showInfo',[\App\Models\Icecream::ICECREAM, $iceCream->slug])}}"
                                           class="tovar_name_link">{{$iceCream->title}}</a>
                                    </div>
                                @endforeach
                            </div>
                            
                            <!--
                            
                            <div class="row inner_block_1">
                                <div class="col inner_block_1_text"
                                     style="background: url({{Voyager::image($blocks[2]->first()->image)}}) center no-repeat;">
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <h2>{{$blocks[2]->first()->title}}</h2>
                                            {!! $blocks[2]->first()->body !!}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @php
                                $blocks[2]->shift();
                            @endphp
                            <div class="row preim_block">
                                @foreach($blocks[2] as $block)
                                    <div class="col-6 col-lg-3">
                                        <div class="preim">
                                            <picture>
                                                <img src="{{Voyager::image($block->icon)}}" alt="">
                                            </picture>
                                            {{$block->title}}
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                            
                            -->
                            @if($key == 'sorbety')
                                <div class="freedom-fluid mt-5">
                                    <div class="row inner_block_1 s_1">
                                        <div class="col inner_block_1_text"
                                            style="background: url(&quot;{{Voyager::image($blocks[1]->first()->image)}}&quot;) center center no-repeat;">
                                            <div class=" freedom-block d-none d-md-block">
                                                <div class="row">
                                                    <div class="col-lg-8">
                                                        <h2>{{$blocks[1]->first()->title_two}}</h2>
                                                        {!! $blocks[1]->first()->body !!}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="container d-md-none mobile_slide_text">
                                    <div class="row">
                                        <div class="col text-center">
                                            <h2>{{$blocks[1]->first()->title_two}}</h2>
                                            {!! $blocks[1]->first()->body !!}
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row preim_block">
                                    @foreach($blocks[1] as $block)
                                    <div class="col-6 col-lg-3">
                                        <div class="preim">
                                            <picture><img src="{{Voyager::image($block->icon)}}" alt="{{$block->title}}">
                                            </picture>
                                            {{$block->title}}
                                        </div>
                                    </div>
                                    @endforeach
                                </div>
                            @endif
                            @if($key == 'slivochnoe')
                                <div class="freedom-fluid mt-5">
                                    <div class="row inner_block_1 s_1">
                                        <div class="col inner_block_1_text"
                                            style="background: url(&quot;{{Voyager::image($blocks[6]->first()->image)}}&quot;) center center no-repeat;">
                                            <div class=" freedom-block  d-none d-md-block">
                                                <div class="row">
                                                    <div class="col-lg-8">
                                                        <h2>{{$blocks[6]->first()->title_two}}</h2>
                                                        {!! $blocks[6]->first()->body !!}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="container d-md-none mobile_slide_text">
                                    <div class="row">
                                        <div class="col text-center">
                                            <h2>{{$blocks[6]->first()->title_two}}</h2>
                                            {!! $blocks[6]->first()->body !!}
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row preim_block">
                                    @foreach($blocks[6] as $block)
                             
                                    <div class="col-6 col-lg-3">
                                        <div class="preim">
                                            <picture><img src="{{Voyager::image($block->icon)}}" alt="{{$block->title}}">
                                            </picture>
                                            {{$block->title}}
                                        </div>
                                    </div>
                                    @endforeach
                                </div>
                            @endif
                            @if($key == 'jogurtovoe')
                                <div class="freedom-fluid mt-5">
                                    <div class="row inner_block_1 s_1">
                                        <div class="col inner_block_1_text"
                                            style="background: url(&quot;{{Voyager::image($blocks[3]->first()->image)}}&quot;) center center no-repeat;">
                                            <div class=" freedom-block  d-none d-md-block">
                                                <div class="row">
                                                    <div class="col-lg-8">
                                                        <h2>{{$blocks[3]->first()->title_two}}</h2>
                                                        {!! $blocks[3]->first()->body !!}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="container d-md-none mobile_slide_text">
                                    <div class="row">
                                        <div class="col text-center">
                                            <h2>{{$blocks[3]->first()->title_two}}</h2>
                                            {!! $blocks[3]->first()->body !!}
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row preim_block">
                                    @foreach($blocks[3] as $block)
                                    <div class="col-6 col-lg-3">
                                        <div class="preim">
                                            <picture><img src="{{Voyager::image($block->icon)}}" alt="{{$block->title}}">
                                            </picture>
                                            {{$block->title}}
                                        </div>
                                    </div>
                                    @endforeach
                                </div>
                            @endif
                        </div>
                    @endforeach
                    <div class="tab-pane fade" id="populyarnoye" role="tabpanel" aria-labelledby="populyarnoye-tab">
                        <div class="owl-carousel owl-carousel3 owl-theme">
                            @foreach($popularProducts as $iceCream)
                                <div class="item">
                                    <div class="tovar_image">
                                        <div class="tovar_info">
                                            <div class="container-fluid">
                                                <div class="row align-items-md-center text-end text-md-center">
                                                    <div class="col">
                                                        <div>
                                                            <a href="{{route('products.showInfo',[\App\Models\Icecream::ICECREAM, $iceCream->slug])}}">Подробнее</a>
                                                            @if($iceCream->portions()->count() > 0)
                                                                <add-to-cart
                                                                    btn-class="{{$iceCream->defaultPortion()->count()
&& \Cart::has(\App\Models\Icecream::ICECREAM.'_'.$iceCream->id .'_'.$iceCream->defaultPortion->first()->id) ? 'added' : ''}}"
                                                                    product-type="{{\App\Models\Icecream::ICECREAM}}"
                                                                    product-id="{{$iceCream->id}}"
                                                                    portion-id="{{$iceCream->defaultPortion()->first()->id}}"
                                                                ></add-to-cart>
                                                            @endif
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <picture>
                                            <source srcset="{{$iceCream->webpImage}}" type="image/webp"/>
                                            <source srcset="{{Voyager::image($iceCream->image)}}" type="image/jpg"/>
                                            <img src="{{Voyager::image($iceCream->image)}}"
                                                 alt="{{$iceCream->title}}">
                                        </picture>
                                    </div>
                                    <a href="{{route('products.showInfo',[\App\Models\Icecream::ICECREAM, $iceCream->slug])}}"
                                       class="tovar_name_link">{{$iceCream->title}}</a>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
     
        <!--  
        
        <div class="row inner_block_1">
            <div class="col inner_block_1_text"
                 style="background: url({{Voyager::image($blocks[2]->first()->image)}}) center no-repeat;">
                <div class="row">
                    <div class="col-lg-8">
                        <h2>{{$blocks[2]->first()->title}}</h2>
                        {!! $blocks[2]->first()->body !!}
                    </div>
                </div>
            </div>
        </div>
        @php
            $blocks[2]->shift();
        @endphp
        <div class="row preim_block">
            @foreach($blocks[2] as $block)
                <div class="col-6 col-lg-3">
                    <div class="preim">
                        <picture>
                            <img src="{{Voyager::image($block->icon)}}" alt="">
                        </picture>
                        {{$block->title}}
                    </div>
                </div>
            @endforeach
        </div>
        
        -->
        
        
    </div>
@endsection
