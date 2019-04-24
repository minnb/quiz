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
include('dashboard.php');
Route::get('/', ['as'=>'index', 'uses'=>'Home\HomeController@index']);
Route::get('/dashboard', ['as'=>'dashboard', 'uses'=>'Dashboard\DashboardController@index']);
Route::get('/dashboard/logout', ['as'=>'dashboard.logout', 'uses'=>'Dashboard\DashboardController@getLogout']);

Route::get('/dang-nhap', ['as'=>'home.login', 'uses'=>'Home\LoginController@getLogin']);
Route::post('/dang-nhap', ['as'=>'home.login.post', 'uses'=>'Home\LoginController@postLogin']);

Route::get('/auth/{provider}',['as'=>'redirect.auth.social','uses'=>'Home\LoginController@redirectToProvider']);
Route::get('/auth/{provide}/callback',['as'=>'callback.auth.social','uses'=> 'Home\LoginController@handleProviderCallback']);

Route::get('/dang-ky-hoc-thu/{course}', ['as'=>'home.register.course.try', 'uses'=>'Home\RegisterController@registerCourse']);
Route::get('/cau-hoi-thuong-gap', ['as'=>'home.faq', 'uses'=>'Home\HomeController@getFAQ']);

Route::group(['prefix'=> 'giao-vien'], function(){
	Route::get('/{id}/{name}',['as'=>'home.teacher.detail','uses'=>'Home\TeacherController@getTeacherDetail']);

});

Route::group(['prefix'=> 'khoa-hoc'], function(){
	Route::get('/{id}/{name}',['as'=>'home.course.detail','uses'=>'Home\CourseController@getCourseDetail']);

});