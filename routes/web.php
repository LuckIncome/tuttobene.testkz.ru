<?php

use App\Http\Controllers\CallbacksController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\PagesController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\PostsController;
use App\Http\Controllers\ProductsController;
use App\Models\Cake;
use App\Models\IceType;
use Illuminate\Support\Facades\Route;
use \App\Models\Icecream;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Route::get('/testsms/{order}', [CartController::class,'sendSmsToClient'])->name('testsms');


Route::group(['prefix' => 'admin'], function () {
    Route::post('orders/{orderId}/update', [ProductsController::class,'orderUpdate'])->name('orders.update');
    Voyager::routes();
});

Route::get('/constructor/getAddons',[ProductsController::class,'getConstructorAddons'])->name('constructor.addons');
Route::post('/constructor/confirm',[CartController::class,'constructorConfirm'])->name('constructor.confirm');

Route::post('/callback',[CallbacksController::class,'callback'])->name('callback');

Route::get('/cart',[CartController::class,'index'])->name('cart.index');
Route::get('/cart/getCartAddons',[CartController::class,'getCartAddons'])->name('cart.addons');
Route::post('/cart/add',[CartController::class,'add'])->name('cart.add');
Route::post('/cart/update',[CartController::class,'update'])->name('cart.update');
Route::post('/cart/remove',[CartController::class,'remove'])->name('cart.remove');
Route::get('/cart/getContent',[CartController::class,'getContent'])->name('cart.getContent');
Route::get('/cart/clear',[CartController::class,'clear'])->name('cart.clear');
Route::get('/cart/checkout',[CartController::class,'checkout'])->name('cart.checkout');
Route::post('/checkout/confirm',[CartController::class,'confirm'])->name('cart.confirm');
Route::get('/checkout/{orderId}/thanks',[CartController::class,'checkoutThanks'])->name('cart.checkout.thanks');
Route::get('/checkout/{orderId}/cardPay',[CartController::class,'cardPay'])->name('cart.checkout.cardPay');
Route::get('/checkout/{orderId}/{paymentId}/awaiting',[PaymentController::class,'checkoutAwaiting'])->name('cart.checkout.awaiting');
Route::get('/checkout/{orderId}/{paymentId}/checkPaymentStatus',[PaymentController::class,'checkOrderPaymentStatus'])->name('checkPaymentStatus');


Route::get('/{category}/{type?}', [ProductsController::class,'category'])
    ->where('category',Icecream::ICECREAM.'|'.Icecream::CAKE)
    ->where('type',IceType::where('status',true)->get()->implode('slug','|').'|popular')
    ->name('products.index');

Route::get('/{category}/{product}', [ProductsController::class,'show'])
    ->where('category',Icecream::ICECREAM.'|'.Icecream::CAKE)
    ->where('product',Icecream::where('status',true)->get()->implode('slug','|').'|'. Cake::where('status',true)->get()->implode('slug','|'))
    ->name('products.show');

Route::get('/{category}/{product}/info', [ProductsController::class,'showInfo'])
    ->where('category',Icecream::ICECREAM)
    ->where('product',Icecream::where('status',true)->get()->implode('slug','|'))
    ->name('products.showInfo');

Route::get('/novosti',[PostsController::class,'index'])->name('posts.index');
Route::get('/novosti/{post}',[PostsController::class,'show'])->name('posts.show');

Route::get('/{slug?}', [PagesController::class,'getPage'])->name('pages.show');
//Route::get('/{page}/{innerPage}', [PagesController::class,'pageInner'])->name('pages.inner');
