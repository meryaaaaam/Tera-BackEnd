<?php

namespace App\Http\Controllers;

use App\Models\Gallery;
use App\Models\Make;
use App\Models\Model;
use App\Models\reservation;
use App\Models\reservation_vehicules;
use App\Models\User;
use App\Models\Vehicule;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use phpDocumentor\Reflection\DocBlock\Tags\Var_;

class ReservationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {


        $start = $request->start ;
        $start = str_replace('/', '-', $start);
        $end = $request->end ;
        $end =str_replace('/', '-', $end);
        $start =  strtotime($start) ;
        $start = date('Y-m-d H:i:s',$start) ;
        $end =  strtotime($end) ;
        $end = date('Y-m-d H:i:s',$end) ;
        $vehicule = Vehicule::All();
        $reservation = array();
       /* $reservationvehicule = reservation_vehicules::all();
        $vehicule = Vehicule::All('id as vehicule_id')->toArray();
        $reservation = reservation_vehicules::join('reservations', 'reservations.id' , 'reservations_vehicules.reservation_id')
        //->join('vehicules', 'vehicules.id' , 'reservations_vehicules.vehicule_id')
      //   ->union($vehicule)
            ->whereNot(function ($q) use($start, $end) {

           $q->WhereBetween('reservations.start',[$start, $end])
             ->orWhereBetween('reservations.end',[$start, $end])
             ->orWhere(function($query) use($start, $end){
                  $query->where('reservations.start','<=',$start)
                        ->where('reservations.end','>=',$end) ;}
             );

                    } )

                    ->get('vehicule_id')->toArray();

*/
           /* ->WhereBetween('reservations.start',[$start, $end])
            ->orWhereBetween('reservations.end',[$start, $end])
            ->orWhere(function($query) use($start, $end){
                $query->where('reservations.start','<=',$start)
                      ->where('reservations.end','>=',$end) ;})->get('vehicule_id') ;*/

                      foreach ($vehicule as $v )
                      {

                          $v = Vehicule::find($v->id);

                          $reservation[] = reservation_vehicules::join('reservations', 'reservations.id' , 'reservations_vehicules.reservation_id')
                          ->join('vehicules', function ($join) use ($v) {
                              $join->on('vehicules.id', '=', 'reservations_vehicules.vehicule_id')
                                   ->where('vehicules.id', '=', $v->id);
                          }) ->where(function ($q) use($start, $end) {

                              $q->WhereBetween('reservations.start',[$start, $end])
                                ->orWhereBetween('reservations.end',[$start, $end])
                                ->orWhere(function($query) use($start, $end){
                                     $query->where('reservations.start','<=',$start)
                                           ->where('reservations.end','>=',$end) ;}
                                );

                                       } )

                                       ->get('vehicule_id' )->toArray();

                        }
              foreach($reservation as $r) { dd($r); $reservations[] = $r['vehicule_id'];  }
                      $reservation = array_unique($reservations) ;

                    $i = 0 ;
                $vehicules = Vehicule::All('vehicule_id')->toArray();

            foreach($vehicules as $v)
            {

                foreach($reservation as $r) { if ($v['vehicule_id'] == $r) { unset($vehicule[$i]); } } $i++;
            }
           // dd($vehicule);*/
//$reservation = array() ;
            foreach ($vehicule as $v )
            {

                $v = Vehicule::find($v->id);

                $reservation[] = reservation_vehicules::join('reservations', 'reservations.id' , 'reservations_vehicules.reservation_id')
                ->join('vehicules', function ($join) use ($v) {
                    $join->on('vehicules.id', '=', 'reservations_vehicules.vehicule_id')
                         ->where('vehicules.id', '=', $v->id);
                }) ->where(function ($q) use($start, $end) {

                    $q->WhereBetween('reservations.start',[$start, $end])
                      ->orWhereBetween('reservations.end',[$start, $end])
                      ->orWhere(function($query) use($start, $end){
                           $query->where('reservations.start','<=',$start)
                                 ->where('reservations.end','>=',$end) ;}
                      );

                             } )

                             ->get('vehicule_id' );
               //dd($reservation);
               /* $gallerie = Gallery::where('vehicule_id' , $v->id)->get() ;
                foreach ($gallerie as $g )
                {
                    $images[] = "http://localhost:8000/storage/image/vehicule/".$g->name ;
                }
                $model = Model::find( $v->model_id) ;
                $make = Make::find($model->make_id) ;
                $user = User::find($v->user_id) ;
                if($gallerie)
                {  $res[] = [
                    "id" =>  $v->id ,
                    "km" =>  $v->km ,
                    "matricule" =>  $v->matricule ,
                    "Price_D" =>  $v->Price_D ,
                    "Price_H" =>  $v->Price_H ,

                    'location'=>  $v->location ,
                    'model'=>  $make->name." ".$model->name ." ".$model->type." ".$model->year ,
                    'user'=>  $user->firstname." ".$user->lastname ,
                    'authorImg'=> "http://localhost:8000/storage/image/". $user->photo,
                    'image' => "http://localhost:8000/storage/image/vehicule/".$v->photo,
                    "nb" =>  $v->nb_reservation ,
                    "images" =>  $images ,

                ];}
                    else
                    {$res[] = ["id" =>  $v->id ,
                        "km" =>  $v->km ,
                        "matricule" =>  $v->matricule ,
                        "Price_D" =>  $v->Price_D ,
                        "Price_H" =>  $v->Price_D ,

                        'location'=>  $v->location ,
                        'model'=>  $make->name." ".$model->name ." ".$model->type." ".$model->year ,
                        'user'=>  $user->firstname." ".$user->lastname ,

                        ];}*/
                        }
            return response()->json($reservation , 200 );
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
            $vehicule = Vehicule::find($request->vehicule) ;
            $start = $request->start ;
            $start = str_replace('/', '-', $start);
           /* $day = substr($start,0 ,10);    // returns "f"
            $hour = substr($start, 12);    // returns "f"
            dd($day);*/
            $end = $request->end ;
            $end =str_replace('/', '-', $end);


