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
            $from = str_replace('/', '-', $request->start);
            $startday = substr($from,0 ,10);    // returns "f"
            $starthour = substr($from, 12);    // returns "f"
           // dd($day);
            
            $to =str_replace('/', '-', $request->end );
            $endday = substr($to,0 ,10);    // returns "f"
            $endhour = substr($to, 12);    // returns "f"
      
            $available = true ;
            $start =  strtotime($startday) ; 
            $start = date('d-m-Y ',$start) ;

       

            $resdatestart=0;

         $reservation = reservation_vehicules::where('vehicule_id' , $vehicule->id)->get() ;
         foreach($reservation as $res)
         {
            $resarray = reservation::where('id',$res->reservation_id)->get() ;
            foreach($resarray as $res)
            {
                $resdatestart =  strtotime($res->startday) ; 
                $resdatestart = date('d-m-Y ',$resdatestart) ;
                if($start==$resdatestart)
                { 
                $data[] = 
                ['startday'=>$res->startday,
                'starthour'=>$res->starthour,
                'endday'=>$res->endday,
                'endhour'=>$res->endhour,
            ]; 
         } dump($data) ;}}
 //dd($data) ;
 die();
         foreach($data as $r)
         {
         //   dump($r->startday) ;
            $resdatestart =  strtotime($r->startday) ; 
            $resdatestart = date('d-m-Y ',$resdatestart) ;
          //   dump($resdatestart) ;
            if($start==$resdatestart)
           { dump($resdatestart) ;}
         }
        /* ->where('end','>=',$request->end)
         ->orWhereBetween('start',[$request->start, $request->end])
         ->orWhereBetween('end',[$request->start, $request->end])->get() ;
        // ->whereBetween('start',[$start, $end])->get() ;
        /* ->orWhereBetween('end',[$request->start, $request->end])
         ->orWhere(function($query) use($request){
             $query->where('start','<=',$request->start)
                 ->where('end','>=',$request->end); })->first();
         dd($reservation) ; 
        foreach($reservation as $resv)
        {

            $u = reservation::find($resv->reservation_id)  ;
            dd($u) ;
            $date = Reservation::find($resv->reservation_id)->end ;
                $exist = reservation_vehicules::join() ;
            $leave_exists = reservation::where('id',$resv->reservation_id)
            ->join('categories', 'news.category_id', '=', 'categories.id')
            ->whereBetween('start',[$request->start, $request->end])
            ->orWhereBetween('end',[$request->start, $request->end])
            ->orWhere(function($query) use($request){
                $query->where('start','<=',$request->start)
                    ->where('end','>=',$request->end); })->first();
            /*$date =   strtotime($date) ;
            $datef = date('d-m-Y H:i:s',$date) ;
            if($start<$date){
                $available = false ;  //dump($startf.' < '.$datef , $available);
            }
      //      else {dump($startf.' > '.$datef , $available);}
            
        } */
 
       //die(); // dd($reservation) ; //  dd($resInfo);
       die();
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


        $op = reservation::create(['amount'=> $amount , 
        "startday"=>$startday ,  "starthour"=>$starthour ,
         "endday"=>$endday ,"endhour"=>$endhour ,
          "period"=> $periode ,
          "hours"=>round($hour) , 
         "days" => $days] ) ;
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
