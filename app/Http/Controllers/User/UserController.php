<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Address;
use App\Models\User;
use App\Models\UserRoles;
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
                       "date_nais" => $user->date_nais ,
                       "address_id" => $user->address_id ,
                       "address" => $address->address ,
                       "city" => $address->city ,
                       "code" => $address->code ,
                       "state" => $address->state ,

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
                "phone" => $user->phone ,
                "date_nais" => $user->date_nais ,
                "photo" => $user->photo ,
                "address" =>  "Null",
                "city" =>  "Null",
                "code" =>  "Null",
                "state" =>  "Null"


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
        'username' => 'max:100',
        'firstname' => 'max:100',
        'lastname' => 'max:100',
        'phone' => 'max:100',
        'city' => 'max:100',
        'address' => 'max:100',
        'state' => 'max:100',
        'code' => 'max:100',
        'email' => 'email',
        'photo' => '',
       // 'password' => 'required|min:8'
    ]);

   // $req = $request->all() ;
   if (request('photo')) {
    $imagePath = $request->photo->store('public/img/logo');
}
dd($imagePath);
   /* if ($request->hasFile('img'))
    {
        dd('in ') ;

      $filenameWithExt = $request->file('img')->getClientOriginalName();

          $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
          $extension = $request->file('img')->getClientOriginalExtension();
          $fileNameToStore= $filename.'_'.time().'.'.$extension;
          $path = $request->file('img')->storeAs('public/img/logo', $fileNameToStore);
          $user->photo= $fileNameToStore;
            $user->save() ;

          return response()->json(["message" => "photo updated successfully."]);
     }
     else
     {          return response()->json(["message" => "somthing went wrong ."]);
     }
*/


    if($user->address_id)
    {   $address = Address::find($user->address_id) ;
      //  dd($address);
        $user->update([
            //"username" => $request->username,
            "firtname" => $request->firstname,
            "lastname" => $request->lastname,
            "photo" => $imagePath ?? $user->photo,
            "date_nais" => $request->date_nais,
            "phone" => $request->phone,
            "email" => $request->email,
            "address_id" => $address->id,
           // "password" => bcrypt($request->password)
        ]);

        $address->update([
            "address" => $request->address,
            "city" => $request->city,
            "code" => $request->code,
            "state" => $request->state,

           // "password" => bcrypt($request->password)
        ]);


    }
    else {
       $address = Address::create([
            "address" => $request->address,
            "city" => $request->city,
            "code" => $request->code,
            "state" => $request->state,

           // "password" => bcrypt($request->password)
        ]) ;


        $user->update([
            "username" => $request->username,
            "firtname" => $request->firstname,
            "lastname" => $request->lastname,
            "photo" => $imagePath ?? $user->image,
            "date_nais" => $request->date_nais,
            "phone" => $request->phone,
            "email" => $request->email,
            "address_id" => $address->id,
           // "password" => bcrypt($request->password)
        ]);





    }
    // On modifie les informations de l'utilisateur
    /*if($user->save() && $user->refresh()){
        return response()->json(["message" => "user updated successfully."]);
     } else{
        return response()->json(["message" => "something went wrong"]);
     }*/

     $response = response()->json($user);

    // On retourne la réponse JSON
  //  return response()->json(["user" => $user , "address"=> $address]);
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
}
