<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    use HasFactory;

    protected $fillable = [
        'customer_name',
        'customer_number',
        'customer_email',
        'booking_title',
        'booking_status',
        'user_id',
        'payment_id'
    ];

    protected $table = 'bookings';

    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }

    public function payment()
    {
        return $this->belongsTo(Payment::class,'payment_id');
    }

}
