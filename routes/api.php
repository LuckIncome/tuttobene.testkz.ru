<?php

use App\Http\Controllers\PaymentController;
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
Route::post('/online/successTransaction',[PaymentController::class, 'successTransaction']);
Route::post('/online/failureTransaction',[PaymentController::class, 'failureTransaction']);
Route::post('/online/saveTransaction',[PaymentController::class, 'saveTransaction']);
Route::post('/online/stateTransaction',[PaymentController::class, 'stateTransaction']);
