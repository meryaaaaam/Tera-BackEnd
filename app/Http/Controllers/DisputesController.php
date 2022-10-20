<?php

namespace App\Http\Controllers;

 use App\Models\Disputes;
use App\Models\reservation;
use App\Models\reservation_vehicules;
use App\Models\User;
use App\Models\Vehicule;
use Exception;
use Illuminate\Http\Request;

class DisputesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $disputes =  Disputes::with(['Reservation'])->orderBy('created_at', 'desc')->get();
          foreach($disputes as $dispute)
         {
            $date= strtotime($dispute->date);
            $rep[] = ["id" => $dispute->id ,
            "amount" => $dispute->reservation->amount ,
            "period" => $dispute->reservation->period ,
            "start_date" =>  date("Y-m-d H:i",strtotime($dispute->reservation->start)) ,
            "end_date" =>  date("Y-m-d H:i",strtotime($dispute->reservation->end)) ,
            "period" => $dispute->reservation->period ,
            "customer_name" => $dispute->client_name ,
            "customer_photo" => User::find($dispute->client_id)->photo ,
            "customer_number" => User::find($dispute->client_id)->phone ,
            "customer_email" => User::find($dispute->client_id)->email ,
            "booking_id" => $dispute->reservation->id  ,
            "booking_status" => $dispute->reservation->booking_status  ,
            "booking_title" => $dispute->reservation->booking_title  ,
            "date" =>    date("Y-m-d H:i",$date),
            "host_name" =>   $dispute->host_name ,
            "host_photo" =>   User::find($dispute->host_id)->photo   ,
            "host_number" => User::find($dispute->host_id)->phone ,
            "host_email" => User::find($dispute->host_id)->email ,
            "description" =>   $dispute->description ,

         ] ;
         }
          //  dd($disputes) ;*/
            return response()->json(['disputes' => $rep]);
        } catch (Exception $e) {
            return $e;
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {


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

    public function openDispute(Request $request)
    {
        try {

            $request->validate([

                'description' => 'nullable',
                'reservation_id' => 'required',

            ]);

            $data = $request->all();
            $customer_id=reservation::find($request->reservation_id)->customer_id ;
            $booking = reservation::find($request->reservation_id);
            $vehiucle_id = reservation_vehicules::where('reservation_id', $request->reservation_id)->get('vehicule_id') ;
            $host_id = Vehicule::find($vehiucle_id)->first()->user_id ;
            $customer = User::find($customer_id) ;
            $host = User::find($host_id) ;
            $customer_name = $customer->firstname." ".$customer->lastname ;
            $host_name =  $host->firstname." ".$host->lastname ;

            $dispute = new Disputes();

            $dispute->client_name = $customer_name;
            $dispute->client_id = $customer_id;
            $dispute->host_id =  $host_id;
            $dispute->host_name =  $host_name;
            $dispute->reservation_id = $data['reservation_id'];
            $dispute->description = $data['description'];
            $dispute->date = now();
            $dispute->save();

            $booking->update(['booking_status' => "Demande Dispute"]);

            return response()->json(['message' => "Dispute entered succesfully"]);

        } catch (Exception $e) {
            return $e;
        }

    }


}
