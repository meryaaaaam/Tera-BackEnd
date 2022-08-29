<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use App\Models\card;
use App\Models\Payment;
use App\Models\User;
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
        try {
            $bookings =  Booking::with(['user','payment'])->get();
            return response()->json(['bookings' => $bookings]);
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

    public function changeBookingStatus(Request $request)
    {
        try {
            $request->validate([
                'booking_id' => 'required',
                'action' => 'required',
                'transaction_id' =>'required',
            ]);

            $data = $request->all();

            $booking =  Booking::where('id',$data['booking_id'])->first();

            if ($data['action'] == 'Declined') {
                $transaction = Payment::where('user_id',$booking->user_id)->where('transaction_id',$data['transaction_id'])->first();


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

                $user = User::where('id',$booking->user_id)->first();

                if ($result['message'] == 'Transaction exceeds return limit.') {
                    return response()->json(['message' => 'Transaction exceeds return limit.']);
                }
                else {
                    $previousBalance = $user->balance;
                    $newBalance = $previousBalance + $result['amount'];
                    $user->update(['balance'=> $newBalance]);
                }

            }

            $booking->update(['booking_status' => $data['action']]);

            return response()->json(['message' => 'Booking status changed successfully' , 'booking' => $booking]);

        } catch (Exception $e) {
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
        $bookings=Booking::where('user_id',$id)->get();
        return response()->json(['bookings' => $bookings]);


    }

    public function getBookingsRequest($id)
    {
        $bookings=Booking::where('host_id',$id)->with(['user','payment'])->get();

        if($bookings)
       { return response()->json(['bookings' => $bookings]);}
       else
       { return response()->json(['bookings' => 'No bbokings Found']);}
    }
}
