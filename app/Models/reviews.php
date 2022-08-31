<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class reviews extends Model
{
    use HasFactory;

    protected $fillable = [
        'rate',
        'comment',
        'date',
        'title',
        'customer_id',
        'customer_name',
        'customer_photo',
        'vehicule_id'


    ];



    public function vehicule()
    {
        return $this->belongsTo(vehicule::class);
    }
}
