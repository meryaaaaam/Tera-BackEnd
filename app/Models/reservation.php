<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class reservation extends Model
{
    use HasFactory;

    protected $fillable = [
        'amount',
        'start',
        'end',
        'days',
        'hours',
        'period',
        'customer_id',
        'booking_title',
        'booking_status'

    ];



    public function vehicules()
    {
        return $this->belongsToMany(Vehicule::class);
    }


    public function payments()
    {
        return $this->hasMany(Payment::class  );
    }

}
