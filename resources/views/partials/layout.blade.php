<!DOCTYPE html>
<html lang="{{session()->get('locale')}}">
@include('partials.head')
<body class="d-flex flex-column vh-100 @yield('page_class')">
<div id="tuttobene">
    @include('partials.header')
    <main>
        @yield('content')
    </main>
</div>
@include('partials.footer')
@include('partials.modals')
@include('partials.scripts')
@yield('scripts')
</body>
</html>
