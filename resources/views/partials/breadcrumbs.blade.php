<ul>
    <li><a href="/">Главная</a></li>
    @if(isset($subtitle))
        @if(isset($titleLink))
            <li><a href="{{$titleLink}}">{{$title}}</a></li>
        @else
            <li class="current">{{$title}}</li>
        @endif
        @if(isset($childTitle))
            <li><a href="{{$subtitleLink}}">{{$subtitle}}</a></li>
            @if(isset($subChildTitle))
                <li><a href="{{$childLink}}">{{$childTitle}}</a></li>
                <li class="current">{{$subChildTitle}}</li>
            @else
                <li class="current">{{$childTitle}}</li>
            @endif
        @else
            <li class="current">{{$subtitle}}</li>
        @endif
    @else
        <li class="current">{{$title}}</li>
    @endif
</ul>
