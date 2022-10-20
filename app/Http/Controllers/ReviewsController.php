<?php

namespace App\Http\Controllers;

use App\Models\Make;
use App\Models\Model;
use App\Models\reservation;
use App\Models\reservation_vehicules;
use App\Models\reviews;
use App\Models\User;
use App\Models\Vehicule;
use DateTime;
use Exception;
use Illuminate\Http\Request;

class ReviewsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
           // $bookings =  reservation::with(['reviews'])->get();
            $vehicules = Vehicule::with(['reviews'])->get();
                foreach ($vehicules as $v)
                {

                }
            $reservation = $vehicules->reservations();
            return response()->json(['review' => $vehicules]);
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

        $request->validate([
            'rate' => ['required', 'in:1,2,3,4,5'],
            'customer_id' => 'required',
            'vehicule_id' => 'required',
            'comment' => 'required',
            'date' =>''

        ]);

        $data = $request->all();

        try {
           // $vehicule = Vehicule::with(['reservations'])->where('id',$request->vehicule_id)->where('reservations.customer_id',$request->customer_id)->get() ;

           //check if user has make a reservation before
            $reservation  = reservation_vehicules::join('reservations', 'reservations.id' , 'reservations_vehicules.reservation_id')
            ->join('vehicules', function ($join) use ($request) {
                $join->on('vehicules.id', '=', 'reservations_vehicules.vehicule_id')
                     ->where('vehicules.id', '=', $request->vehicule_id); })
                          ->where(function ($q) use($request) {
                                $q->Where('reservations.customer_id',$request->customer_id);} )
                    ->first() ;
             //dd ($reservation) ;

           if($reservation)
           {
            $user = User::find($request->customer_id);
            $data['date'] = new DateTime();
            $data['title'] = $reservation->booking_title;
            $data['customer_name'] = $user->firstname.' '.$user->lastname;
            $data['customer_photo'] = "https://7rentals.com/backend/public/storage/image/".$user->photo;
             $reviews =  reviews::create($data);
             $i = 0 ;
             $single_rate = 0 ;
             $vehicule = Vehicule::find($request->vehicule_id);
             $Old_Reviews = Vehicule::with('reviews')->find($request->vehicule_id)->reviews;
           //  $nb = $vehicule->nb_review+1 ;
             $nb = $vehicule->nb_review+1 ;
             foreach($Old_Reviews as $r)
             {

                $single_rate = $single_rate+$r->rate ;
                $i = $i+1 ;
             }
             $moy_review = $single_rate / $i ;
            // $rate = ($vehicule->rate+$request->rate)/2 ;

             $vehicule->update(['rate' => $moy_review ,  'nb_review' => $nb]);

                return response()->json(['message'=> 'review has been created','Result'=>$reviews ] , 200 );
                 }
            else
            {
                return response()->json(['message'=> 'you can leave a comment only if you pased a reservation before'] , 200 );
            }



            /*
            * Handle successful transaction, payment method returns
            * transaction details as result, so $result contains that data
            * in the form of associative array.
            */
        } catch (\Beanstream\Exception $e) {

            return $e;
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
        try {


             $vehicules = vehicule::with(['reviews'])->find($id) ;
           //  $user = User::find($vehicules->reviews->customer_id);

             return response()->json(['response' => $vehicules->reviews]);
         } catch (Exception $e) {
             return $e;
         }
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

    public function Fetch_Reviews_For_User($id)
    {
        $vehicules = User::with(['vehicules'])->find($id) ;

        foreach($vehicules->vehicules as $v )
        {
            $model = Model::find( $v->model_id) ;
            $make = Make::find($model->make_id) ;
            $vehiculewithreviews = vehicule::with(['reviews','Gallery'])->find($v->id) ;


                //$user = User::find($vgr->customer_id);
                $gallery[] = "https://7rentals.com/backend/public/storage/image/vehicule/".$vehiculewithreviews->photo ;
                $gallery[] = "https://7rentals.com/backend/public/storage/image/vehicule/".$vehiculewithreviews->Gallery[0]->name ;
                $gallery[] = "https://7rentals.com/backend/public/storage/image/vehicule/".$vehiculewithreviews->Gallery[1]->name ;




            foreach ($vehiculewithreviews->reviews as $vgr)
            {

                $vehicule[] = [ "id" =>  $vehiculewithreviews->id ,
                                "photo" => "https://7rentals.com/backend/public/storage/image/vehicule".$vehiculewithreviews->photo ,
                                "model" =>  $make->name." ".$model->name ." ".$model->type." ".$model->year ,
                                "gallery" => $gallery ,
                                "reviews_id" => $vgr->id,
                                "reviews_date" => $vgr->date,
                                "reviews_comment" =>$vgr->comment,
                                "customer_id" => $vgr->customer_id,
                                "review_title" => $vgr->title,
                                "customer_photo" => $vgr->customer_photo,
                                "customer_name" => $vgr->customer_name,
                                "rate" => $vgr->rate,


             ] ;

            }




        }



        return response()->json($vehicule , 200 );
    }
}
