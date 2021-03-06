@extends('voyager::master')

@section('page_title', __('voyager::generic.'.(isset($dataTypeContent->id) ? 'edit' : 'add')).' '.$dataType->display_name_singular)

@section('css')
    <style>
        .panel .mce-panel {
            border-left-color: #fff;
            border-right-color: #fff;
        }

        .panel .mce-toolbar,
        .panel .mce-statusbar {
            padding-left: 20px;
        }

        .panel .mce-edit-area,
        .panel .mce-edit-area iframe,
        .panel .mce-edit-area iframe html {
            padding: 0 10px;
            min-height: 350px;
        }

        .mce-content-body {
            color: #555;
            font-size: 14px;
        }

        .panel.is-fullscreen .mce-statusbar {
            position: absolute;
            bottom: 0;
            width: 100%;
            z-index: 200000;
        }

        .panel.is-fullscreen .mce-tinymce {
            height: 100%;
        }

        .panel.is-fullscreen .mce-edit-area,
        .panel.is-fullscreen .mce-edit-area iframe,
        .panel.is-fullscreen .mce-edit-area iframe html {
            height: 100%;
            position: absolute;
            width: 99%;
            overflow-y: scroll;
            overflow-x: hidden;
            min-height: 100%;
        }

        b, strong {
            font-weight: 600;
        }
    </style>
@stop

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>
    </h1>
@stop

