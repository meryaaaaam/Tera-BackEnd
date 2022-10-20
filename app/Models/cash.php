<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class cash extends Model
{
    use HasFactory;

    protected $fillable = [

        'transaction_id',
        'authorizing_merchant_id',
        'message',
        'auth_code',
        'order_number',
        'type',
        'created',
        'amount',
        'payment_method',
        'user_id',
        'client_fee',
        'is_cash_out',
        'cashout_status',
        'user_id'

    ];



    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }



}
