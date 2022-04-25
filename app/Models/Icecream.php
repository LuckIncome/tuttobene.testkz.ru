<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Resizable;

class Icecream extends BaseModel
{
    use HasFactory, Resizable;

    const ICECREAM = 'morozhenoe';
    const CAKE = 'torty';
    /**
     * Get the route key for the model.
     *
     * @return string
     */

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function iceType()
    {
        return $this->belongsTo(IceType::class,'type_id','id')->where('status',true)->orderBy('sort_id');
    }

    public function portions()
    {
        return $this->hasMany(IcePortion::class)->where('status',true)->orderBy('sort_id');
    }

    public function defaultPortion()
    {
        return $this->portions()->where('default',true);
    }
}
