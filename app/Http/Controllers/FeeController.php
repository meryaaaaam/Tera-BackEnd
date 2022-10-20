<?php

namespace App\Http\Controllers;

use App\Models\fee;
use App\Models\User;
use Illuminate\Http\Request;

class FeeController extends Controller
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
        $request->validate([
            'client_fee' => 'required',
            'host_fee' => 'required',

        ]);

        $user = User::with(['roles'])->find($id) ;
        if($user->roles[0]->role=="Admin")
           {
            $client_fee = fee::where('label','client_fee')->first() ;
            $host_fee = fee::where('label','host_fee')->first() ;

            $client_fee->update(["value" => $request->client_fee  ]);
            $host_fee->update(["value" => $request->host_fee  ]);

            return response()->json(['message' => [ $client_fee,$host_fee]]);
        }
        else {return response()->json(['message' =>  'Not Allowed']);}
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
}
