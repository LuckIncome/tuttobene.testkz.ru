<!DOCTYPE HTML>
<html>
<head>
    <title>Новая заявка на Обратный звонок</title>
</head>
<body>
<h1>Новая заявка на Обратный звонок</h1>
<br>
<p>Имя отправителя : {{$name}}</p>
<p>Телефон : {{$phone}}</p>
@if($type)
    <p>Тип : {{$type}}</p>
@endif
@if($comments)
    <p>Комментарии : {{$comments}}</p>
@endif
</body>
</html>