            $available = true ;
            $start =  strtotime($start) ;
            $start = date('Y-m-d H:i:s',$start) ;

            $end =  strtotime($end) ;
            $end = date('Y-m-d H:i:s',$end) ;

            $reservation = reservation_vehicules::where('vehicule_id' ,$vehicule->id)->first();
            if($reservation)
            {
                $reservation = reservation_vehicules::where('vehicule_id' ,$vehicule->id)
            ->join('reservations', 'reservations.id' , 'reservations_vehicules.reservation_id')
            ->WhereBetween('start',[$start, $end])
            ->orWhereBetween('end',[$start, $end])
            ->orWhere(function($query) use($start, $end){
                $query->where('start','<=',$start)
                      ->where('end','>=',$end) ;})
             ->first();}
             else
             {$available = true ;}
            //    dd($reservation);
            //whereDate('start','=', $start)->get();
           // dd($reservation) ;
            if($reservation)
                {$available = false ;}







        if($available){
        $reservation = reservation_vehicules::where('vehicule_id' , $vehicule->id) ;
        $veh =  $vehicule->nb_reservation +1 ;
        $hour = 0 ;
        $days = 0 ;

        $start = $request->start ;
        $start = str_replace('/', '-', $start);
        // dd($date)   ;
        $end = $request->end ;
        $end =str_replace('/', '-', $end);
        //  $periode = $end-$start ;

        $end = strtotime($end) ;
        $start= strtotime($start);
        $periode = (($end - $start)/3600)/24 ;

        if($periode>=1){
            $days = (($end - $start)/3600)/24 ;
            $periode = round($days)." Jour(s)";
           $amount = $vehicule->Price_D * round($days+1) ;
        }
        else
        {
            $periode =  round($end - $start)/3600  ;
            $periode =  round($periode)." Heure(s)" ;
            $hour =  round($end - $start)/3600 ;
            $amount =   $vehicule->Price_H * $hour;
        }

        $start = date('Y-m-d H:i:s',$start) ;
        $end = date('Y-m-d H:i:s',$end) ;
       // dd($start) ;

         // dd($amount) ;
        //   $startdate = date('Y-m-d H:i',$request->strt );
       // $enddate = date('Y-m-d H:i',$request->end );
      //   $c = $request->start->format('Y-m-d H:i') ; dd($c) ;

        $days = round($days) ;

        $op = reservation::create(['amount'=> $amount , "start"=>$start , "end"=>$end , "period"=> $periode , "hours"=>round($hour) , "days" => $days] ) ;
        $opv = reservation_vehicules::create(['reservation_id'=>$op->id , "vehicule_id"=>$request->vehicule]) ;
        $vehicule->update([  "nb_reservation" => $veh]) ;
        return response()->json("Done" , 200 );
    }
    else
    {  return response()->json("This car not available for now" , 200 );
    }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }


    public function totalprice(Request $request)
    {
        $vehicule = Vehicule::find($request->vehicule) ;




        $start = $request->start ;
        $start = str_replace('/', '-', $start);
    // dd($date)   ;
        $end = $request->end ;
        $end =str_replace('/', '-', $end);
      //  $periode = $end-$start ;
            $p=0 ;
            $h= 0 ;
        $end = strtotime($end) ;
        $start= strtotime($start);
        $periode = (($end - $start)/3600)/24 ;

        if($periode>1){
            $periode = (($end - $start)/3600)/24 ;
            $amount = $vehicule->Price_D * round($periode+1) ;
             //   dd($periode);
            $p = round($periode)." Jour" ;
        }
        else
        {
           // $periode =  round($end - $start) ;
            $hour =  round($end - $start) ;
            $amount =   $vehicule->Price_H * $hour/3600;
            $h = (round($hour)/3600)." Heure";
        }

        $start = date('Y-m-d H:i:s',$start) ;
        $end = date('Y-m-d H:i:s',$end) ;
       // dd($start) ;}

       return response()->json([ "amount"=>$amount , 'hour'=>$h , 'days'=>$p]);
}

}
