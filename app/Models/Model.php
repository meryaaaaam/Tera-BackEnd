<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model as m;

class Model extends m
{
    use HasFactory;


    protected $fillable = [
        'name',
        'type',
        'year',
        'make_id',

    ];


    public function Make()
    {
        return $this->belongsTo(Make::class);
    }
}
