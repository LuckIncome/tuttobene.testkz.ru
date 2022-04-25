<ul>
    <li><a href="/">Главная</a></li>
    <?php if(isset($subtitle)): ?>
        <?php if(isset($titleLink)): ?>
            <li><a href="<?php echo e($titleLink); ?>"><?php echo e($title); ?></a></li>
        <?php else: ?>
            <li class="current"><?php echo e($title); ?></li>
        <?php endif; ?>
        <?php if(isset($childTitle)): ?>
            <li><a href="<?php echo e($subtitleLink); ?>"><?php echo e($subtitle); ?></a></li>
            <?php if(isset($subChildTitle)): ?>
                <li><a href="<?php echo e($childLink); ?>"><?php echo e($childTitle); ?></a></li>
                <li class="current"><?php echo e($subChildTitle); ?></li>
            <?php else: ?>
                <li class="current"><?php echo e($childTitle); ?></li>
            <?php endif; ?>
        <?php else: ?>
            <li class="current"><?php echo e($subtitle); ?></li>
        <?php endif; ?>
    <?php else: ?>
        <li class="current"><?php echo e($title); ?></li>
    <?php endif; ?>
</ul>
<?php /**PATH /home/users/0/004/domains/tutto.testkz.ru/resources/views/partials/breadcrumbs.blade.php ENDPATH**/ ?>