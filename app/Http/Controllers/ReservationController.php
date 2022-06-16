<?php

namespace App\Http\Controllers;

use App\Models\reservation;
use App\Models\reservation_vehicules;
use App\Models\Vehicule;
use Illuminate\Http\Request;

class ReservationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        $end = $request->end ;
      //  $periode = $end-$start ;

        $end = strtotime($end) ;
        $start= strtotime($start);
        $periode = (($end - $start)/3600)/24 ;

        if($periode>1){
            $periode = (($end - $start)/3600)/24 ;
           $amount = $vehicule->Price_D * round($periode+1) ;
        }
        else
        {
            $hour =  round($end - $start) ;
            $amount =   $vehicule->Price_H * $hour/3600;
        }

        $start = date('Y-m-d H:i:s',$start) ;
        $end = date('Y-m-d H:i:s',$end) ;
       // dd($start) ;

       // dd($amount) ;
    //   $startdate = date('Y-m-d H:i',$request->strt );
      // $enddate = date('Y-m-d H:i',$request->end );
   //   $c = $request->start->format('Y-m-d H:i') ; dd($c) ;


        $op = reservation::create(['amount'=> $amount , "start"=>$start , "end"=>$end] ) ;
        $opv = reservation_vehicules::create(['reservation_id'=>$op->id , "vehicule_id"=>$request->vehicule]) ;

        return response()->json("Done" , 200 );

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
}
