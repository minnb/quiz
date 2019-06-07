<?php

use Illuminate\Http\Request;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('auth/jwt/register', 'Admin\UserController@register');
Route::post('auth/jwt/login', 'Admin\UserController@login');

Route::get('/token/refresh', 'Admin\UserController@refresh');

Route::get('api/get','Admin\UserController@get');

Route::get('auth/jwt/{token}', 'Admin\UserController@getUserInfo');

Route::group(['prefix' => 'v1'], function () {
	Route::get('quiz-take/{id}/{token}', 'Api\QuizController@getDataQuiz');

});



/*
Route::group(['middleware' => 'quiz'], function () {
    Route::get('auth/jwt/user', 'Admin\UserController@getUserInfo');
});
*/