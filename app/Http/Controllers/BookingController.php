<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use App\Models\card;
use App\Models\Payment;
use App\Models\reservation;
use App\Models\reservation_vehicules;
use App\Models\User;
use App\Models\Vehicule;
use Exception;
use Illuminate\Http\Request;

class BookingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $reservations=array() ;

        $vehicules = Vehicule::with(['reservations'])->get() ;
         foreach($vehicules as $rv)
        {

             foreach($rv->reservations as $reserv)
            {

                //$reservations[] = [Payment::where('reservation_id',$reserv->id)->get() , 'reserv'=>$reserv->booking_status] ;
                if($reserv->booking_status=="Approved" || $reserv->booking_status=="Demande Dispute"  )
               { $reservations[] =  ["id" => $reserv->id ,
                                    "amount" => $reserv->amount ,
                                    "period" => $reserv->period ,
                                    "customer_name" => User::find($reserv->customer_id)->firstname.' '.User::find($reserv->customer_id)->lastname ,
                                    "customer_photo" => User::find($reserv->customer_id)->photo ,
                                    "customer_number" => User::find($reserv->customer_id)->phone ,
                                    "customer_email" => User::find($reserv->customer_id)->email ,
                                    "booking_status" => $reserv->booking_status  ,
                                    "booking_title" => $reserv->booking_title  ,
                                    "date" => $reserv->created_at  ,
                                    "host_name" =>     User::find($rv->user_id)->firstname.' '.User::find($rv->user_id)->lastname ,



                ] ;


             }



            }

        }
     if($reservations)
       { return response()->json(['bookings' => $reservations]);}
     else
     {return response()->json(['bookings' => []]);}

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

    public function changeBookingStatus(Request $request)
    {
        try {
                $request->validate([
                    'booking_id' => 'required',
                    'action' => 'required',
                    //'transaction_id' =>'required',
                ]);

                $data = $request->all();

                $booking =  reservation::where('id',$data['booking_id'])->first();
                $vehiucle_id = reservation_vehicules::where('reservation_id', $request->booking_id)->get('vehicule_id') ;
                $security_deposit = Vehicule::find($vehiucle_id)->first()->bail ;


                if ($data['action'] == 'Declined')
                {
                    //$transaction = Payment::where('user_id',$booking->user_id)->where('transaction_id',$data['transaction_id'])->first();
                    $transaction = Payment::where('reservation_id',$request->booking_id)->where('type','PA1')->first();
                  // $security_deposit = $transaction->security_deposit_amount ;
                    $transactionId = $transaction->transaction_id;
                    $amount = $transaction->amount;
                    $orderNumber = $transaction->order_number;
                    $merchant_id = '383610961'; //INSERT MERCHANT ID (must be a 9 digit string)
                    $api_key = '31b131a891aA409d96D7Fdae001bD5D6'; //INSERT API ACCESS PASSCODE
                    $api_version = 'v1'; //default
                    $platform = 'api'; //default
                    //Create Beanstream Gateway
                    $beanstream = new \Beanstream\Gateway($merchant_id, $api_key, $platform, $api_version);
                    $transcations ="";
                    $transaction_check =$beanstream->reporting()->getTransaction($transactionId);
                    //dd($transaction_check['adjusted_by']);
                    foreach($transaction_check['adjusted_by'] as $t)
                    {
                        $transcations = $t ;
                    }
                    //dump($transaction_check) ;
                    //dd($transcations) ;
                    $check = $transaction_check['adjusted_by']?true:false ;
                    if($check && $transcations['approval']==2)
                    {
                        $input = getDate(strtotime($transaction_check['created']));
                        $date = $input['year'].'-'.$input['mon'].'-'.$input['mday'];
                    // dd($date);
                        $paymentModel = new Payment();
                        $paymentModel->transaction_id = !empty($transcations['id']) ? $transcations['id'] : null;
                        $paymentModel->authorizing_merchant_id = !empty($transaction_check['authorizing_merchant_id']) ? $transaction_check['authorizing_merchant_id'] : null;
                        $paymentModel->message = !empty($transcations['message']) ? $transcations['message'] : "TEST";
                        $paymentModel->auth_code = !empty($transaction_check['auth_code']) ? $transaction_check['auth_code'] : null;
                        $paymentModel->order_number = !empty($transaction_check['order_number']) ? $transaction_check['order_number'] : null;
                        $paymentModel->type =  "PAC1";
                        $paymentModel->created = !empty($date) ? $date : null;
                        $paymentModel->amount = $amount;
                        $paymentModel->payment_method = !empty($transaction_check['payment_method']) ? $transaction_check['payment_method'] : null;
                        $paymentModel->is_approved = 0;

                        $paymentModel->is_security_deposit = true;
                        $paymentModel->reservation_id = $request->booking_id ;

                        $paymentModel->security_deposit_amount = $security_deposit;
                      //  $paymentModel->cashout_status = "Pending";
                        $paymentModel->payment_status = "Operation Failed";
                        $paymentModel->client_fee = 4.99;
                        $paymentModel->save();
                        return response()->json(['message' => $transcations['message']]);
                    }
                    else
                    {  // dd($transaction_check) ;
                        $result = $beanstream->payments()->complete($transactionId,$amount, $orderNumber);

                        $paymentModel = new Payment();
                        $paymentModel->transaction_id = !empty($result['id']) ? $result['id'] : null;
                        $paymentModel->authorizing_merchant_id = !empty($result['authorizing_merchant_id']) ? $result['authorizing_merchant_id'] : null;
                        $paymentModel->message = !empty($result['message']) ? $result['message'] : "TEST";
                        $paymentModel->auth_code = !empty($result['auth_code']) ? $result['auth_code'] : null;
                        $paymentModel->order_number = !empty($result['order_number']) ? $result['order_number'] : null;
                        $paymentModel->type =  "PAC1";
                        $paymentModel->created = !empty($result['created']) ? $result['created'] : null;
                        $paymentModel->amount = $amount;
                        $paymentModel->payment_method = !empty($result['payment_method']) ? $result['payment_method'] : null;
                        $paymentModel->is_approved = 1;

                        $paymentModel->is_security_deposit = true;
                        $paymentModel->reservation_id = $request->booking_id ;

                        $paymentModel->security_deposit_amount = $security_deposit;
                        //$paymentModel->cashout_status = "Pending";
                        $paymentModel->payment_status = "Amount Received";
                        $paymentModel->client_fee = 4.99;
                        $paymentModel->save();

                        $vehiucle_id = reservation_vehicules::where('reservation_id', $request->booking_id)->get('vehicule_id') ;
                        $user_id = Vehicule::find($vehiucle_id)->first()->user_id ;
                        $user = User::find($user_id) ;
                        $previousBalance = $user->balance;
                        $newBalance = $previousBalance - $result['amount'];
                        $user->update(['balance'=> $newBalance]);
                        $reservation = reservation::find($request->booking_id );
                        $reservation->update(['booking_status'=> 'Declined']);



                        $payment = Payment::where('reservation_id',$request->booking_id)->where('type','PAC1')->first();
                        $transaction_id = $payment->transaction_id ;
                        $amount = $payment->amount ;
                        $order_id = $payment->order_number ;

                        $transaction_check =$beanstream->reporting()->getTransaction($transaction_id);
                        foreach($transaction_check['adjusted_by'] as $t)
                        {
                            $transcations = $t ;
                        }
                        $check = $transaction_check['adjusted_by']?true:false ;

                        if($check && $transcations['approval']==2)
                        {
                            $input = getDate(strtotime($transaction_check['created']));
                            $date = $input['year'].'-'.$input['mon'].'-'.$input['mday'];
                        // dd($date);
                            $paymentModel = new Payment();
                            $paymentModel->transaction_id = !empty($transcations['id']) ? $transcations['id'] : null;
                            $paymentModel->authorizing_merchant_id = !empty($transaction_check['authorizing_merchant_id']) ? $transaction_check['authorizing_merchant_id'] : null;
                            $paymentModel->message = !empty($transcations['message']) ? $transcations['message'] : "TEST";
                            $paymentModel->auth_code = !empty($transaction_check['auth_code']) ? $transaction_check['auth_code'] : null;
                            $paymentModel->order_number = !empty($transaction_check['order_number']) ? $transaction_check['order_number'] : null;
                            $paymentModel->type =  "VR1";
                            $paymentModel->created = !empty($date) ? $date : null;
                            $paymentModel->amount = $amount;
                            $paymentModel->payment_method = !empty($transaction_check['payment_method']) ? $transaction_check['payment_method'] : null;
                            $paymentModel->is_approved = 0;

                            $paymentModel->is_security_deposit = true;
                            $paymentModel->reservation_id = $request->booking_id ;

                            $paymentModel->security_deposit_amount = $security_deposit;
                            //$paymentModel->cashout_status = "Pending";
                            $paymentModel->payment_status = "Operation Failed";
                            $paymentModel->client_fee = 4.99;
                            $paymentModel->save();
                            return response()->json(['message' => $transcations['message']]);
                        }
                        else
                        {
                            $result = $beanstream->payments()->returnPayment($transaction_id,$amount, $order_id);



                            $paymentModel = new Payment();
                            $paymentModel->transaction_id = !empty($result['id']) ? $result['id'] : null;
                            $paymentModel->authorizing_merchant_id = !empty($result['authorizing_merchant_id']) ? $result['authorizing_merchant_id'] : null;
                            $paymentModel->message = !empty($result['message']) ? $result['message'] : "TEST";
                            $paymentModel->auth_code = !empty($result['auth_code']) ? $result['auth_code'] : null;
                            $paymentModel->order_number = !empty($result['order_number']) ? $result['order_number'] : null;
                            $paymentModel->type =  "VR1";
                            $paymentModel->created = !empty($result['created']) ? $result['created'] : null;
                            $paymentModel->amount = $amount;
                            $paymentModel->payment_method = !empty($result['payment_method']) ? $result['payment_method'] : null;
                            $paymentModel->is_approved = 1;
                            $paymentModel->reservation_id = $request->booking_id ;
                            $paymentModel->is_security_deposit = true;
                            $paymentModel->security_deposit_amount = $security_deposit;
                            $paymentModel->payment_status = "Amount Returned";
                            $paymentModel->client_fee = 4.99;
                            $paymentModel->save();



                            $payment = Payment::where('reservation_id',$request->booking_id)->where('type','PA2')->first();
                            $transaction_id = $payment->transaction_id ;
                            $amount = $payment->amount ;
                            $vehiucle_id = reservation_vehicules::where('reservation_id', $request->booking_id)->get('vehicule_id') ;
                            $security_deposit = Vehicule::find($vehiucle_id)->first()->bail ;
                            $order_id = $payment->order_number ;
                            $data = $request->all();



                        try {

                                if($payment->is_approved)

                                    {
                                        $merchant_id = '383610961'; //INSERT MERCHANT ID (must be a 9 digit string)
                                        $api_key = '31b131a891aA409d96D7Fdae001bD5D6'; //INSERT API ACCESS PASSCODE
                                        $api_version = 'v1'; //default
                                        $platform = 'api'; //default

                                        //Create Beanstream Gateway
                                        $beanstream = new \Beanstream\Gateway($merchant_id, $api_key, $platform, $api_version);


                                        $result = $beanstream->payments()->complete($transaction_id,$security_deposit, $order_id);
                                        $paymentModel = new Payment();
                                        $paymentModel->transaction_id = !empty($result['id']) ? $result['id'] : null;
                                        $paymentModel->authorizing_merchant_id = !empty($result['authorizing_merchant_id']) ? $result['authorizing_merchant_id'] : null;
                                        $paymentModel->message = !empty($result['message']) ? $result['message'] : "TEST";
                                        $paymentModel->auth_code = !empty($result['auth_code']) ? $result['auth_code'] : null;
                                        $paymentModel->order_number = !empty($result['order_number']) ? $result['order_number'] : null;
                                        $paymentModel->type =  "PAC2";
                                        $paymentModel->created = !empty($result['created']) ? $result['created'] : null;
                                        $paymentModel->amount = $security_deposit;
                                        //$paymentModel->amount = 0;
                                        $paymentModel->payment_status = "Deposit Received";
                                        $paymentModel->payment_method = !empty($result['payment_method']) ? $result['payment_method'] : null;
                                        $paymentModel->is_approved = 1;
                                        $paymentModel->reservation_id = $request->booking_id ;
                                        $paymentModel->is_security_deposit = true;
                                        $paymentModel->security_deposit_amount = $security_deposit;
                                        $paymentModel->client_fee = 4.99;
                                        $paymentModel->save();
                                        $payment = Payment::where('reservation_id',$request->booking_id)->where('type','PAC2')->first();
                                        $transaction_id = $payment->transaction_id ;
                                        $amount = $payment->amount ;
                                        // $security_deposit = $payment->security_deposit_amount ;
                                        //dd($security_deposit);
                                        $order_id = $payment->order_number ;

                                        $result = $beanstream->payments()->returnPayment($transaction_id,$security_deposit, $order_id);

                                        $paymentModel = new Payment();
                                        $paymentModel->transaction_id = !empty($result['id']) ? $result['id'] : null;
                                        $paymentModel->authorizing_merchant_id = !empty($result['authorizing_merchant_id']) ? $result['authorizing_merchant_id'] : null;
                                        $paymentModel->message = !empty($result['message']) ? $result['message'] : "TEST";
                                        $paymentModel->auth_code = !empty($result['auth_code']) ? $result['auth_code'] : null;
                                        $paymentModel->order_number = !empty($result['order_number']) ? $result['order_number'] : null;
                                        $paymentModel->type =  "VR2";
                                        $paymentModel->created = !empty($result['created']) ? $result['created'] : null;
                                        $paymentModel->amount = $security_deposit;
                                        //$paymentModel->amount = 0;
                                        $paymentModel->payment_status = "Deposit Returned";

                                        $paymentModel->payment_method = !empty($result['payment_method']) ? $result['payment_method'] : null;
                                        $paymentModel->is_approved = 1;
                                        $paymentModel->reservation_id = $request->booking_id ;
                                        $paymentModel->is_security_deposit = true;
                                        $paymentModel->security_deposit_amount = $security_deposit;
                                        $paymentModel->client_fee = 4.99;
                                        $paymentModel->save();





                                    }

                                return response()->json(['message' => 'Deposit and amount returned back' , 'result' => $result]);

                            } catch (\Beanstream\Exception $e) {

                                $message = $e->getMessage();
                                $code = $e->getCode();

                                return (['message' => $message , 'code'=>$code ]);
                                }


                        }
                    }

                $booking->update(['booking_status' => $data['action']]);

                return response()->json(['message' => 'Booking status changed successfully' , 'booking' => $booking]);
                }
                 //--------------------------------------------------- Validated action
                elseif ($data['action'] == 'Validated')
                 {
                    $payment = Payment::where('reservation_id',$request->booking_id)->where('type','PA2')->first();
                    $transaction_id = $payment->transaction_id ;
                    $amount = $payment->amount ;
                    $vehiucle_id = reservation_vehicules::where('reservation_id', $request->booking_id)->get('vehicule_id') ;
                    $security_deposit = Vehicule::find($vehiucle_id)->first()->bail ;
                    $order_id = $payment->order_number ;
                    $data = $request->all();

                     $merchant_id = '383610961'; //INSERT MERCHANT ID (must be a 9 digit string)
                     $api_key = '31b131a891aA409d96D7Fdae001bD5D6'; //INSERT API ACCESS PASSCODE
                     $api_version = 'v1'; //default
                     $platform = 'api'; //default
                     //Create Beanstream Gateway
                     $beanstream = new \Beanstream\Gateway($merchant_id, $api_key, $platform, $api_version);
                     $transcations ="";
                     $transaction_check =$beanstream->reporting()->getTransaction($transaction_id);
                      foreach($transaction_check['adjusted_by'] as $t)
                     {
                         $transcations = $t ;
                     }
                     //dump($transaction_check) ;
                     //dd($transcations) ;
                     $check = $transaction_check['adjusted_by']?true:false ;
                     if($check && $transcations['approval']==2)
                     {
                         $input = getDate(strtotime($transaction_check['created']));
                         $date = $input['year'].'-'.$input['mon'].'-'.$input['mday'];
                         $paymentModel = new Payment();
                         $paymentModel->transaction_id = !empty($transcations['id']) ? $transcations['id'] : null;
                         $paymentModel->authorizing_merchant_id = !empty($transaction_check['authorizing_merchant_id']) ? $transaction_check['authorizing_merchant_id'] : null;
                         $paymentModel->message = !empty($transcations['message']) ? $transcations['message'] : "TEST";
                         $paymentModel->auth_code = !empty($transaction_check['auth_code']) ? $transaction_check['auth_code'] : null;
                         $paymentModel->order_number = !empty($transaction_check['order_number']) ? $transaction_check['order_number'] : null;
                         $paymentModel->type =  "PAC1";
                         $paymentModel->created = !empty($date) ? $date : null;
                         $paymentModel->amount = $amount;
                         $paymentModel->payment_method = !empty($transaction_check['payment_method']) ? $transaction_check['payment_method'] : null;
                         $paymentModel->is_approved = 0;

                         $paymentModel->is_security_deposit = true;
                         $paymentModel->reservation_id = $request->booking_id ;

                         $paymentModel->security_deposit_amount = $security_deposit;
                       //  $paymentModel->cashout_status = "Pending";
                         $paymentModel->payment_status = "Operation Failed";
                         $paymentModel->client_fee = 4.99;
                         $paymentModel->save();
                         return response()->json(['message' => $transcations['message']]);
                     }
                     else
                     {
                         //Get PA2 to return deposit

                         try {
                                 if($payment->is_approved)

                                     {
                                         $merchant_id = '383610961'; //INSERT MERCHANT ID (must be a 9 digit string)
                                         $api_key = '31b131a891aA409d96D7Fdae001bD5D6'; //INSERT API ACCESS PASSCODE
                                         $api_version = 'v1'; //default
                                         $platform = 'api'; //default

                                         //Create Beanstream Gateway
                                         $beanstream = new \Beanstream\Gateway($merchant_id, $api_key, $platform, $api_version);


                                         $result = $beanstream->payments()->complete($transaction_id,$security_deposit, $order_id);
                                         $paymentModel = new Payment();
                                         $paymentModel->transaction_id = !empty($result['id']) ? $result['id'] : null;
                                         $paymentModel->authorizing_merchant_id = !empty($result['authorizing_merchant_id']) ? $result['authorizing_merchant_id'] : null;
                                         $paymentModel->message = !empty($result['message']) ? $result['message'] : "TEST";
                                         $paymentModel->auth_code = !empty($result['auth_code']) ? $result['auth_code'] : null;
                                         $paymentModel->order_number = !empty($result['order_number']) ? $result['order_number'] : null;
                                         $paymentModel->type =  "PAC2";
                                         $paymentModel->created = !empty($result['created']) ? $result['created'] : null;
                                         $paymentModel->amount = $security_deposit;
                                         $paymentModel->payment_status = "Deposit Received";
                                         $paymentModel->payment_method = !empty($result['payment_method']) ? $result['payment_method'] : null;
                                         $paymentModel->is_approved = 1;
                                         $paymentModel->reservation_id = $request->booking_id ;
                                         $paymentModel->is_security_deposit = true;
                                         $paymentModel->security_deposit_amount = $security_deposit;
                                         $paymentModel->client_fee = 4.99;
                                         $paymentModel->save();

                                         //Get PAC2 to returned Deposit
                                         $payment = Payment::where('reservation_id',$request->booking_id)->where('type','PAC2')->first();
                                         $transaction_id = $payment->transaction_id ;
                                         $amount = $payment->amount ;
                                         $order_id = $payment->order_number ;
                                         $result = $beanstream->payments()->returnPayment($transaction_id,$security_deposit, $order_id);
                                         $paymentModel = new Payment();
                                         $paymentModel->transaction_id = !empty($result['id']) ? $result['id'] : null;
                                         $paymentModel->authorizing_merchant_id = !empty($result['authorizing_merchant_id']) ? $result['authorizing_merchant_id'] : null;
                                         $paymentModel->message = !empty($result['message']) ? $result['message'] : "TEST";
                                         $paymentModel->auth_code = !empty($result['auth_code']) ? $result['auth_code'] : null;
                                         $paymentModel->order_number = !empty($result['order_number']) ? $result['order_number'] : null;
                                         $paymentModel->type =  "VR2";
                                         $paymentModel->created = !empty($result['created']) ? $result['created'] : null;
                                         $paymentModel->amount = $security_deposit;
                                         $paymentModel->payment_status = "Deposit Returned";
                                         $paymentModel->payment_method = !empty($result['payment_method']) ? $result['payment_method'] : null;
                                         $paymentModel->is_approved = 1;
                                         $paymentModel->reservation_id = $request->booking_id ;
                                         $paymentModel->is_security_deposit = true;
                                         $paymentModel->security_deposit_amount = $security_deposit;
                                         $paymentModel->client_fee = 4.99;
                                         $paymentModel->save();


                                         $vehiucle_id = reservation_vehicules::where('reservation_id', $request->booking_id)->get('vehicule_id') ;
                                         $user_id = Vehicule::find($vehiucle_id)->first()->user_id ;
                                         $user = User::find($user_id) ;
                                         $previousBalance = $user->balance;
                                         $payment = Payment::where('reservation_id',$request->booking_id)->where('type','PA1')->first();
                                         $payment2 = Payment::where('reservation_id',$request->booking_id)->where('type','PAC1')->first();
                                         $amount = $payment->amount ;
                                         $newBalance = $previousBalance + ($payment->amount?$payment->amount:$payment2->amount);
                                         $user->update(['balance'=> $newBalance]);
                                         $booking->update(['booking_status' => "Done"]);

                                     }

                                 return response()->json(['message' => 'Amount Received and Deposit returned back' , 'result' => $result]);

                             } catch (\Beanstream\Exception $e) {

                                 $message = $e->getMessage();
                                 $code = $e->getCode();

                                 return (['message' => $message , 'code'=>$code ]);
                                 }



                     }



                 return response()->json(['message' => 'Booking status changed successfully' , 'booking' => $booking]);
                 }
          }
         catch (Exception $e) {
            return $e;
        }
    }

    public function SecurityDepositClientFee(Request $request)
    {

        try {

            $data = $request->all();

            if (!empty($data['security_deposit'])) {

                Payment::query()->update(['security_deposit_amount' => $data['security_deposit']]);

            }

            if (!empty($data['client_fee'])) {

                Payment::query()->update(['client_fee' => $data['client_fee']]);

            }

            return response()->json(['message' => 'Fields customized Successfully']);


        } catch (Exception $e) {
            return $e;
        }

    }
    public function getBookingsByUser($id)
    {
        $reservations=array() ;
        $vehicules = Vehicule::with(['reservations'])->where('user_id',$id)->get() ;
         foreach($vehicules as $rv)
        {

             foreach($rv->reservations as $reserv)
            {
                 $reservations[] =  ["id" => $reserv->id ,
                                    "amount" => $reserv->amount ,
                                    "period" => $reserv->period ,
                                    "customer_name" => User::find($reserv->customer_id)->firstname.' '.User::find($reserv->customer_id)->lastname ,
                                    "customer_photo" => User::find($reserv->customer_id)->photo ,
                                    "customer_number" => User::find($reserv->customer_id)->phone ,
                                    "customer_email" => User::find($reserv->customer_id)->email ,
                                    "booking_status" => $reserv->booking_status  ,
                                    "booking_title" => $reserv->booking_title  ,
                ] ;
            }

        }
     if($reservations)
       { return response()->json(['bookings' => $reservations]);}
     else
     {return response()->json(['bookings' => []]);}



    }

    public function getBookingsRequest($id)
    {
       // $bookings=reservation::where('host_id',$id)->with(['user','payment'])->get();
        $reservations=array() ;
        $vehicules = Vehicule::with(['reservations'])->where('user_id',$id)->get() ;
         foreach($vehicules as $rv)
        {

             foreach($rv->reservations as $reserv)
            {

                //$reservations[] = [Payment::where('reservation_id',$reserv->id)->get() , 'reserv'=>$reserv->booking_status] ;
                if($reserv->booking_status=="Pending")
               { $reservations[] =  ["id" => $reserv->id ,
                                    "amount" => $reserv->amount ,
                                    "period" => $reserv->period ,
                                    "customer_name" => User::find($reserv->customer_id)->firstname.' '.User::find($reserv->customer_id)->lastname ,
                                    "customer_photo" => User::find($reserv->customer_id)->photo ,
                                    "customer_number" => User::find($reserv->customer_id)->phone ,
                                    "customer_email" => User::find($reserv->customer_id)->email ,
                                    "booking_status" => $reserv->booking_status  ,
                                    "booking_title" => $reserv->booking_title  ,



                ] ;


             }



            }

        }
     if($reservations)
       { return response()->json(['bookings' => $reservations]);}
     else
     {return response()->json(['bookings' => []]);}


    }


    public function getApprovedBookings()
    {
        $reservations=array() ;

        $vehicules = Vehicule::with(['reservations'])->get() ;
         foreach($vehicules as $rv)
        {

             foreach($rv->reservations as $reserv)
            {

                //$reservations[] = [Payment::where('reservation_id',$reserv->id)->get() , 'reserv'=>$reserv->booking_status] ;
                if($reserv->booking_status=="Approved")
               { $reservations[] =  ["id" => $reserv->id ,
                                    "amount" => $reserv->amount ,
                                    "period" => $reserv->period ,
                                    "customer_name" => User::find($reserv->customer_id)->firstname.' '.User::find($reserv->customer_id)->lastname ,
                                    "customer_photo" => User::find($reserv->customer_id)->photo ,
                                    "customer_number" => User::find($reserv->customer_id)->phone ,
                                    "customer_email" => User::find($reserv->customer_id)->email ,
                                    "booking_status" => $reserv->booking_status  ,
                                    "booking_title" => $reserv->booking_title  ,
                                    "date" => $reserv->created_at  ,
                                    "host_name" =>     User::find($rv->user_id)->firstname.' '.User::find($rv->user_id)->lastname ,



                ] ;


             }



            }

        }
     if($reservations)
       { return response()->json(['bookings' => $reservations]);}
     else
     {return response()->json(['bookings' => []]);}


    }





    public function getHostApprovedBookings($id)
    {
        $reservations=array() ;

        $vehicules = Vehicule::with(['reservations'])->where('user_id',$id)->get() ;
         foreach($vehicules as $rv)
        {

             foreach($rv->reservations as $reserv)
            {

                //$reservations[] = [Payment::where('reservation_id',$reserv->id)->get() , 'reserv'=>$reserv->booking_status] ;
                if($reserv->booking_status=="Approved")
               { $reservations[] =  ["id" => $reserv->id ,
                                    "amount" => $reserv->amount ,
                                    "period" => $reserv->period ,
                                    "customer_name" => User::find($reserv->customer_id)->firstname.' '.User::find($reserv->customer_id)->lastname ,
                                    "customer_photo" => User::find($reserv->customer_id)->photo ,
                                    "customer_number" => User::find($reserv->customer_id)->phone ,
                                    "customer_email" => User::find($reserv->customer_id)->email ,
                                    "booking_status" => $reserv->booking_status  ,
                                    "booking_title" => $reserv->booking_title  ,
                                    "date" => $reserv->created_at  ,
                                    "host_name" =>     User::find($rv->user_id)->firstname.' '.User::find($rv->user_id)->lastname ,



                ] ;


             }



            }

        }
     if($reservations)
       { return response()->json(['bookings' => $reservations]);}
     else
     {return response()->json(['bookings' => []]);}


    }


}
