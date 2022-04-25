<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Resizable;

class Page extends \TCG\Voyager\Models\Page
{
    use HasFactory, Resizable;

    /**
     * Get the route key for the model.
     *
     * @return string
     */

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function imageTexts()
    {
        return $this->hasMany(ImageText::class)->where('status',true)->orderBy('sort_id');
    }

    public function getWebpImageAttribute()
    {
        return str_replace('.' . pathinfo(\Voyager::image($this->image),PATHINFO_EXTENSION), '.webp', \Voyager::image($this->image));
    }

    public function getThumbicAttribute()
    {
        return $this->thumbnail('small', 'image');
    }

    public function getWebpThumbAttribute()
    {
        return str_replace('.' . pathinfo(\Voyager::image($this->thumbnail('small', 'image')),PATHINFO_EXTENSION), '.webp', \Voyager::image($this->thumbnail('small', 'image')));
    }
}
