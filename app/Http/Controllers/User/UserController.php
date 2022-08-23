<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Address;
use App\Models\Payment;
use App\Models\User;
use App\Models\Roles;
use App\Models\UserRoles;
use Exception;
use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::All() ;
        return response()->json($users);
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
        $user = User::find($id) ;
          //  dd($user->id) ;
        $roleu = UserRoles::where('user_id',$user->id)->first();
        //   dd($roleu->role_id);
        $role = Roles::find($roleu->role_id) ;


        if ($user)
       {

         $address = Address::find($user->address_id) ;
         if($address)
        { $response = [
                       "id" => $user->id ,
                       "firstname" => $user->firstname ,
                       "lastname" => $user->lastname ,
                       "username" => $user->username ,
                       "photo" => $user->photo ,
                       "email" => $user->email ,
                       "link" => $user->link ,
                       "phone" => $user->phone ,
                       "bio" => $user->bio ,
                       "date_nais" => $user->date_nais ,
                       "address_id" => $user->address_id ,
                       "address" => $address->address ,
                       "city" => $address->city ,
                       "code" => $address->code ,
                       "state" => $address->state ,
                       "role" => $role->role ,

         ]; return response()->json($response);}
         else
         {
            $response = [
                "id" => $user->id ,
                "firstname" => $user->firstname ,
                "lastname" => $user->lastname ,
                "username" => $user->username ,
                "email" => $user->email ,
                "link" => $user->link ,
                "bio" => $user->bio ,

                "phone" => $user->phone ,
                "date_nais" => $user->date_nais ,
                "photo" => $user->photo ,
                "address" =>  "Null",
                "city" =>  "Null",
                "code" =>  "Null",
                "state" =>  "Null",
                "role" => $role->role ,


  ];  return response()->json($response);
         }



        }
       else
       { return response()->json(['message' => 'user not found  ']);}
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
        $user = User::find($id) ;
         // La validation de données
   $this->validate($request, [
        //'username' => 'max:100',
        'firstname' => 'max:100',
        'lastname' => 'max:100',
        'phone' => 'max:100',
        'city' => 'max:100',
        'address' => 'max:100',
        'state' => 'max:100',
        'code' => 'max:100',
        'email' => 'email',
        //'photo' => 'required|image',
       // 'password' => 'required|min:8'
    ]);

    if($user->address_id)
    {   $address = Address::find($user->address_id) ;
        $address->update([
            "address" => $request->address,
            "city" => $request->city,
            "code" => $request->code,
            "state" => $request->state,
        ]);
    }
    else {
       $address = Address::create([
            "address" => $request->address,
            "city" => $request->city,
            "code" => $request->code,
            "state" => $request->state,
        ]) ;

    }
    $user->update([
        "username" => $request->username,
        "firtname" => $request->firstname,
        "lastname" => $request->lastname,
       // "photo" => $request->photo,
        "date_nais" => $request->date_nais,
        "phone" => $request->phone,
        "email" => $request->email,
        "bio" => $request->bio,
        "link" => $request->link,
        "address_id" => $address->id,
    ]);




    // On retourne la réponse JSON
   return response()->json(["user" => $user , "address"=> $address]);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::find($id) ;
        if($user->address_id)
       { $ad = Address::find($user->address_id) ; $ad->delete() ;}
       // $userroles = UserRoles::where('user_id' , $id) ;
       // $userroles->delete() ;
        // On supprime l'utilisateur
        $user->delete();

        // On retourne la réponse JSON
        return response()->json(['message' => 'User Deleted successfully']);
    }




    public function uploadPhoto(Request $request, $id )
    {

        $user = User::findOrFail($id) ;
        $user->update($request->all());
         if ($request->hasFile('img'))
          {

            $filenameWithExt = $request->file('img')->getClientOriginalName();

                $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
                $extension = $request->file('img')->getClientOriginalExtension();
                $fileNameToStore= $filename.'_'.time().'.'.$extension;
                $path = $request->file('img')->storeAs('public/image', $fileNameToStore);
                $user->photo= $fileNameToStore; $user->save() ;
                $user->update(["photo"=>   $fileNameToStore]);

         if($user->save() && $user->refresh()){
            return response()->json(["message" => "image added successfully."]);
         } else{
            return response()->json(["message" => "something went wrong"]);
         }

    }
}


    public function displayBalance(Request $request)
    {
        try {

            $request->validate([
                'user_id' => 'required'
            ]);

            $data = $request->all();
            //get the total balance data and the list of all the transactions
            $user = User::where('id', $data['user_id'])->with('transactions')->first();
            return response()->json(['client_data'=> $user]);

        } catch (Exception $e) {
            return $e;
        }
    }


    public function cashout(Request $request)
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


            $paymentModel = new Payment();
            $paymentModel->amount = !empty($data['amount']) ? $data['amount'] : null;
            $paymentModel->user_id = !empty($data['user_id']) ? $data['user_id'] : null;
            $paymentModel->is_security_deposit = false;
            $paymentModel->is_cash_out = true;
            $paymentModel->cashout_status = "Pending";
            $paymentModel->save();

            // $previousBalance = $user->balance;
            // $newBalance = $previousBalance - $data['amount'];
            // $user->update(['balance' => $newBalance ]);

            return response()->json(['message'=> 'You have requested a cashout of amount ' . $data['amount']]);

        } catch (Exception $e) {
            return $e;
        }
        //check the balance and request for a cashout.
    }


    public function listCashout(Request $request)
    {
        try {

            $request->validate([
                'user_id' => 'required',
            ]);

            $data = $request->all();
            $cashoutPayments =  Payment::with('user')->where('is_cash_out',true)->where('user_id',$data['user_id'])->get();
            return response()->json(['cashoutPayments' => $cashoutPayments]);
        } catch (Exception $e) {
            return $e;
        }
    }


    public function validateCashout(Request $request)
    {
        try {

            $request->validate([
                'user_id' => 'required',
                'cashout_id' => 'required'
            ]);

            $data = $request->all();

            $payment =  Payment::where('id',$data['cashout_id'])->first();

            $user = User::where('id', $data['user_id'])->first();

            $previousBalance = $user->balance;
            $newBalance = $previousBalance - $payment->amount;
            $user->update(['balance' => $newBalance ]);

            $payment->update(['cashout_status' => "Validated"]);

            return response()->json(['message'=> 'Cashout Approved Successfully']);

        } catch (Exception $e) {
            return $e;
        }
    }


}
