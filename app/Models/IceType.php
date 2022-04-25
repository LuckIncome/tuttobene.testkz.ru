<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Resizable;

class IceType extends BaseModel
{
    use HasFactory, Resizable;


    public function icecreams()
    {
        return $this->hasMany(Icecream::class,'type_id','id')->where('status',true)->orderBy('sort_id');
    }

    public function limitedIcecreams()
    {
        return $this->icecreams()->limit(8);
    }

    public function infos()
    {
        return $this->hasMany(Info::class,'category_id','id')->where('status',true)->orderBy('sort_id');
    }
}
