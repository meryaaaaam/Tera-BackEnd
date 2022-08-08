<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\BookingController;
use App\Http\Controllers\CardController;
use App\Http\Controllers\DisputesController;
use App\Http\Controllers\MakeController;
use App\Http\Controllers\ModelController;
use App\Http\Controllers\OptionsController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\ReservationController;
use App\Http\Controllers\User\UserController;
use App\Http\Controllers\VehiculeController;
use App\Http\Controllers\PasswordController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();



});


Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function ($router) {
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/refresh', [AuthController::class, 'refresh']);
    Route::get('/user-profile', [AuthController::class, 'userProfile']);




});

Route::apiResource("users", UserController::class);
Route::apiResource("passwd", PasswordController::class);
Route::apiResource("cards", CardController::class);
//Route::put('/update/{id}', [UserController::class, 'update']);

Route::post('/uploadphoto/{id}', [UserController::class, 'uploadPhoto']);
Route::put('user/{id}', [UserController::class, 'updateduser']);
Route::apiResource("models", ModelController::class);
Route::apiResource("makes", MakeController::class);
Route::apiResource("vehicules", VehiculeController::class);

Route::get('/vehiculeByuser/{id}', [VehiculeController::class, 'CarByUser']);

Route::get('/totalprice', [ReservationController::class, 'totalprice']);
Route::post('/uploadImage', [VehiculeController::class, 'uploadGallery']);
Route::post('/gallerie', [VehiculeController::class, 'gallerieTest']);


Route::post('/create/makes' , [MakeController::class , 'storeMany']) ;
Route::post('/create/models' , [ModelController::class , 'storeMany']) ;


Route::post('storeImage1' , [CardController::class , 'storeImage']) ;
Route::post('storeImage' , [VehiculeController::class , 'storeImage']) ;
Route::post('storeImages' , [VehiculeController::class , 'storeImages']) ;


Route::apiResource("options", OptionsController::class);
Route::apiResource("reservations", ReservationController::class);



//payments
Route::post('submit_security_deposit' , [PaymentController::class , 'submitSecurityDeposit']);
Route::post('booking_payemnt' , [PaymentController::class , 'bookPayment']);
Route::post('validate_payment' , [PaymentController::class , 'validatePayment']);

//disputes
Route::post('open_dispute' , [DisputesController::class , 'openDispute']);
Route::get('get_all_disputes' , [DisputesController::class , 'index']);

//bookings
Route::get('get_all_bookings' , [BookingController::class, 'index']);
Route::get('get_bookings/{id}' , [BookingController::class, 'getBookingsByUser']);

//checkout page
Route::post('display_balance' , [UserController::class, 'displayBalance']);

//cashout
Route::post('cashout' , [UserController::class, 'cashout']);
Route::post('list_cashout' , [UserController::class, 'listCashout']);
Route::post('validate_cashout' , [UserController::class, 'validateCashout']);

//admin_dashboad
Route::post('give_back_deposit' , [PaymentController::class , 'giveBackDeposit']);
Route::post('collect_deposit' , [PaymentController::class , 'collectDeposit']);

//booking status
Route::post('change_booking_status' , [BookingController::class , 'changeBookingStatus']);

//customize security deposit and Client Fee
Route::post('security_deposit_and_client_fee' , [BookingController::class , 'SecurityDepositClientFee']);

