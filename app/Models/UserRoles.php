<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\Pivot;

class UserRoles extends Pivot
{
    use HasFactory;



    protected $fillable = [

        'user_id',
        'role_id',

    ];



/**
 * Indicates if the IDs are auto-incrementing.
 *
 * @var bool
 */
public $incrementing = true;

protected $table = 'user_roles';

}
