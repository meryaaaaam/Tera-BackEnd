<?php

use App\Http\Controllers\VehiculeController;
use App\Http\Controllers\BookingController;
use App\Http\Controllers\CardController;
use App\Http\Controllers\CashController;
use App\Http\Controllers\DisputesController;
use App\Http\Controllers\FeeController;
use App\Http\Controllers\GallerieController;
use App\Http\Controllers\MakeController;
use App\Http\Controllers\ModelController;
use App\Http\Controllers\OptionsController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\ReservationController;
use App\Http\Controllers\ReviewsController;
use App\Http\Controllers\User\UserController;
use App\Http\Controllers\User\AuthController;
use App\Http\Controllers\User\EmailVerificationController;
use App\Http\Controllers\User\PasswordController;
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
Route::post('/email/verification-notification', [EmailVerificationController::class, 'sendVerificationEmail']);
Route::get('verify-email/{id}/{hash}', [EmailVerificationController::class, 'verify'])->name('verification.verify') ;

Route::apiResource("users", UserController::class);
Route::apiResource("change_password", PasswordController::class);
Route::apiResource("cards", CardController::class);
Route::apiResource("reviews", ReviewsController::class);
Route::apiResource("gallerie", GallerieController::class);
Route::post("updatephoto/{id}", [VehiculeController::class, 'updatedPrincipalPhoto']);
Route::get('/host/reviews/{id}', [ReviewsController::class, 'Fetch_Reviews_For_User']);

//Route::put('/update/{id}', [UserController::class, 'update']);

Route::post('/uploadphoto/{id}', [UserController::class, 'uploadPhoto']);
Route::put('user/{id}', [UserController::class, 'updateduser']);
Route::apiResource("models", ModelController::class);
Route::apiResource("makes", MakeController::class);
Route::apiResource("vehicules", VehiculeController::class);

Route::get('/vehiculeByuser/{id}', [VehiculeController::class, 'CarByUser']);

Route::get('/totalprice', [ReservationController::class, 'totalprice']);
Route::post('/uploadImage', [VehiculeController::class, 'uploadGallery']);
Route::post('update/galleries/{id}', [GallerieController::class, 'storeImages']);


Route::post('/create/makes' , [MakeController::class , 'storeMany']) ;
Route::post('/create/models' , [ModelController::class , 'storeMany']) ;


Route::post('storeImage1' , [CardController::class , 'storeImage']) ;
Route::post('storeImage' , [VehiculeController::class , 'storeImage']) ;
Route::post('storeImages' , [VehiculeController::class , 'storeImages']) ;


Route::apiResource("options", OptionsController::class);
Route::apiResource("reservations", ReservationController::class);

Route::apiResource("fee", FeeController::class);



//payments
Route::post('submit_security_deposit' , [PaymentController::class , 'submitSecurityDeposit']);
Route::post('booking_payemnt' , [PaymentController::class , 'bookPayment']);
Route::post('validate_payment' , [PaymentController::class , 'validatePayment']);
Route::post('make_pre_authorize' , [PaymentController::class , 'makePreAuthorizePA1']);
Route::post('make_pre_authorize2' , [PaymentController::class , 'makePreAuthorizePA2']);

//disputes
Route::post('open_dispute' , [DisputesController::class , 'openDispute']);
Route::get('get_all_disputes' , [DisputesController::class , 'index']);

//bookings
Route::get('get_all_bookings' , [BookingController::class, 'index']);
Route::get('get_bookings/{id}' , [BookingController::class, 'getBookingsByUser']);
Route::get('get_bookings_requests/{id}' , [BookingController::class, 'getBookingsRequest']);
Route::get('get_approved_bookings' , [BookingController::class, 'getApprovedBookings']);
Route::get('get_host_approved_bookings/{id}' , [BookingController::class, 'getHostApprovedBookings']);

//checkout page
Route::post('display_balance' , [UserController::class, 'displayBalance']);

//cashout
Route::post('cashout' , [CashController::class, 'AskForCashout']);
Route::get('list_cashout' , [CashController::class, 'listCashoutDemands']);
Route::post('validate_cashout' , [CashController::class, 'validateCashout']);
Route::get('cashout_history' , [CashController::class, 'listcashout']);

//admin_dashboad
//Route::post('give_back_deposit' , [PaymentController::class , 'giveBackDeposit']);
Route::post('releast_security_deposit' , [PaymentController::class , 'ReleastSecurityDeposit']);

Route::post('collect_deposit' , [PaymentController::class , 'collectDeposit']);

//booking status
Route::post('change_booking_status' , [BookingController::class , 'changeBookingStatus']);

//customize security deposit and Client Fee
Route::post('security_deposit_and_client_fee' , [BookingController::class , 'SecurityDepositClientFee']);
Route::put('Change_user_status' , [UserController::class , 'Change_user_status']);


//transaction
Route::get('get_list_transactions'  , [PaymentController::class , 'List_transaction']);
