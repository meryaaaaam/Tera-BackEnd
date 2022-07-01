<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vehicule extends Model
{
    use HasFactory;



    protected $fillable = [
        'km',
        'matricule' ,
        'Price_H',
        'Price_D',
        'location',
        'model_id',
        'user_id',
        'portes',
        'carburant',
        'transmission',
        'description',
        'photo',
        'siege',
        'carburan',
        'nb_reservation',
        'balance' ,
        'bail',
        'available'


    ];


    public function options()
    {
        return $this->belongsToMany(option::class , 'vehicule_Options', 'vehicule_id', 'options_id');
    }


    public function Gallery()
    {
        return $this->hasMany(Gallery::class);
    }



    public function reservations()
    {
        return $this->belongsToMany(reservation::class ,  'reservation_vehicules', 'vehicule_id', 'options_id');
    }
}
