<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Disputes extends Model
{
    use HasFactory;

    protected $fillable = [
        'date',
        'description',
        'host_name',
        'host_id',
        'client_name',
        'client_id',
        'reservation_id'
    ];

    public function Reservation()
    {
        return $this->belongsTo(reservation::class);
    }
}
