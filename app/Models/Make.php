<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Make extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'image'

    ];

    public function Vehicule()
    {
        return $this->hasMany(Vehicule::class);
    }

    public function Model()
    {
        return $this->hasMany(Model::class);
    }
}
