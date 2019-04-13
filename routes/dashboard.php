<?php

Route::group(['prefix'=> 'dashboard'], function(){
	Route::group(['prefix'=> 'course'], function(){
		Route::get('list', ['as'=>'get.dashboard.course.list','uses'=>'Dashboard\CourseController@getList']);
		Route::get('khoa-hoc-cua-toi', ['as'=>'get.dashboard.course.mycourse','uses'=>'Dashboard\CourseController@getMyCourse']);
		Route::get('detail/{id}', ['as'=>'get.dashboard.course.detail','uses'=>'Dashboard\CourseController@getDetail']);
		Route::get('detail/{course}/{lesson}', ['as'=>'get.dashboard.course.detail.lesson','uses'=>'Dashboard\CourseController@getDetailLesson']);
	});

	Route::group(['prefix'=> 'quiz'], function(){
		Route::get('practice', ['as'=>'get.dashboard.quiz.practice','uses'=>'Dashboard\QuizController@getPractice']);

		Route::get('take-quiz/{type}/{course}/{thematic}/{lesson}/{token}', ['as'=>'get.dashboard.quiz.take','uses'=>'Dashboard\QuizController@getTakeQuiz']);

		Route::get('take-quiz-thematic/{type}/{course}/{thematic}/{token}', ['as'=>'get.dashboard.quiz.thematic','uses'=>'Dashboard\QuizController@getTakeQuizByThematic']);

		Route::get('take-week/{type}/{course}/{subject}/{week}/{token}', ['as'=>'get.dashboard.quiz.take.week','uses'=>'Dashboard\QuizController@getTakeQuizByWeek']);

		Route::get('take-period/{type}/{course}/{token}', ['as'=>'get.dashboard.period.take','uses'=>'Dashboard\QuizController@getExamPeriod']);

		Route::post('take-quiz/{quiz_id}', ['as'=>'post.dashboard.quiz.take.detail','uses'=>'Dashboard\QuizController@postTakeQuizDetail']);
		Route::post('take-quiz-week/{quiz_id}', ['as'=>'post.dashboard.quiz.take.week','uses'=>'Dashboard\QuizController@postTakeQuizWeek']);
		Route::post('take-period/{quiz_id}/{type}', ['as'=>'post.dashboard.quiz.take.period','uses'=>'Dashboard\QuizController@postExamPeriod']);

		Route::get('quiz-result/{quiz_id}', ['as'=>'get.dashboard.quiz.take.result','uses'=>'Dashboard\QuizController@getTakeQuizResult']);
		Route::get('week-result/{quiz_id}', ['as'=>'get.dashboard.week.take.result','uses'=>'Dashboard\QuizController@getTakeWeekResult']);
		Route::get('period-result/{quiz_id}', ['as'=>'get.dashboard.period.take.result','uses'=>'Dashboard\QuizController@getTakePeriodResult']);
		Route::get('thematic-result/{quiz_id}', ['as'=>'get.dashboard.period.take.result','uses'=>'Dashboard\QuizController@getTakeThematicResult']);

		Route::get('take-again/{quiz_id}', ['as'=>'get.dashboard.take.again','uses'=>'Dashboard\QuizController@getTakeQuizAgain']);

		Route::get('report-quiz/{user_id}', ['as'=>'get.dashboard.report.quiz','uses'=>'Dashboard\ResultController@getReportQuiz']);
	});

	Route::group(['prefix'=> 'result'], function(){
		Route::get('point/{user_id}', ['as'=>'get.dashboard.result.table.point','uses'=>'Dashboard\ResultController@getTablePoint']);
	});

	Route::group(['prefix'=> 'forum'], function(){
		Route::get('index', ['as'=>'get.forum.index','uses'=>'Dashboard\ForumController@getIndex']);
		Route::post('send/comment/{course}/{lesson}', ['as'=>'post.forum.comment.by.lesson','uses'=>'Dashboard\ForumController@postCommnetByLesson']);
	});
});
