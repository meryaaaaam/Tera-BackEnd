<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\MakeController;
use App\Http\Controllers\ModelController;
use App\Http\Controllers\OptionsController;
use App\Http\Controllers\ReservationController;
use App\Http\Controllers\User\UserController;
use App\Http\Controllers\VehiculeController;
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
Route::put('/update/{id}', [UserController::class, 'update']);

Route::apiResource("models", ModelController::class);
Route::apiResource("makes", MakeController::class);
Route::apiResource("vehicules", VehiculeController::class);

Route::get('/vehiculeByuser/{id}', [VehiculeController::class, 'CarByUser']);
Route::post('/uploadImage', [VehiculeController::class, 'uploadGallery']);
Route::post('/gallerie', [VehiculeController::class, 'gallerieTest']);


Route::post('/create/makes' , [MakeController::class , 'storeMany']) ;
Route::post('/create/models' , [ModelController::class , 'storeMany']) ;


Route::apiResource("options", OptionsController::class);
Route::apiResource("reservations", ReservationController::class);
