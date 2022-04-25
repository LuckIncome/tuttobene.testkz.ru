<ul class="<?php if(isset($isChild)): ?> <?php else: ?> text-start <?php endif; ?>">

<?php

    if (Voyager::translatable($items)) {
        $items = $items->load('translations');
    }

?>

<?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

    <?php

        $originalItem = $item;
        if (Voyager::translatable($item)) {
            $item = $item->translate($options->locale);
        }

        $isActive = null;
        $styles = null;
        $icon = null;

        // Background Color or Color
        if (isset($options->color) && $options->color == true) {
            $styles = 'color:'.$item->color;
        }
        if (isset($options->background) && $options->background == true) {
            $styles = 'background-color:'.$item->color;
        }

        // Check if link is current
        if(url($item->link()) == url()->current() || \Str::contains(url()->current(),$item->link())){
            $isActive = 'active';
        }

        // Set Icon
        if(isset($options->icon) && $options->icon == true){
            $icon = '<i class="' . $item->icon_class . '"></i>';
        }

    ?>

    <li>
        <a href="<?php echo e(url($item->link())); ?>" class="<?php echo e($isActive); ?>" target="<?php echo e($item->target); ?>" style="<?php echo e($styles); ?>">
            <?php echo e($item->title); ?>

        </a>
        <?php if(!$originalItem->children->isEmpty()): ?>
            <?php echo $__env->make('partials.menu-mobile', ['items' => $originalItem->children, 'options' => $options,'isChild' => true], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php endif; ?>
    </li>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
</ul>
<?php /**PATH /home/users/0/004/domains/tutto.testkz.ru/resources/views/partials/menu-mobile.blade.php ENDPATH**/ ?>