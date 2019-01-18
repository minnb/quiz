<?php

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

include('admin.php');
Route::get('/', ['as'=>'index', 'uses'=>'Home\HomeController@index']);
Route::get('/dashboard', ['as'=>'dashboard', 'uses'=>'Dashboard\DashboardController@index']);
Route::get('/dashboard/logout', ['as'=>'dashboard.logout', 'uses'=>'Dashboard\DashboardController@getLogout']);

Route::get('/dang-nhap', ['as'=>'home.login', 'uses'=>'Home\LoginController@getLogin']);
Route::post('/dang-nhap', ['as'=>'home.login.post', 'uses'=>'Home\LoginController@postLogin']);

