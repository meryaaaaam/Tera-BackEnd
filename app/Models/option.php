<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class option extends Model
{
    use HasFactory;

    protected $fillable = [
        'label',
        'icon',

    ];


    public function vehicules()
    {
        return $this->belongsToMany(Vehicule::class);
    }
}
