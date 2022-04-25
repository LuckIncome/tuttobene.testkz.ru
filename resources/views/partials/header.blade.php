<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight">
    <div class="offcanvas-body text-end">
        <picture>
            <img src="/img/close.svg" alt="" data-bs-dismiss="offcanvas">
        </picture>
        {{menu('mobile_menu','partials.menu-mobile')}}
    </div>
</div>

<header class="nav-down">
    <div class="container-fluid">
        <div class="container">
            <div class="row align-items-center">
                <div class="d-none d-xl-block col-5 h_1">
                    {{menu('menu','partials.menu')}}
                </div>
                <div class="col text-xl-center head_logo">
                    <a href="/">
                        <picture>
                            <img src="{{Voyager::image(setting('site.logo'))}}" alt="">
                        </picture>
                    </a>
                </div>
                <div class="d-none d-xl-block col-3 h_3">
                    {{menu('secondary','partials.menu')}}
                </div>
                <div class="col-2 col-xl-1 text-end">
                    <a href="{{$phone}}" class="head_phone"></a>
                </div>
                <div class="col-3 col-md-2 col-xl-1 text-end">
                    <a href="{{route('cart.index')}}" class="head_cart"><cart-count count="{{$cartCount}}"></cart-count></a>
                </div>
                <div class="col-2 col-xl-1 d-xl-none text-end">
                    <a href="#" class="menu_mobile" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"></a>
                </div>
            </div>
        </div>
    </div>
</header>
