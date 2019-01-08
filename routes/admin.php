<?php
Auth::routes();
Route::get('/admin', ['as'=>'admin', 'uses'=>'Admin\AdminController@index']);

Route::group(['prefix'=> 'admin'], function(){
		Route::group(['prefix'=> 'class'], function(){
			Route::get('list', ['as'=>'get.admin.class.list','uses'=>'Admin\ClassController@getList']);
			Route::get('add', ['as'=>'get.admin.class.add','uses'=>'Admin\ClassController@getAdd']);
			Route::post('add', ['as'=>'post.admin.class.add','uses'=>'Admin\ClassController@postAdd']);
			Route::get('edit/{id}', ['as'=>'get.admin.class.edit','uses'=>'Admin\ClassController@getEdit']);
			Route::post('edit/{id}', ['as'=>'post.admin.class.edit','uses'=>'Admin\ClassController@postEdit']);
			Route::get('delete/{id}', ['as'=>'get.admin.class.delete','uses'=>'Admin\ClassController@getDelete']);
		
		});
	});

Route::group(['prefix'=> 'admin'], function(){
		Route::group(['prefix'=> 'course'], function(){
			Route::get('list', ['as'=>'get.admin.course.list','uses'=>'Admin\CourseController@getList']);
			Route::get('add/{class}', ['as'=>'get.admin.course.add','uses'=>'Admin\CourseController@getAdd']);
			Route::post('add/{class}', ['as'=>'post.admin.course.add','uses'=>'Admin\CourseController@postAdd']);
			Route::get('edit/{id}', ['as'=>'get.admin.course.edit','uses'=>'Admin\CourseController@getEdit']);
			Route::post('edit/{id}', ['as'=>'post.admin.course.edit','uses'=>'Admin\CourseController@postEdit']);
			Route::get('delete/{id}', ['as'=>'get.admin.course.delete','uses'=>'Admin\CourseController@getDelete']);
		
		});
	});
