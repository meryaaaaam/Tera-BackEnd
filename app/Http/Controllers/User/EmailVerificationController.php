<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Auth\Events\Verified;
use Illuminate\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\EmailVerificationRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class EmailVerificationController extends Controller
{
use MustVerifyEmail ;

    public function sendVerificationEmail(Request $request)
    {

        $header = $request->header('Authorization');
        $mail = $request->email ;

        $user = User::where('email',$mail)->first();
        //$user = User::find($user->id);
       // return [$user];
       /* $user_id = auth()->user()->id ;
        echo($user_id);
        $user = User::find($user_id);
       //  dd($request->user());*/
        if ($user->hasVerifiedEmail()) {
            return [
                'message' => 'Already Verified' , 'status' => 1
            ];
        }

        $user->sendEmailVerificationNotification();

        return ['message' => 'verification link sent!' , 'status' => 0];
    }

    public function verify(EmailVerificationRequest $request)
    {
       // dd($request) ;

        $user = User::find($request->id);


       // dd($user);
        if ($user->hasVerifiedEmail()) {
            return [
                'message' => 'Email already verified' , 'status' => 1
            ];
        }

        if ($request->route('id') != $user->getKey()) {
            throw new AuthorizationException();
        }

        if ($user->markEmailAsVerified()) {
            event(new Verified($user));
        }

        //retourner template
        return [
            'message'=>'Email has been verified' , 'status' => 1
        ];
    }
}
