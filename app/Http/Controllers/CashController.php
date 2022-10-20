<?php

namespace App\Http\Controllers;

use App\Models\cash;
use App\Models\fee;
use App\Models\Payment;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;

class CashController extends Controller
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
        try {

            $request->validate([
                'user_id' => 'required',
                'amount' => 'required'
            ]);


            $data = $request->all();
            $user = User::where('id', $data['user_id'])->first();

            if ($data['amount'] > $user->balance) {
                return response()->json(['message' => 'You do not have enough balance'],417);
            }


            else
            {$Cash = new cash();
            $Cash->amount = !empty($data['amount']) ? $data['amount'] : null;
            $Cash->user_id = !empty($data['user_id']) ? $data['user_id'] : null;
            $Cash->is_cash_out = false;
            $Cash->cashout_status = "Pending";
            $Cash->save();

              /*$previousBalance = $user->balance;
              $newBalance = $previousBalance - $data['amount'];
              $user->update(['balance' => $newBalance ]);*/
            }
            return response()->json(['message'=> 'You have requested a cashout of amount ' . $data['amount']]);

        } catch (Exception $e) {
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



    public function AskForCashout(Request $request)
    {
        try {

            $request->validate([
                'user_id' => 'required',
                'amount' => 'required'
            ]);


            $data = $request->all();
            $user = User::where('id', $data['user_id'])->first();

            if ($data['amount'] > $user->balance) {
                return response()->json(['message' => 'You do not have enough balance'],417);
            }


            else
            {$Cash = new cash();
            $Cash->amount = !empty($data['amount']) ? $data['amount'] : null;
            $Cash->user_id = !empty($data['user_id']) ? $data['user_id'] : null;
            $Cash->is_cash_out = false;
            $Cash->cashout_status = "Pending";
            $Cash->save();

              /*$previousBalance = $user->balance;
              $newBalance = $previousBalance - $data['amount'];
              $user->update(['balance' => $newBalance ]);*/
            }
            return response()->json(['message'=> 'You have requested a cashout of amount ' . $data['amount']  .'$']);

        } catch (Exception $e) {
            return $e;
        }
    }

    public function validateCashout(Request $request)
    {


            $request->validate([
                'user_id' => 'required',
                'cashout_id' => 'required'
            ]);

            $cashout = cash::find($request->cashout_id) ;
            $user = User::find($request->user_id) ;
            $payment = Payment::orderBy('created_at', 'desc')->first();
            $last_transaction_id =  $payment->transaction_id ;
            $host_fee = fee::where('label','host_fee')->first()->value ;
            $host_fee_amount = $cashout->amount * ($host_fee/100) ;
            $amount = $cashout->amount -  $host_fee_amount ;
            $merchant_id = '383610961'; //INSERT MERCHANT ID (must be a 9 digit string)
            $api_key = '31b131a891aA409d96D7Fdae001bD5D6'; //INSERT API ACCESS PASSCODE
            $api_version = 'v1'; //default
            $platform = 'api'; //default

            //Create Beanstream Gateway
            $beanstream = new \Beanstream\Gateway($merchant_id, $api_key, $platform, $api_version);

            //get_Last transaction
            try {

                $transaction_check =$beanstream->reporting()->getTransaction($last_transaction_id);
            } catch (\Beanstream\Exception $e) {
            return($e->getMessage()) ;
            }

             //Example Card Payment Data
           $payment_data = array(
                                'order_number' => $transaction_check['id']-10,
                                'amount' => $amount,
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

                $result = $beanstream->payments()->makeCardPayment($payment_data, $complete);
                $paymentModel = new Payment();
                $paymentModel->transaction_id = !empty($result['id']) ? $result['id'] : null;
                $paymentModel->authorizing_merchant_id = !empty($result['authorizing_merchant_id']) ? $result['authorizing_merchant_id'] : null;
                $paymentModel->message = !empty($result['message']) ? $result['message'] : "TEST";
                $paymentModel->auth_code = !empty($result['auth_code']) ? $result['auth_code'] : null;
                $paymentModel->order_number = !empty($result['order_number']) ?  $result['order_number']   : $transaction_check['id']-10;
                $paymentModel->cash_id = $request->cashout_id;
                $paymentModel->type =  "PA1";
                $paymentModel->created = !empty($result['created']) ? $result['created'] : null;
                $paymentModel->amount = $amount ;
                $paymentModel->host_fee = $host_fee_amount  ;
                $paymentModel->is_approved = $result['approved'] ;
                $paymentModel->payment_method = !empty($result['payment_method']) ? $result['payment_method'] : null;

                $paymentModel->cashout_status = 'Validated' ;
                $paymentModel->is_cash_out = true;


                $paymentModel->save();

                try {
                    $transaction_check =$beanstream->reporting()->getTransaction($result['id']);
                   // dd($transaction_check) ;
                    foreach($transaction_check['adjusted_by'] as $t)
                    {
                        $transcations = $t ;
                    }
                    //dump($transaction_check) ;
                    //dd($transcations) ;
                    $check = $transaction_check['adjusted_by']?true:false ;
                    if($check && $transcations['approval']==2)
                    {

                        $paymentModel = new Payment();
                        $paymentModel->transaction_id = !empty($transcations['id']) ? $transcations['id'] : null;
                        $paymentModel->authorizing_merchant_id = !empty($transaction_check['authorizing_merchant_id']) ? $transaction_check['authorizing_merchant_id'] : null;
                        $paymentModel->message = !empty($transcations['message']) ? $transcations['message'] : "TEST";
                        $paymentModel->auth_code = !empty($transaction_check['auth_code']) ? $transaction_check['auth_code'] : null;
                        $paymentModel->order_number = !empty($transaction_check['order_number']) ? $transaction_check['order_number'] : null;
                        $paymentModel->type =  "PAC1";
                        $paymentModel->created = !empty($date) ? $date : null;

                        $paymentModel->amount = $amount ;
                        $paymentModel->host_fee = $host_fee_amount  ;
                        $paymentModel->payment_method = !empty($transaction_check['payment_method']) ? $transaction_check['payment_method'] : null;
                        $paymentModel->is_approved = 0;
                        $paymentModel->cash_id = $request->cashout_id;
                        $paymentModel->is_cash_out = false;
                        $paymentModel->cashout_status = "Operation Failed";
                        //$paymentModel->payment_status = "Operation Failed";

                        $paymentModel->save();
                        return response()->json(['message' => $transcations['message']]);
                    }
                    // get the transactionId from payments (local) table
                   else {
                    $transaction_id = $result['id'] ;
                    $order_number = $result['order_number'] ;
                    $result = $beanstream->payments()->complete($transaction_id,$amount ,  $order_number);

                    $paymentModel = new Payment();
                    $paymentModel->transaction_id = !empty($result['id']) ? $result['id'] : null;
                    $paymentModel->authorizing_merchant_id = !empty($result['authorizing_merchant_id']) ? $result['authorizing_merchant_id'] : null;
                    $paymentModel->message = !empty($result['message']) ? $result['message'] : "TEST";
                    $paymentModel->auth_code = !empty($result['auth_code']) ? $result['auth_code'] : null;
                    $paymentModel->order_number = $result['order_number'];
                    $paymentModel->type =  "PAC1";
                    $paymentModel->created = !empty($result['created']) ? $result['created'] : null;
                    $paymentModel->amount = $amount ;
                    $paymentModel->host_fee = $host_fee_amount  ;
                    $paymentModel->payment_method = !empty($result['payment_method']) ? $result['payment_method'] : null;
                    $paymentModel->cash_id = $request->cashout_id;
                    $paymentModel->is_approved = $result['approved'];
                    $paymentModel->is_cash_out = true;
                    $paymentModel->cashout_status = 'Validated' ;
                    //$paymentModel->payment_status = "Amount Received";
                    $paymentModel->save();


                    $previousBalance = $user->balance;
                    $newBalance = $previousBalance - $cashout->amount;
                    $user->update(['balance' => $newBalance ]);
                    $cashout->update(['cashout_status' => "Validated"]);
                    $cashout->update(['is_cash_out' => true]);

                    return response()->json(['message'=> 'Cashout Approved Successfully']);}


                } catch (\Beanstream\Exception $e) {

                    return $e;
                }


            } catch (\Beanstream\Exception $e) {
            return($e->getMessage()) ;
            }



    }


    public function listCashoutDemands(Request $request)
    {
        try {

            $cashoutPayments =  cash::with('user')->where('is_cash_out',false)->where('cashout_status','Pending')->get();
            return response()->json(['cashoutPayments' => $cashoutPayments]);
        } catch (Exception $e) {
            return $e;
        }
    }

    public function listCashout(Request $request)
    {
        $request->validate([
            'user_id' => 'required',
        ]);
         $payment =array() ;
        $cahes = Cash::where('user_id',$request->user_id)->where('cashout_status','Validated')->get() ;

        foreach( $cahes as $cashout)
        {
            $payment[]  = Payment::where('cash_id' , $cashout->id)->where('type','PAC1')->where('is_cash_out',true)->first() ;

        }
        return response()->json(['cashoutPayments' => $payment ]);

    }
}
