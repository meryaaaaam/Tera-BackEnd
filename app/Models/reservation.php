<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class reservation extends Model
{
    use HasFactory;

    protected $fillable = [
        'amount',
        'startday',
        'starthour',
        'endday',
        'endhour',
        'days',
        'hours',
        'period',

    ];



    public function vehicules()
    {
        return $this->belongsToMany(Vehicule::class);
    }
}
