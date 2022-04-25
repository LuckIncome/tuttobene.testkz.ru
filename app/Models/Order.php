<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    const SELF = 'self';
    const DELIVERY = 'delivery';
    const CARD = 'card';
    const CASH = 'cash';
    const CHARGE = 'charge';

    const STATUS_NEW = 1;
    const STATUS_PROCESSING = 2;
    const STATUS_SEND = 3;
    const STATUS_CANCELLED = 4;


    public function orderProducts()
    {
        return $this->hasMany(OrderProduct::class);
    }

    public function orderEntity()
    {
        return $this->hasOne(OrderEntity::class);
    }

    public function payment()
    {
        return $this->hasOne(Payment::class);
    }

    public function scopeConfirmed($query)
    {
        return $query->where('confirmed', true);
    }

    public function customCake()
    {
        return $this->hasMany(CakeProduct::class);
    }
}
