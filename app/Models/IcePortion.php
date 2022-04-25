<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class IcePortion extends Model
{
    use HasFactory;

    public function icecream()
    {
        return $this->belongsTo(Icecream::class);
    }
}
