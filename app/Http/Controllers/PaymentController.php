<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use App\Models\card;
use App\Models\Dispute;
use App\Models\Payment;
use App\Models\User;
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

    public function bookPayment(Request $request)
    {

        $client_fee = 4.99;

        $request->validate([
            'booking_cost' => 'required',
            'user_id' => 'required',
            'number_of_days' => 'required',
            'car_model' => 'required',
            'extras' => 'nullable',
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
                $paymentModel->save();

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
                $booking->save();

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

    public function validatePayment(Request $request)
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
            'user_id' => 'required',
        ]);

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

}