@section('content')
    <div class="page-content container-fluid">
        <form class="form-edit-add" role="form"
              action="@if(isset($dataTypeContent->id)){{ route('orders.update', $dataTypeContent->id) }}@else{{ route('voyager.orders.store') }}@endif"
              method="POST" enctype="multipart/form-data">
            <!-- PUT Method if we are editing -->
            @if(isset($dataTypeContent->id))
                {{ method_field("POST") }}
            @endif
            {{ csrf_field() }}

            <div class="row">
                <div class="col-md-8">
                    <!-- ### TITLE ### -->
                    <div class="panel">
                        @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif

                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <i class="voyager-dollar"></i> ?????????? ??? {{$dataTypeContent->id}}
                            </h3>
                            <div class="panel-actions">
                                <a class="panel-action voyager-angle-down" data-toggle="panel-collapse"
                                   aria-hidden="true"></a>
                            </div>
                        </div>
                    </div>


                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">@if($dataTypeContent->orderProducts()->count() > 0)
                                    ???????????? @elseif($dataTypeContent->customCake()->count() > 0) ?????????????????????? ?????????? @else
                                    ???????????? @endif : </h3>
                            <div class="panel-actions">
                                <a class="panel-action voyager-angle-down" data-toggle="panel-collapse"
                                   aria-hidden="true"></a>
                            </div>
                        </div>
                        <div class="panel-body">
                            @if($dataTypeContent->orderProducts()->count() > 0)
                                @foreach($dataTypeContent->orderProducts as $orderProduct)
                                    @if($orderProduct->product_type !== 'waffle')
                                        <div class="product"
                                             style="width: 100%;float: left;border-top:1px solid #ccc;padding-top: 10px;margin-bottom: 10px">
                                            <div class="product-info" style="width: 40%;float: left;">
                                                <img
                                                    style="width: 25%;float: left;max-height: 80px;object-fit:scale-down"
                                                    src="{{Voyager::image($orderProduct->product->image)}}"
                                                    alt="{{$orderProduct->product->name}}">
                                                <div class="info"
                                                     style="width: 40%;float: left;margin-left: 10px;">
                                                    <a href="/admin/{{$orderProduct->product_type}}s/{{$orderProduct->product->id}}">
                                                        <p class="name">{{$orderProduct->product->title}}</p>
                                                    </a>
                                                    <div class="attribute">
                                                        <span>{!! $orderProduct->product_data !!}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="quantity" style="width: 30%;float: left;margin-top: 20px">
                                                <p class="countText">??????-????: <b>{{$orderProduct->count}}</b></p>
                                            </div>
                                            <div class="product-price" style="width: 30%;float: left;margin-top: 20px">
                                                <p class="cost">
                                <span
                                    class="sale-price price">????????:   <b>{{number_format($orderProduct->price, 0, '',' ')}}</b> <span
                                        class="currency">???</span></span>
                                                </p>
                                            </div>
                                        </div>
                                    @else
                                        <div class="product"
                                             style="width: 100%;float: left;border-top:1px solid #ccc;padding-top: 10px;margin-bottom: 10px">
                                            <div class="product-info" style="width: 40%;float: left;">
                                                <img
                                                    style="width: 25%;float: left;max-height: 80px;object-fit:scale-down"
                                                    src="/img/waffle_cone.svg"
                                                    alt="{{$orderProduct->product_data}}">
                                                <div class="info"
                                                     style="width: 40%;float: left;margin-left: 10px;">
                                                    <p class="name">{{$orderProduct->product_data}}</p>
                                                </div>
                                            </div>
                                            <div class="quantity" style="width: 30%;float: left;margin-top: 20px">
                                                <p class="countText">??????-????: <b>{{$orderProduct->count}}</b></p>
                                            </div>
                                            <div class="product-price" style="width: 30%;float: left;margin-top: 20px">
                                                <p class="cost">
                                <span
                                    class="sale-price price">????????:   <b>{{number_format($orderProduct->price, 0, '',' ')}}</b> <span
                                        class="currency">???</span></span>
                                                </p>
                                            </div>
                                        </div>
                                    @endif
                                @endforeach
                            @endif
                            @if($dataTypeContent->customCake()->count() > 0)
                                @foreach($dataTypeContent->customCake as $customCake)
                                    <div class="product"
                                         style="width: 100%;float: left;border-top:1px solid #ccc;padding-top: 10px;margin-bottom: 10px">
                                        <div class="product-info" style="width: 40%;float: left;">
                                            <img style="width: 25%;float: left;max-height: 80px;object-fit:scale-down"
                                                 src="/img/ic_2.svg"
                                                 alt="?????????????????????? ??????????">
                                            <div class="info"
                                                 style="width: 40%;float: left;margin-left: 10px;">
                                                <p class="name">?????????????????? ????????</p>
                                                <div class="attribute">
                                                    <span>{!! $customCake->product_data !!}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="quantity" style="width: 30%;float: left;margin-top: 20px">
                                            <span class="countText"><b>??????-????:</b> {{$customCake->count}}</span>
                                            <br>
                                            <span><b>????????: </b>{{$customCake->stage}}</span>
                                            <br>
                                            <span><b>??????????: </b>{{$customCake->shape === 'circle' ? '????????' : '??????????????'}}</span>
                                            <br>
                                            <span><b>??????????????: </b>{{$customCake->biscuit ? '????' : '??????'}}</span>
                                            <br>
                                            @php
                                                $tastesIds = unserialize($customCake->tastes);
                                                $tastes = \App\Models\Icecream::select('id','title')->whereIn('id',$tastesIds)->get();
                                            @endphp
                                            <span><b>??????????: </b>@foreach($tastes as $taste) <a style="display: inline"
                                                                                               href="/admin/icecreams/{{$taste->id}}">{{$taste->title}}</a> @if(!$loop->last)
                                                    ,@endif @endforeach</span>
                                            <br>
                                        </div>
                                        <div class="product-price" style="width: 30%;float: left;margin-top: 20px">
                                            <p class="cost">
                                <span
                                    class="sale-price price">????????:   <b>{{number_format($customCake->price, 0, '',' ')}}</b> <span
                                        class="currency">???</span></span>
                                            </p>
                                        </div>
                                        @if(strlen($customCake->comments) > 0)
                                            <p style="width:100%;float: left;margin: 10px 0;">
                                                <b>??????????????????????:</b> {{$customCake->comments}}</p>
                                        @endif
                                    </div>
                                @endforeach
                            @endif
                            <div class="form-group" style="width: 20%;float: right;">
                                <strong>?????????? ????????????: </strong>
                                <p>{{number_format($dataTypeContent->amount - $dataTypeContent->delivery_price,0,'',' ')}}
                                    <span
                                        class="currency">???</span></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <!-- ### INFO DATA ### -->
                    <div class="panel panel-bordered panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">???????????????????? ?? ????????????</h3>
                            <div class="panel-actions">
                                <a class="panel-action voyager-angle-down" data-toggle="panel-collapse"
                                   aria-hidden="true"></a>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <strong>???????????? ????????????</strong>
                                @if($dataTypeContent->payment == 'cash')
                                    <p>?????????????????? ?????? ??????????????????</p>
                                @elseif($dataTypeContent->payment == 'card')
                                    <p>???????????? ???????????? (????????????????)</p>
                                @else
                                    <p>???????? ???? ????????????</p>
                                @endif
                            </div>
                            <div class="form-group">
                                <strong>???????????? ????????????????</strong>
                                <p>{{($dataTypeContent->delivery == 'self') ? '??????????????????': '????????????????'}}</p>
                            </div>
                            @if($dataTypeContent->delivery == 'delivery')
                                <div class="form-group">
                                    <strong>?????????? ????????????????:</strong>
                                    <p><b style="color: red">{!! $dataTypeContent->delivery_price > 0 ? number_format($dataTypeContent->delivery_price,0,'', ' ') .' <span
                                                class="currency">???</span>' : '??????????????????' !!} </b></p>
                                </div>
                            @endif
                            <div class="form-group">
                                <strong>??????????</strong>
                                <p style="font-size: 32px">{{number_format($dataTypeContent->amount,0,'',' ')}} <span
                                        class="currency">???</span></p>
                            </div>
                            <div class="form-group">
                                <label style="width: 100%;">
                                    <span class="panel-desc">????????????</span>
                                    <select name="status" class="form-control">
                                        <option @if($dataTypeContent->status == 1) selected @endif value="1">??????????
                                            ??????????
                                        </option>
                                        <option @if($dataTypeContent->status == 2) selected @endif value="2">
                                            ??????????????????????
                                        </option>
                                        <option @if($dataTypeContent->status == 3) selected @endif value="3">????????????????
                                        </option>
                                        <option @if($dataTypeContent->status == 4) selected @endif value="4">??????????????
                                        </option>
                                    </select>
                                </label>
                            </div>
                        </div>
                    </div>
                    <!-- ### CLIENT DATA ### -->
                    <div class="panel panel panel-bordered panel-warning">
                        <div class="panel-heading">
                            <h3 class="panel-title">???????????? ?????????????? :
                            </h3>
                            <div class="panel-actions">
                                <a class="panel-action voyager-angle-down" data-toggle="panel-collapse"
                                   aria-hidden="true"></a>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <strong>???????????????????? :</strong>
                                <p>{{$dataTypeContent->orderEntity ? '?????????????????????? ????????' : '???????????????????? ????????'}}</p>
                            </div>
                            @if($dataTypeContent->orderEntity)
                                <div class="form-group">
                                    <strong>???????????????? ???????????????? :</strong>
                                    <p>{{$dataTypeContent->orderEntity->name}}</p>
                                </div>
                                <div class="form-group">
                                    <strong>?????? :</strong>
                                    <p>{{$dataTypeContent->orderEntity->bin}}</p>
                                </div>
                                <div class="form-group">
                                    <strong>?????? :</strong>
                                    <p>{{$dataTypeContent->orderEntity->bik}}</p>
                                </div>
                                <div class="form-group">
                                    <strong>?????? :</strong>
                                    <p>{{$dataTypeContent->orderEntity->iik}}</p>
                                </div>
                                @if(strlen($dataTypeContent->orderEntity->person) > 0)
                                    <div class="form-group">
                                        <strong>???????????????????????????? ???????? :</strong>
                                        <p>{{$dataTypeContent->orderEntity->person}}</p>
                                    </div>
                                @endif
                                <div class="form-group">
                                    <strong>????.?????????? :</strong>
                                    <p>{{$dataTypeContent->orderEntity->address}}</p>
                                </div>
                            @endif
                            {{--                            <div class="form-group">--}}
                            {{--                                <strong>????. ?????????? :</strong>--}}
                            {{--                                <p>{{$dataTypeContent->user_email}}</p>--}}
                            {{--                            </div>--}}
                            <div class="form-group">
                                <strong>?????? ???????????????????? :</strong>
                                <p>{{$dataTypeContent->name}}</p>
                            </div>
                            <div class="form-group">
                                <strong>?????????????????? ??????????????:</strong>
                                <p>{{$dataTypeContent->phone}}</p>
                            </div>
                            @if($dataTypeContent->delivery === 'delivery')
                                <div class="form-group">
                                    <strong>?????????? ????????????????:</strong>
                                    <p>{{$dataTypeContent->address}}</p>
                                </div>
                                <div class="form-group">
                                    <strong>???????? ????????????????:</strong>
                                    @php
                                        $date = explode(' ', $dataTypeContent->date);
                                        $array = $date;
                                        array_shift($array);
                                        $deliveryDate = \Carbon\Carbon::parse($date[0])->format('d.m.Y'). ' '. implode('', $array);
                                    @endphp
                                    <p>{{$deliveryDate}}</p>
                                </div>
                                <div class="form-group">
                                    <strong>?????????? ????????????????:</strong>
                                    <p><b style="color: red">{{$dataTypeContent->delivery_price}} <span
                                                class="currency">???</span></b></p>
                                </div>
                            @else
                                <div class="form-group">
                                    <strong>?????????? ????????????????????:</strong>
                                    <p>{{\App\Models\Branch::find($dataTypeContent->branch_id)->title}}</p>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>

            <button type="submit" class="btn btn-primary pull-right">
                @if(isset($dataTypeContent->id))???????????????? @else <i
                    class="icon wb-plus-circle"></i> ?????????? ?????????? @endif
            </button>
        </form>
    </div>
@stop

@section('javascript')
    <script>
        $('document').ready(function () {
            $('#slug').slugify();

            @if ($isModelTranslatable)
            $('.side-body').multilingual({"editing": true});
            @endif
        });
    </script>
@stop
