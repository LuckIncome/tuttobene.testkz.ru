<!DOCTYPE HTML>
<html>
<head>
    <title>Новая заявка на Обратный звонок</title>
</head>
<body>
<h1>Новая заявка на Обратный звонок</h1>
<br>
<p>Имя отправителя : <?php echo e($name); ?></p>
<p>Телефон : <?php echo e($phone); ?></p>
<?php if($type): ?>
    <p>Тип : <?php echo e($type); ?></p>
<?php endif; ?>
<?php if($comments): ?>
    <p>Комментарии : <?php echo e($comments); ?></p>
<?php endif; ?>
</body>
</html>
<?php /**PATH D:\webdev\htdocs\tuttobene\resources\views/emails/callback.blade.php ENDPATH**/ ?>