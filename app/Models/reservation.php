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
        'period',

    ];



    public function vehicules()
    {
        return $this->belongsToMany(Roles::class , 'reservation_vehicules', 'reservation_id', 'vehicule_id');
    }
}
