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

Route::get('/dang-nhap', ['as'=>'home.login', 'uses'=>'Home\HomeController@getLogin']);