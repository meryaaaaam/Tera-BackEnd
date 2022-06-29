<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class card extends Model
{
    use HasFactory;


    protected $fillable = [
        'Driving_licence_side1',
        'Driving_licence_side2',
        'holder_name',
        'card_number',
        'card_date' ,
        'cvv',
        'save',
        'user_id',

    ];
 //   protected $card_date = 'm-Y';
    protected $casts = [
        'card_date' => 'date:m-Y', // Change your format
       // 'updated_at' => 'datetime:d/m/Y',
    ];

    public function setDateAttribute($value)
    {
        if( $value ){
            $data = Carbon::createFromFormat('m/Y', $value)->format('Y-m');
            $this->attributes['card_date'] = $data;
        }
    }
}
