<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Disputes extends Model
{
    use HasFactory;

    protected $fillable = [
        'date',
        'description',
        'host_name',
        'client_name',
        'user_id'
    ];
}
