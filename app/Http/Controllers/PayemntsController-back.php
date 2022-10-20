<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use App\Models\card;
use App\Models\Dispute;
use App\Models\Payment;
use App\Models\reservation;
use App\Models\reservation_vehicules;
use App\Models\User;
use App\Models\Vehicule;
use Exception;
use Illuminate\Http\Request;

class PaymentController extends Controller
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

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {

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

    public function submitSecurityDeposit(Request $request)
    {

        $securityDepositAmount = 500;
        $data = $request->all();
        $amount = $data['amount'];

        if ($amount != $securityDepositAmount) {
            return response()->json(['message' => 'Security Amount must be equal to 500'],417);
        }

        $user = User::where('id',$data['user_id'])->first();

        if ($user->balance != 500) {
            return response()->json(['message' => 'You do not have enough balance']);
        }
        else {
            $previousBalance = $user->balance;
            $newBalance = $previousBalance - $amount;
            $user->update(['balance'=> $newBalance]);
        }


        // call Bambora API
            $merchant_id = '383610961'; //INSERT MERCHANT ID (must be a 9 digit string)
            $api_key = '31b131a891aA409d96D7Fdae001bD5D6'; //INSERT API ACCESS PASSCODE
            $api_version = 'v1'; //default
            $platform = 'api'; //default

            //Create Beanstream Gateway
            $beanstream = new \Beanstream\Gateway($merchant_id, $api_key, $platform, $api_version);

            //Example Card Payment Data
            $payment_data = array(
                    'order_number' => $data['order_number'],
                    'amount' => $data['amount'],
                    'payment_method' => $data['payment_method'],
                    'card' => array(
                        'name' => $data['card']['name'],
                        'number' => $data['card']['number'],
                        'expiry_month' => $data['card']['expiry_month'],
                        'expiry_year' => $data['card']['expiry_year'],
                        'cvd' => $data['card']['cvd']
                    )
            );
            $complete = FALSE; //set to FALSE for PA

            //Try to submit a Card Payment
            try {

                $result = $beanstream->payments()->makeCardPayment($payment_data, $complete);

                $paymentModel = new Payment();
                $paymentModel->transaction_id = !empty($result['id']) ? $result['id'] : null;
                $paymentModel->authorizing_merchant_id =!empty($result['authorizing_merchant_id']) ? $result['authorizing_merchant_id'] : null;
                $paymentModel->message =!empty($result['message']) ? $result['message'] : "TEST";
                $paymentModel->auth_code =!empty($result['auth_code']) ? $result['auth_code'] : null;
                $paymentModel->order_number =!empty($result['order_number']) ? $result['order_number'] : null;
                $paymentModel->type =!empty($result['type']) ? $result['type'] : null;
                $paymentModel->created =!empty($result['created']) ? $result['created'] : null;
                $paymentModel->amount =!empty($result['amount']) ? $result['amount'] : null;
                $paymentModel->payment_method =!empty($result['payment_method']) ? $result['payment_method'] : null;
                $paymentModel->user_id =!empty($data['user_id']) ? $data['user_id'] : null;
                $paymentModel->is_security_deposit = true;
                $paymentModel->save();

                return $result;


                /*
                * Handle successful transaction, payment method returns
                * transaction details as result, so $result contains that data
                * in the form of associative array.
                */
            } catch (\Beanstream\Exception $e) {

                return $e->code;

                /*
                * Handle transaction error, $e->code can be checked for a
                * specific error, e.g. 211 corresponds to transaction being
                * DECLINED, 314 - to missing or invalid payment information
                * etc.
                */
            }
    }

    public function bookPayment1(Request $request)
    {

        $client_fee = 4.99;

        $request->validate([
            'booking_cost' => 'required',
            'user_id' => 'required',
            'number_of_days' => 'required',
            'car_model' => 'required',
            'extras' => 'nullable',
            'host_id' => 'required',
        ]);

        $data = $request->all();

        $extras = !empty($data['extras']) ? $data['extras'] : null;

        if ($extras == null) {
            $purchase_amount = $data['booking_cost'] + ($client_fee * $data['number_of_days']);
        }
        else {
            $purchase_amount = $data['booking_cost'] + $extras + ($client_fee * $data['number_of_days']);
        }

            $merchant_id = '383610961'; //INSERT MERCHANT ID (must be a 9 digit string)
            $api_key = '31b131a891aA409d96D7Fdae001bD5D6'; //INSERT API ACCESS PASSCODE
            $api_version = 'v1'; //default
            $platform = 'api'; //default

            //Create Beanstream Gateway
            $beanstream = new \Beanstream\Gateway($merchant_id, $api_key, $platform, $api_version);

            //Example Card Payment Data
            $payment_data = array(
                    'order_number' => random_int(100000, 999999),
                    'amount' => $purchase_amount,
                    'payment_method' => 'card',
                    'card' => array(
                        'name' => 'Mr. Card Testerson',
                        'number' => '4030000010001234',
                        'expiry_month' => '02',
                        'expiry_year' => '22',
                        'cvd' => '123'
                    )
            );
            $complete = TRUE; //set to FALSE for PA

            try {

                $result = $beanstream->payments()->makeCardPayment($payment_data, $complete);

                $paymentModel = new Payment();
                $paymentModel->transaction_id = !empty($result['id']) ? $result['id'] : null;
                $paymentModel->authorizing_merchant_id = !empty($result['authorizing_merchant_id']) ? $result['authorizing_merchant_id'] : null;
                $paymentModel->message = !empty($result['message']) ? $result['message'] : "TEST";
                $paymentModel->auth_code = !empty($result['auth_code']) ? $result['auth_code'] : null;
                $paymentModel->order_number = !empty($result['order_number']) ? $result['order_number'] : null;
                $paymentModel->type =  !empty($result['type']) ? $result['type'] : null;
                $paymentModel->created = !empty($result['created']) ? $result['created'] : null;
                $paymentModel->amount = !empty($result['amount']) ? $result['amount'] : null;
                $paymentModel->payment_method = !empty($result['payment_method']) ? $result['payment_method'] : null;
                $paymentModel->user_id = !empty($data['user_id']) ? $data['user_id'] : null;
                $paymentModel->is_security_deposit = false;
               // $paymentModel->save();

                if ($result['message'] == 'Duplicate Transaction - This transaction has already been approved') {
                    return response()->json(['message' => 'Duplicate Transaction - This transaction has already been approved']);
                }

                $user = User::where('id',$data['user_id'])->first();

                // set the balance of the user here
                $previousBalance = $user->balance;
                $newBalance = $previousBalance - $result['amount'];
                $user->update(['balance'=> $newBalance]);


                //create Booking Record
                $booking = new Booking();
                $booking->customer_name = $user->firstname .  $user->lastname;
                $booking->user_id = $data['user_id'];
                $booking->payment_id = $paymentModel->id;
                $booking->customer_number =$user->phone;
                $booking->customer_email = $user->email;
                $booking->booking_title = $data['car_model'];
                $booking->booking_status = 'Pending';
                $booking->vehicule_id = $data['car_id'];
                $booking->host_id = $data['host_id'];
               // $booking->save();

                return $result;

                /*
                * Handle successful transaction, payment method returns
                * transaction details as result, so $result contains that data
                * in the form of associative array.
                */
            } catch (\Beanstream\Exception $e) {

                return $e;

                /*
                * Handle transaction error, $e->code can be checked for a
                * specific error, e.g. 211 corresponds to transaction being
                * DECLINED, 314 - to missing or invalid payment information
                * etc.
                */
            }
    }

    public function validatePaymentF(Request $request)
    {
        $request->validate([
            'user_id' => 'required',
            'transaction_id' => 'required',
            'amount' => 'required',
            'order_number'=> 'required'
        ]);

        $data = $request->all();

        $merchant_id = '383610961'; //INSERT MERCHANT ID (must be a 9 digit string)
        $api_key = '31b131a891aA409d96D7Fdae001bD5D6'; //INSERT API ACCESS PASSCODE
        $api_version = 'v1'; //default
        $platform = 'api'; //default

        //Create Beanstream Gateway
        $beanstream = new \Beanstream\Gateway($merchant_id, $api_key, $platform, $api_version);

        try {

            // get the transactionId from payments (local) table

            $result = $beanstream->payments()->complete($data['transaction_id'],$data['amount'], $data['order_number']);
            dd($result);

            if ($result['message'] == 'Completion greater than remaining reserve amount.') {
                return response()->json(['message' => 'Amount is greater than remaining reserved amount']);
            }

            $paymentModel = new Payment();
            $paymentModel->transaction_id = !empty($result['id']) ? $result['id'] : null;
            $paymentModel->authorizing_merchant_id = !empty($result['authorizing_merchant_id']) ? $result['authorizing_merchant_id'] : null;
            $paymentModel->message = !empty($result['message']) ? $result['message'] : "TEST";
            $paymentModel->auth_code = !empty($result['auth_code']) ? $result['auth_code'] : null;
            $paymentModel->order_number = !empty($result['order_number']) ? $result['order_number'] : null;
            $paymentModel->type =  !empty($result['type']) ? $result['type'] : null;
            $paymentModel->created = !empty($result['created']) ? $result['created'] : null;
            $paymentModel->amount = !empty($result['amount']) ? $result['amount'] : null;
            $paymentModel->payment_method = !empty($result['payment_method']) ? $result['payment_method'] : null;
            $paymentModel->user_id = !empty($data['user_id']) ? $data['user_id'] : null;
            $paymentModel->is_security_deposit = false;
            $paymentModel->save();


            return response()->json(['message' => 'Payment Validated Successfully' , 'result' => $result]);

        } catch (\Beanstream\Exception $e) {

            return $e;
        }

    }

    public function giveBackDeposit(Request $request)
    {

        $request->validate([
            'reservation_id' => 'required',
        ]);


        $payment = Payment::orderBy('created_at', 'desc')->first();
        $last_order_number = $payment?$payment->order_number+1:100000000;
        $last_trancation = $payment?$payment->transaction+1:100000000;
        //dd($last_transaction)
        $data = $request->all();
        $payment = Payment::where('reservation_id',$request->reservation_id)->where('type','PA2')->first();
        $transaction_id = $payment->transaction_id ;
        $amount = $payment->amount ;
        $order_id = $payment->order_number ;


        $data = $request->all();

        try {

            $transactions = Payment::where('user_id',$data['user_id'])->where('type','PA')->get();

            $total_pre_auth_amount = $transactions->sum('amount');

            foreach ($transactions as $key => $transaction) {
                $transactionId = $transaction->transaction_id;
                $amount = $transaction->amount;
                $orderNumber = $transaction->order_number;


                $merchant_id = '383610961'; //INSERT MERCHANT ID (must be a 9 digit string)
                $api_key = '31b131a891aA409d96D7Fdae001bD5D6'; //INSERT API ACCESS PASSCODE
                $api_version = 'v1'; //default
                $platform = 'api'; //default

                //Create Beanstream Gateway
                $beanstream = new \Beanstream\Gateway($merchant_id, $api_key, $platform, $api_version);

                $result = $beanstream->payments()->returnPayment($transactionId,$amount, $orderNumber);


                $paymentModel = new Payment();
                $paymentModel->transaction_id = !empty($result['id']) ? $result['id'] : null;
                $paymentModel->authorizing_merchant_id = !empty($result['authorizing_merchant_id']) ? $result['authorizing_merchant_id'] : null;
                $paymentModel->message = !empty($result['message']) ? $result['message'] : "TEST";
                $paymentModel->auth_code = !empty($result['auth_code']) ? $result['auth_code'] : null;
                $paymentModel->order_number = !empty($result['order_number']) ? $result['order_number'] : null;
                $paymentModel->type =  !empty($result['type']) ? $result['type'] : null;
                $paymentModel->created = !empty($result['created']) ? $result['created'] : null;
                $paymentModel->amount = !empty($result['amount']) ? $result['amount'] : null;
                $paymentModel->payment_method = !empty($result['payment_method']) ? $result['payment_method'] : null;
                $paymentModel->user_id = !empty($data['user_id']) ? $data['user_id'] : null;
                $paymentModel->is_security_deposit = false;
                $paymentModel->save();

        }


        $user = User::where('id',$data['user_id'])->first();
        $previousBalance = $user->balance;
        $newBalance = $previousBalance + $total_pre_auth_amount;
        $user->update(['balance'=> $newBalance]);

        return response()->json(['message' => 'Deposit returned back']);

        } catch (\Beanstream\Exception $e) {

            return $e;
        }

    }

    public function collectDeposit(Request $request)
    {
        $request->validate([
            'user_id' => 'required'
        ]);

        $data = $request->all();


        $transaction = Payment::where('user_id',$data['user_id'])->where('type','PA')->first();
       // dd($transaction) ;

        $merchant_id = '383610961'; //INSERT MERCHANT ID (must be a 9 digit string)
        $api_key = '31b131a891aA409d96D7Fdae001bD5D6'; //INSERT API ACCESS PASSCODE
        $api_version = 'v1'; //default
        $platform = 'api'; //default

        //Create Beanstream Gateway
        $beanstream = new \Beanstream\Gateway($merchant_id, $api_key, $platform, $api_version);

        try {

            $result = $beanstream->payments()->complete($transaction->transaction_id,$transaction->amount, $transaction->order_number);


            if ($result['message'] == 'Completion greater than remaining reserve amount.') {
                return response()->json(['message' => 'Failed: Amount is greater than remaining reserved amount']);
            }

            $paymentModel = new Payment();
            $paymentModel->transaction_id = !empty($result['id']) ? $result['id'] : null;
            $paymentModel->authorizing_merchant_id = !empty($result['authorizing_merchant_id']) ? $result['authorizing_merchant_id'] : null;
            $paymentModel->message = !empty($result['message']) ? $result['message'] : "TEST";
            $paymentModel->auth_code = !empty($result['auth_code']) ? $result['auth_code'] : null;
            $paymentModel->order_number = !empty($result['order_number']) ? $result['order_number'] : null;
            $paymentModel->type =  !empty($result['type']) ? $result['type'] : null;
            $paymentModel->created = !empty($result['created']) ? $result['created'] : null;
            $paymentModel->amount = !empty($result['amount']) ? $result['amount'] : null;
            $paymentModel->payment_method = !empty($result['payment_method']) ? $result['payment_method'] : null;
            $paymentModel->user_id = !empty($data['user_id']) ? $data['user_id'] : null;
            $paymentModel->is_security_deposit = false;
            $paymentModel->save();


            return response()->json(['message' => 'Deposit Collected Successfully']);


            return $result;

        } catch (\Beanstream\Exception $e) {

            return $e;
        }
    }

    public function bookPayment(Request $request)
    {

        $client_fee = 4.99;
        $request->validate([
            'extras' => 'nullable',
            'reservation_id'=>'required'
        ]);

        $booking_info = reservation::find($request->reservation_id);
        $booking_cost = $booking_info->amount ;
        $number_of_days = $booking_info->days!=0?$booking_info->days:$booking_info->hours ;
        $car_model = $booking_info->booking_title ;
        $vehiucle_id = reservation_vehicules::where('reservation_id', $request->reservation_id)->get('vehicule_id') ;
        $user_id = Vehicule::find($vehiucle_id)->first()->user_id ;
        $payment = Payment::orderBy('created_at', 'desc')->first();
        $order_number = $payment?$payment->order_number+1:10000240;

        $data = $request->all();

        $extras = !empty($data['extras']) ? $data['extras'] : null;

        if ($extras == null) {
            $purchase_amount =  $booking_cost + ($client_fee * $number_of_days);
        }
        else {
            $purchase_amount =  $booking_cost + $extras + ($client_fee * $number_of_days);
        }

        $merchant_id = '383610961'; //INSERT MERCHANT ID (must be a 9 digit string)
        $api_key = '31b131a891aA409d96D7Fdae001bD5D6'; //INSERT API ACCESS PASSCODE
        $api_version = 'v1'; //default
        $platform = 'api'; //default

        //Create Beanstream Gateway
        $beanstream = new \Beanstream\Gateway($merchant_id, $api_key, $platform, $api_version);

        dd($beanstream) ;
        //Example Card Payment Data
        $payment_data = array(
                                'order_number' => 10000320,
                                'amount' => $purchase_amount,
                                'payment_method' => 'card',
                                'card' => array(
                                    'name' => 'Mr. Card Testerson',
                                    'number' => '4030000010001234',
                                    'expiry_month' => '02',
                                    'expiry_year' => '22',
                                    'cvd' => '123',   )
                            );

            $complete = FALSE; //set to FALSE for PA

            try {
                    //make a credit card payment
                    $result = $beanstream->payments()->makeCardPayment($payment_data, $complete);
                    dd($result);

                                 //store Payment
                   // if($result)
                   //{
                    $transaction_id = $result['id'];

                        $paymentModel = new Payment();
                        $paymentModel->transaction_id = !empty($result['id']) ? $result['id'] : null;
                        $paymentModel->authorizing_merchant_id = !empty($result['authorizing_merchant_id']) ? $result['authorizing_merchant_id'] : null;
                        $paymentModel->message = !empty($result['message']) ? $result['message'] : "TEST";
                        $paymentModel->auth_code = !empty($result['auth_code']) ? $result['auth_code'] : null;
                        $paymentModel->order_number = $order_number+1;
                        $paymentModel->reservation_id = $request->reservation_id;
                        $paymentModel->type =  "PA1";
                        $paymentModel->created = !empty($result['created']) ? $result['created'] : null;
                        $paymentModel->amount = $purchase_amount ;
                        $paymentModel->is_security_deposit = 0 ;
                        $paymentModel->is_approved = $result['approved'] ;
                        $paymentModel->payment_method = !empty($result['payment_method']) ? $result['payment_method'] : null;
                        $paymentModel->client_fee = $client_fee;
                        $paymentModel->is_security_deposit = false;
                        $paymentModel->save();

                        if ($result['message'] == 'Duplicate Transaction - This transaction has already been approved') {
                            return response()->json(['message' => 'Duplicate Transaction - This transaction has already been approved']);
                        }
                        else if ($result['message']=="Declined"|| $result['message']=="declined" || $result['approved']==0 )
                        {
                            return response()->json(['message' => 'Transaction refused by the bank']);

                        }
                        else
                        {
                            // set the balance of the user here
                            $user = User::find($user_id);
                            $previousBalance = $user->balance;
                            $newBalance = $previousBalance + $result['amount'];
                            $user->update(['balance'=> $newBalance]);

                            $booking_info->update(['amount'=>$purchase_amount]);

                        }



                        if ($paymentModel->is_approved)
                        {
                            $vehiucle_id = reservation_vehicules::where('reservation_id', $request->reservation_id)->get('vehicule_id') ;
                            $bail = Vehicule::find($vehiucle_id)->first()->bail ;
                                //Example Card Payment Data
                            $payment_data_PA2 = array(
                                'order_number' => $paymentModel->order_number+1,
                                'amount' => $bail,
                                'payment_method' => 'card',
                                'card' => array(
                                    'name' => 'Mr. Card Testerson',
                                    'number' => '4030000010001234',
                                    'expiry_month' => '02',
                                    'expiry_year' => '22',
                                    'cvd' => '123',     )
                                );
                                $complete = FALSE;




                                    //make a credit card payment
                                    $result = $beanstream->payments()->makeCardPayment($payment_data_PA2, $complete);
                                    $transaction_id = $result['id'];

                                    //store Payment
                                    if($transaction_id)
                                   {

                                        $paymentModel = new Payment();
                                        $paymentModel->transaction_id = $transaction_id;
                                        $paymentModel->authorizing_merchant_id = !empty($result['authorizing_merchant_id']) ? $result['authorizing_merchant_id'] : null;
                                        $paymentModel->message        = !empty($result['message']) ? $result['message'] : "TEST";
                                        $paymentModel->auth_code      = !empty($result['auth_code']) ? $result['auth_code'] : null;
                                        $paymentModel->order_number   = $paymentModel->order_number+1;
                                        $paymentModel->reservation_id = $request->reservation_id;
                                        $paymentModel->type =  "PA2";
                                        $paymentModel->created = !empty($result['created']) ? $result['created'] : null;
                                        $paymentModel->amount = $purchase_amount ;
                                        $paymentModel->is_security_deposit = 1 ;
                                        $paymentModel->is_approved = $result['approved'] ;
                                        $paymentModel->security_deposit_amount = $bail ;
                                        $paymentModel->client_fee = $client_fee ;
                                        $paymentModel->cashout_status = 'Pending' ;
                                        $paymentModel->payment_method = !empty($result['payment_method']) ? $result['payment_method'] : null;
                                        //$paymentModel->user_id = !empty($data['user_id']) ? $data['user_id'] : null;
                                       // $paymentModel->is_security_deposit = false;
                                        $paymentModel->save();

                                        if ($result['message'] == 'Duplicate Transaction - This transaction has already been approved') {
                                            return response()->json(['message' => 'Duplicate Transaction - This transaction has already been approved']);
                                        }
                                        else if ($result['message']=="Declined"|| $result['message']=="declined" || $result['approved']==0)
                                        {
                                            return response()->json(['message' => 'Transaction refused by the bank']);

                                        }

                                    }

                                    return $result;

                                }
                }
                catch (\Beanstream\Exception $e) {
                    $message = $e->getMessage();
                    $code = $e->getCode();

                     return (['message' => $message , 'code'=>$code ]);


                }










 }
















 public function makePreAuthorizePA1(Request $request)
 {
     $client_fee = 4.99;
     $request->validate([
         'extras' => 'nullable',
         'reservation_id'=>'required'
     ]);

     $booking_info = reservation::find($request->reservation_id);
     $booking_cost = $booking_info->amount ;
     $number_of_days = $booking_info->days!=0?$booking_info->days:$booking_info->hours ;
     $car_model = $booking_info->booking_title ;
     $vehiucle_id = reservation_vehicules::where('reservation_id', $request->reservation_id)->get('vehicule_id') ;
     $user_id = Vehicule::find($vehiucle_id)->first()->user_id ;
     $payment = Payment::orderBy('created_at', 'desc')->first();
     $order_number = $payment?$payment->order_number+1:100000000;
    // dd($order_number);

     $data = $request->all();

     $extras = !empty($data['extras']) ? $data['extras'] : null;

     if ($extras == null) {
         $purchase_amount =  $booking_cost + ($client_fee * $number_of_days);
     }
     else {
         $purchase_amount =  $booking_cost + $extras + ($client_fee * $number_of_days);
     }

     $merchant_id = '383610961'; //INSERT MERCHANT ID (must be a 9 digit string)
     $api_key = '31b131a891aA409d96D7Fdae001bD5D6'; //INSERT API ACCESS PASSCODE
     $api_version = 'v1'; //default
     $platform = 'api'; //default

     //Create Beanstream Gateway
     $beanstream = new \Beanstream\Gateway($merchant_id, $api_key, $platform, $api_version);

     //Example Card Payment Data
     $payment_data = array(
         'order_number' => $order_number,
         'amount' => $purchase_amount,
         'payment_method' => 'card',
         'card' => array(
             'name' => 'Mr. Card Testerson',
             'number' => '4030000010001234',
             'expiry_month' => '02',
             'expiry_year' => '22',
             'cvd' => '123',
             //'complete' => false
         )
         );
         //dd($payment_data);
         $complete = FALSE; //set to FALSE for PA

         try {
                 //make a credit card payment
                 $result = $beanstream->payments()->makeCardPayment($payment_data, $complete);
                 $transaction_id = $result['id'];

                 //store Payment
                 if($transaction_id)
                {

                     $paymentModel = new Payment();
                     $paymentModel->transaction_id = $transaction_id;
                     $paymentModel->authorizing_merchant_id = !empty($result['authorizing_merchant_id']) ? $result['authorizing_merchant_id'] : null;
                     $paymentModel->message = !empty($result['message']) ? $result['message'] : "TEST";
                     $paymentModel->auth_code = !empty($result['auth_code']) ? $result['auth_code'] : null;
                     $paymentModel->order_number = $order_number;
                     $paymentModel->reservation_id = $request->reservation_id;
                     $paymentModel->type =  "PA1";
                     $paymentModel->created = !empty($result['created']) ? $result['created'] : null;
                     $paymentModel->amount = $purchase_amount ;
                     $paymentModel->is_security_deposit = 0 ;
                     $paymentModel->is_approved = $result['approved'] ;
                     $paymentModel->payment_method = !empty($result['payment_method']) ? $result['payment_method'] : null;
                     $paymentModel->client_fee = $client_fee;
                     $paymentModel->is_security_deposit = false;
                     $paymentModel->save();

                     if ($result['message'] == 'Duplicate Transaction - This transaction has already been approved') {
                         return response()->json(['message' => 'Duplicate Transaction - This transaction has already been approved']);
                     }
                     else if ($result['message']=="Declined"|| $result['message']=="declined")
                     {
                         return response()->json(['message' => 'Transaction refused by the bank']);

                     }
                     else
                     {
                         // set the balance of the user here
                         $user = User::find($user_id);
                         $previousBalance = $user->balance;
                         $newBalance = $previousBalance + $result['amount'];
                         $user->update(['balance'=> $newBalance]);
                     }



                 }

                 return $result;

             }
             catch (\Beanstream\Exception $e) {

             return $e;

             /*
             * Handle transaction error, $e->code can be checked for a
             * specific error, e.g. 211 corresponds to transaction being
             * DECLINED, 314 - to missing or invalid payment information
             * etc.
             */
         }



 }


 public function makePreAuthorizePA2(Request $request)
 {
     $client_fee = 4.99;

     $request->validate([
         'reservation_id'=>'required',
        // 'order_number'=>'required'
     ]);

     $booking_info = reservation::find($request->reservation_id);
     $booking_cost = $booking_info->amount ;
     $number_of_days = $booking_info->days!=0?$booking_info->days:$booking_info->hours ;
     $car_model = $booking_info->booking_title ;

     $vehiucle_id = reservation_vehicules::where('reservation_id', $request->reservation_id)->get('vehicule_id') ;
     $bail = Vehicule::find($vehiucle_id)->first()->bail ;
     $payment = Payment::orderBy('created_at', 'desc')->first();
     $order_number = $payment?$payment->order_number+1:100000000;
     $purchase_amount = Payment::where('reservation_id',$request->reservation_id)->first()->amount ;
     $is_PA1_approved = Payment::where() ;

     $data = $request->all();
     $merchant_id = '383610961'; //INSERT MERCHANT ID (must be a 9 digit string)
     $api_key = '31b131a891aA409d96D7Fdae001bD5D6'; //INSERT API ACCESS PASSCODE
     $api_version = 'v1'; //default
     $platform = 'api'; //default

     //Create Beanstream Gateway
     $beanstream = new \Beanstream\Gateway($merchant_id, $api_key, $platform, $api_version);

     //Example Card Payment Data
     $payment_data = array(
         'order_number' => $order_number,
         'amount' => $bail,
         'payment_method' => 'card',
         'card' => array(
             'name' => 'Mr. Card Testerson',
             'number' => '4030000010001234',
             'expiry_month' => '02',
             'expiry_year' => '22',
             'cvd' => '123',     )
         );

         $complete = FALSE; //set to FALSE for PA

         try {


                 //make a credit card payment
                 $result = $beanstream->payments()->makeCardPayment($payment_data, $complete);
                 $transaction_id = $result['id'];

                 //store Payment
                 if($transaction_id)
                {

                     $paymentModel = new Payment();
                     $paymentModel->transaction_id = $transaction_id;
                     $paymentModel->authorizing_merchant_id = !empty($result['authorizing_merchant_id']) ? $result['authorizing_merchant_id'] : null;
                     $paymentModel->message        = !empty($result['message']) ? $result['message'] : "TEST";
                     $paymentModel->auth_code      = !empty($result['auth_code']) ? $result['auth_code'] : null;
                     $paymentModel->order_number   = $order_number;
                     $paymentModel->reservation_id = $request->reservation_id;
                     $paymentModel->type =  "PA2";
                     $paymentModel->created = !empty($result['created']) ? $result['created'] : null;
                     $paymentModel->amount = $purchase_amount ;
                     $paymentModel->is_security_deposit = 1 ;
                     $paymentModel->security_deposit_amount = $bail ;
                     $paymentModel->client_fee = $client_fee ;
                     $paymentModel->payment_method = !empty($result['payment_method']) ? $result['payment_method'] : null;
                     //$paymentModel->user_id = !empty($data['user_id']) ? $data['user_id'] : null;
                    // $paymentModel->is_security_deposit = false;
                     $paymentModel->save();

                     if ($result['message'] == 'Duplicate Transaction - This transaction has already been approved') {
                         return response()->json(['message' => 'Duplicate Transaction - This transaction has already been approved']);
                     }
                     else if ($result['message']=="Declined"|| $result['message']=="declined")
                     {
                         return response()->json(['message' => 'Transaction refused by the bank']);

                     }


                     // set the balance of the user here
                   /*  $user = User::find($user_id);
                     $previousBalance = $user->balance;
                     $newBalance = $previousBalance + $result['amount'];
                     $user->update(['balance'=> $newBalance]);*/
                 }

                 return $result;

             }
             catch (\Beanstream\Exception $e) { return $e;  }

 }









}
