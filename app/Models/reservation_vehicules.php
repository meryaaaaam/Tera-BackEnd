<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\Pivot;

class reservation_vehicules extends Pivot
{
    use HasFactory;

   /* protected $fillable = [

        'vehicule_id',
        'reservation_id',

    ];*/
    public $incrementing = true;

protected $table = 'reservations_vehicules';
}
