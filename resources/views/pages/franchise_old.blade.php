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
                @include('partials.breadcrumbs',['title'=>$parentPage->title,'titleLink' => route('pages.show',$parentPage->slug), 'subtitle' => $page->title])
            </div>
        </div>
        <div class="freedom-fluid">
            <div class="row inner_block_1 fransh_block_1 ">
                <div class="col inner_block_1_text" style="background: url({{Voyager::image($mainBlock->image)}}) center top no-repeat;">
                    
                        <div class=" freedom-block">
                            <div class="row">
                                <div class="col-lg-6 text-lg-start text-center">
                                    <h2>{{$page->title}}</h2>
                                    <p>{{$mainBlock->title}}</p>
                                    <a download="Презентация Франшизы Tutto Bene"
                                       href="{{Voyager::image(json_decode(setting('site.presentation'))[0]->download_link)}}">Скачать
                                        презентацию</a>
                                </div>
                            
                             </div>
                        </div>
                </div>
            </div>
        </div>
        @if($textBlocks && $textBlocks->count() > 0)
            <div class="row franshiza_acc">
                <div class="accordion" id="accordionExample">
                    @foreach($textBlocks as $title=>$textBlock)
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="heading{{\Str::slug($title)}}">
                                <button class="accordion-button @if(!$loop->first) collapsed @endif" type="button"
                                        data-bs-toggle="collapse"
                                        data-bs-target="#collapse{{\Str::slug($title)}}"
                                        aria-expanded="{{$loop->first ? 'true' : 'false'}}"
                                        aria-controls="collapse{{\Str::slug($title)}}">
                                    {{$title}}
                                </button>
                            </h2>
                            <div id="collapse{{\Str::slug($title)}}"
                                 class="accordion-collapse collapse @if($loop->first) show @endif"
                                 aria-labelledby="heading{{\Str::slug($title)}}"
                                 data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <div class="row justify-content-between align-items-center">
                                        <div class="col-lg-7">
                                            @foreach($textBlock as $txt)
                                                <div class="franshiza_acc_text double">
                                                    <div style="font-size: 20px;
                                                                line-height: 25px;
                                                                color: #8f2e1f;
                                                                margin: 15px 0;
                                                                text-transform: uppercase;"
                                                    > ТОРГОВАЯ ФРАНШИЗА ПАКЕТ ПОДДЕРЖКИ ФРАНЧАЙЗИ ДЛЯ ГОРОДА АЛМАТЫ </div>
                                                    {!! $txt->body !!}
                                                </div>
                                            @endforeach
                                        </div>
                                        <div class="col-lg-5 franshiza_acc_text_more text-center">
                                            <a href="#" data-bs-toggle="modal" data-bs-target="#form2">Получить
                                                персональную
                                                консультацию</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        @endif
        <div class="row">
            <div class="col text-center question_block">
                <b>Остались вопросы?</b>
                <p>Ответим на любые вопросы о взаимовыгодном сотрудничестве.</p>
                <p>
                    <a href="https://api.whatsapp.com/send?phone={{(int) filter_var(setting('site.whatsapp'), FILTER_SANITIZE_NUMBER_INT)}}">{{setting('site.whatsapp')}}</a>
                    (WhatsApp)</p>
            </div>
        </div>
    </div>
@endsection
