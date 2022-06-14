<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Gallery extends Model
{
    use HasFactory;

    protected $fillable = [
        'path',
        'name',
        'size',
        'vehicule_id',

    ];
 //   protected $table = 'galleries';


    public function vehicule()
    {
        return $this->belongsTo(Vehicule::class);
    }
}
