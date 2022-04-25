<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderProduct extends Model
{
    use HasFactory;

    const ICEPORTION = 'iceportion';
    const ICECREAM = 'icecream';
    const CAKE = 'cake';

    public function product(){
        $model = 'App\\Models\\'.ucfirst($this->product_type);

        return $this->belongsTo($model);
    }
}
