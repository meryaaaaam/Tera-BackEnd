<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payment extends Model
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
        'is_security_deposit',
        'user_id',
        'client_fee',
        'is_cash_out',
        'cashout_status',
        'security_deposit_amount',
    ];

    protected $table = 'payments';

    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }

}
