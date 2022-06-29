<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class card extends Model
{
    use HasFactory;


    protected $fillable = [
        'username',
        'firstname',
        'lastname',
        'email',
        'phone',
        'password',
        'address_id',
        'date_nais',
        'link', 'bio' ,
        'photo',
    ];
}
