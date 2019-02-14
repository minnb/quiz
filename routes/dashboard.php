<?php

Route::group(['prefix'=> 'dashboard'], function(){
	Route::group(['prefix'=> 'course'], function(){
		Route::get('list', ['as'=>'get.dashboard.course.list','uses'=>'Dashboard\CourseController@getList']);
		Route::get('khoa-hoc-cua-toi', ['as'=>'get.dashboard.course.mycourse','uses'=>'Dashboard\CourseController@getMyCourse']);
		Route::get('detail/{id}', ['as'=>'get.dashboard.course.detail','uses'=>'Dashboard\CourseController@getDetail']);
		Route::get('detail/{course}/{lesson}', ['as'=>'get.dashboard.course.detail.lesson','uses'=>'Dashboard\CourseController@getDetailLesson']);
	});

	Route::group(['prefix'=> 'quiz'], function(){
		Route::get('take-quiz/{type}/{course}/{thematic}/{id}', ['as'=>'get.dashboard.quiz.take','uses'=>'Dashboard\QuizController@getTakeQuiz']);
		Route::get('take-quiz/{type}/{course}/{thematic}/{id}/{question_id}', ['as'=>'get.dashboard.quiz.take.detail','uses'=>'Dashboard\QuizController@getTakeQuizDetail']);
		Route::post('take-quiz/{quiz_id}', ['as'=>'post.dashboard.quiz.take.detail','uses'=>'Dashboard\QuizController@postTakeQuizDetail']);
	});

});
