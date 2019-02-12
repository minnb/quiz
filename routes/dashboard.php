<?php

Route::group(['prefix'=> 'dashboard'], function(){
	Route::group(['prefix'=> 'course'], function(){
		Route::get('list', ['as'=>'get.dashboard.course.list','uses'=>'Dashboard\CourseController@getList']);
		Route::get('khoa-hoc-cua-toi', ['as'=>'get.dashboard.course.mycourse','uses'=>'Dashboard\CourseController@getMyCourse']);
		Route::get('detail/{id}', ['as'=>'get.dashboard.course.detail','uses'=>'Dashboard\CourseController@getDetail']);
	});
});
