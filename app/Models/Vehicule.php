<?php

namespace App\Models;

use App\Models\Model as ModelsModel;
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
        'available',
        'nb_review',
        'rate'


    ];


    public function options()
    {
        return $this->belongsToMany(option::class , 'vehicule_options', 'vehicule_id', 'options_id');
    }


    public function Gallery()
    {
        return $this->hasMany(Gallery::class);
    }

    public function Model()
    {
        return $this->hasOne(ModelsModel::class);
    }



    public function reservations()
    {
        return $this->belongsToMany(reservation::class ,  'reservations_vehicules', 'vehicule_id', 'reservation_id');
    }

    public function reviews()
    {
        return $this->hasMany(reviews::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
