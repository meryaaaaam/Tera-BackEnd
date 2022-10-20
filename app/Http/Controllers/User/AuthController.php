<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Roles;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;


use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Models\UserRoles;

class AuthController extends Controller
{
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct() {
        $this->middleware('auth:api', ['except' => ['login', 'register']]);
    }
    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request){
    	$validator = Validator::make($request->all(), [
            'email' => 'required|email' ,
            'password' => 'required|string|min:6',
        ]);
        if ($validator->fails()) {
           // $messages = $validator->messages();
            return response()->json($validator->errors()->getMessages(), 422);
        }
        if (! $token = auth()->attempt($validator->validated())) {
            $email = User::Where('email', $request->email )->first() ;

            if(! $email){
                return response()->json(['message' => 'Vérifier votre email'], 401);
            }
           else{return response()->json(['message' => 'Vérifier votre password'], 401);}
        }
        return $this->createNewToken($token);
    }
    /**
     * Register a User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function register(Request $request) {
        $validator = Validator::make($request->all(), [
            'username' => 'required|string|between:2,100',
            'firstname' => 'required|string|between:2,100',
            'lastname' => 'required|string|between:2,100',
            'phone' => 'required|min:7|max:15|string',
            'date_nais' => 'date',
            'email' => 'required|string|email|max:100|unique:users',
            'password' => 'required|string|confirmed|min:6',
         ]);
        if($validator->fails()){
            return response()->json($validator->errors()->toJson(), 400);
        }
        $role = 'user' ;
       // dd($role) ;
        $roles = Roles::where('role' , $role)->first() ;


        if($roles)
        {$user = User::create(array_merge(
            $validator->validated(),
            ['password' => bcrypt($request->password)]
        ));
        $userroles = UserRoles::create (['role_id' => $roles->id , 'user_id' => $user->id]) ;

        return response()->json([
            'message' => 'User successfully registered !',
            'user' => $user ,
            'user role' => $userroles ,
        ], 201);
       }

       else
       {return response()->json([
        'message' => 'Roles issuie',

    ]);}

    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout() {
        auth()->logout();
        return response()->json(['message' => 'User successfully signed out']);
    }
    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh() {
        return $this->createNewToken(auth()->refresh());


    }
    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function userProfile() {
       // return response()->json(auth()->user());
        if ( auth()->user() )
        {
            $role_user = UserRoles::where('user_id',auth()->user()->id)->first();

            $res = [
                "id"=> auth()->user()->id,
                "firstname"=> auth()->user()->firstname,
                "lastname"=> auth()->user()->lastname,
                "username"=> auth()->user()->username,
                "addresse"=> auth()->user()->addresse,
                "email"=> auth()->user()->email,
                "phone"=> auth()->user()->phone,
                "date_nais"=> auth()->user()->date_nais,
                "link"=> auth()->user()->link,
                "photo"=> auth()->user()->photo,
                "bio"=> auth()->user()->bio,
                "address_id"=> auth()->user()->address_id,
                "balance"=> auth()->user()->balance,
                "role"=> Roles::find($role_user->role_id)->role
            ];
           // dd(auth()->user()->id) ;
           return response()->json($res);

        }
        else
        { return response()->json(['message' => 'Authontification required' , 404]) ;  }
    }
    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function createNewToken($token){

        $role_user = UserRoles::where('user_id',auth()->user()->id)->first();
        $res = [
            "id"=> auth()->user()->id,
            "firstname"=> auth()->user()->firstname,
            "lastname"=> auth()->user()->lastname,
            "username"=> auth()->user()->username,
            "addresse"=> auth()->user()->addresse,
            "email"=> auth()->user()->email,
            "phone"=> auth()->user()->phone,
            "date_nais"=> auth()->user()->date_nais,
            "link"=> auth()->user()->link,
            "photo"=> auth()->user()->photo,
            "bio"=> auth()->user()->bio,
            "address_id"=> auth()->user()->address_id,
            "balance"=> auth()->user()->balance,
            "role"=> Roles::find($role_user->role_id)->role
        ];
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60,
            'user' =>  $res
        ]);
    }
}
