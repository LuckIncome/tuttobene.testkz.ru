<footer class="footer mt-auto py-3">
    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 foot_logo text-center text-xl-start">
                    <a href="/">
                        <picture>
                            <img src="{{Voyager::image(setting('site.logo'))}}" alt="">
                        </picture>
                    </a>
                    <div class="clearfix"></div>
                    {!! setting('site.copyrights') !!}
                    <div class="foot_soc">
                        @foreach($socials as $social)
                            <a href="{{$social->link}}" target="_blank" class="foot_{{$social->value}}"></a>
                        @endforeach
                    </div>
                </div>
                <div class="col-md-4 col-xl-3 text-center text-xl-start">
                    <b>О нас</b>
                    <ul>
                        @foreach($aboutPages as $aboutPage)
                            <li><a class="{{url()->current() === route('pages.show',$aboutPage->slug) ? 'active' : ''}}"
                                   href="{{route('pages.show',$aboutPage->slug)}}">{{$aboutPage->title}}</a></li>
                        @endforeach
                    </ul>
                </div>
                <div class="col-md-4 col-xl-3 text-center text-xl-start">
                    <b>Заказать</b>
                    <ul>
                        <li><a href="{{route('products.index',\App\Models\Icecream::ICECREAM)}}">Мороженое в баночках</a></li>
                        <li><a href="{{route('products.index',\App\Models\Icecream::CAKE)}}">Торты из мороженого</a></li>
                        @if($constructorPage)
                            <li><a class="{{url()->current() === route('pages.show',$constructorPage->slug) ? 'active' : ''}}"
                                   href="{{route('pages.show',$constructorPage->slug)}}">{{$constructorPage->title}}</a></li>
                        @endif
                        @if($servicePage)
                            <li>
                                <a class="{{url()->current() === route('pages.show',$servicePage->slug) ? 'active' : ''}}"
                                   href="{{route('pages.show',$servicePage->slug)}}">{{$servicePage->title}}</a></li>
                        @endif
                    </ul>
                </div>
                <div class="col-md-4 col-xl-3 text-center text-xl-start">
                    <b>Сотрудничество</b>
                    <ul>
                        @foreach($cooperatePages as $cooperatePage)
                            <li>
                                <a class="{{url()->current() === route('pages.show',$cooperatePage->slug) ? 'active' : ''}}"
                                   href="{{route('pages.show',$cooperatePage->slug)}}">{{$cooperatePage->title}}</a>
                            </li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
        <div class="container cpy">
            <div class="row align-items-xl-center">
                <div class="col-md-4 col-xl-3 text-center text-xl-start">
                    <span class="foot_location">{{$address}}</span>
                </div>
                <div class="col-md-4 col-xl-3 text-center text-xl-start">
              <span class="foot_phones">
                  @foreach($phones as $phone)
                      <a href="{{$phone->link}}">{{$phone->value}}</a> @if(!$loop->last) <br> @endif
                  @endforeach
              </span>
                </div>
                <div class="col-md-4 col-xl-3 text-center text-xl-start">
              <span class="foot_emails">
               @foreach($emails as $email)
                      <a href="{{$email->link}}">{{$email->value}}</a> @if(!$loop->last) <br> @endif
                  @endforeach
              </span>
                </div>
                <div class="col-xl-3 text-center text-xl-start">
                    <a href="https://i-marketing.kz" target="_blank">
                        <picture>
                            <img src="/img/im.svg" alt="">
                        </picture>
                    </a>
                </div>
            </div>
        </div>
    </div>
</footer>
