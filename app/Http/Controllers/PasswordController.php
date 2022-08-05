<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class PasswordController extends Controller
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
        
        if ( auth()->user() )
        {
            $current = Hash::check($request->password_current, auth()->user()->password);
           // dd($current) ; die() ;
 
            if($current)
            {
 
                $request->validate([
                    'password_current' => ['required',  new MatchOldPassword],
                    'new_password' => ['required'],
                    'new_confirm_password' => ['same:new_password'],
                ]);
 
                User::find(auth()->user()->id)->update(['password'=> Hash::make($request->new_password)]);
            }
            else
            { return response()->json(['message' => 'Check your password' ]);}
 
 
 
 
            return response()->json( ['message' => 'Password change successfully' ,'data' => auth()->user() ]);
 
        }
        else
        { return response()->json(['message' => 'Authontification required' , 404]) ;  }
 
 
 
 

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
}
