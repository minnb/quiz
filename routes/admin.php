<?php
Auth::routes();
Route::get('/admin', ['as'=>'admin', 'uses'=>'Admin\AdminController@index']);
Route::get('/admin/logout', ['as'=>'admin.logout', 'uses'=>'Admin\AdminController@getLogout']);
Route::post('/admin/login', ['as'=>'admin.login.post', 'uses'=>'Auth\LoginController@postLogin']);

Route::group(['prefix'=> 'admin'], function(){
	Route::group(['prefix'=> 'class'], function(){
		Route::get('list', ['as'=>'get.admin.class.list','uses'=>'Admin\ClassController@getList']);
		Route::get('add', ['as'=>'get.admin.class.add','uses'=>'Admin\ClassController@getAdd']);
		Route::post('add', ['as'=>'post.admin.class.add','uses'=>'Admin\ClassController@postAdd']);
		Route::get('edit/{id}', ['as'=>'get.admin.class.edit','uses'=>'Admin\ClassController@getEdit']);
		Route::post('edit/{id}', ['as'=>'post.admin.class.edit','uses'=>'Admin\ClassController@postEdit']);
		Route::get('delete/{id}', ['as'=>'get.admin.class.delete','uses'=>'Admin\ClassController@getDelete']);
	});

	Route::group(['prefix'=> 'course'], function(){
		Route::get('list', ['as'=>'get.admin.course.list','uses'=>'Admin\CourseController@getList']);
		Route::get('add/{class}', ['as'=>'get.admin.course.add','uses'=>'Admin\CourseController@getAdd']);
		Route::post('add/{class}', ['as'=>'post.admin.course.add','uses'=>'Admin\CourseController@postAdd']);
		Route::get('edit/{id}', ['as'=>'get.admin.course.edit','uses'=>'Admin\CourseController@getEdit']);
		Route::post('edit/{id}', ['as'=>'post.admin.course.edit','uses'=>'Admin\CourseController@postEdit']);
		Route::get('delete/{id}', ['as'=>'get.admin.course.delete','uses'=>'Admin\CourseController@getDelete']);
		
		Route::get('add/subject/{course}', ['as'=>'get.admin.course.add.subject','uses'=>'Admin\CourseController@getAddSubject']);
		Route::post('add/subject/{course}', ['as'=>'post.admin.course.add.subject','uses'=>'Admin\CourseController@postAddSubject']);

		Route::get('user/register/{id}', ['as'=>'get.admin.course.register','uses'=>'Admin\AdminController@getUserCourseEdit']);
		Route::post('user/register/{id}', ['as'=>'post.admin.course.register','uses'=>'Admin\AdminController@postUserCourseEdit']);
	    Route::get('user/delete/{id}', ['as'=>'get.admin.course.delete','uses'=>'Admin\AdminController@getUserourseDelete']);
	});

	Route::group(['prefix'=> 'subject'], function(){
		Route::get('list', ['as'=>'get.admin.subject.list','uses'=>'Admin\SubjectController@getList']);
		Route::get('add', ['as'=>'get.admin.subject.add','uses'=>'Admin\SubjectController@getAdd']);
		Route::post('add', ['as'=>'post.admin.subject.add','uses'=>'Admin\SubjectController@postAdd']);
		Route::get('edit/{id}', ['as'=>'get.admin.subject.edit','uses'=>'Admin\SubjectController@getEdit']);
		Route::post('edit/{id}', ['as'=>'post.admin.subject.edit','uses'=>'Admin\SubjectController@postEdit']);
		Route::get('delete/{id}', ['as'=>'get.admin.subject.delete','uses'=>'Admin\SubjectController@getDelete']);
	});

	Route::group(['prefix'=> 'thematic'], function(){
		Route::get('list', ['as'=>'get.admin.thematic.list','uses'=>'Admin\ThematicController@getList']);
		Route::get('list/{id}', ['as'=>'get.admin.thematic.list.byid','uses'=>'Admin\ThematicController@getListById']);
		Route::get('add/{course}/{subject}', ['as'=>'get.admin.thematic.add','uses'=>'Admin\ThematicController@getAdd']);
		Route::post('add/{course}/{subject}', ['as'=>'post.admin.thematic.add','uses'=>'Admin\ThematicController@postAdd']);
		Route::get('edit/{id}', ['as'=>'get.admin.thematic.edit','uses'=>'Admin\ThematicController@getEdit']);
		Route::post('edit/{id}', ['as'=>'post.admin.thematic.edit','uses'=>'Admin\ThematicController@postEdit']);
		Route::get('delete/{id}', ['as'=>'get.admin.thematic.delete','uses'=>'Admin\ThematicController@getDelete']);
	});

	Route::group(['prefix'=> 'exam'], function(){
		Route::get('list', ['as'=>'get.admin.exam.list','uses'=>'Admin\ExamController@getList']);
		Route::get('add', ['as'=>'get.admin.exam.add','uses'=>'Admin\ExamController@getAdd']);
		Route::post('add', ['as'=>'post.admin.exam.add','uses'=>'Admin\ExamController@postAdd']);
		Route::get('edit/{id}', ['as'=>'get.admin.exam.edit','uses'=>'Admin\ExamController@getEdit']);
		Route::post('edit/{id}', ['as'=>'post.admin.exam.edit','uses'=>'Admin\ExamController@postEdit']);
		Route::get('delete/{id}', ['as'=>'get.admin.exam.delete','uses'=>'Admin\ExamController@getDelete']);
	});

	Route::group(['prefix'=> 'quesstion'], function(){
		Route::get('list/quiz', ['as'=>'get.admin.quesstion.list.quiz','uses'=>'Admin\QuesstionController@getListQuiz']);
		Route::get('list/question', ['as'=>'get.admin.quesstion.list.question','uses'=>'Admin\QuesstionController@getListQuest']);
		Route::get('add', ['as'=>'get.admin.quesstion.add','uses'=>'Admin\QuesstionController@getAdd']);
		Route::post('add', ['as'=>'post.admin.quesstion.add','uses'=>'Admin\QuesstionController@postAdd']);
		Route::get('add/thematic/{thematic}', ['as'=>'get.admin.quesstion.add.thematic','uses'=>'Admin\QuesstionController@getAddByThematic']);
		Route::post('add/thematic/{thematic}', ['as'=>'post.admin.quesstion.add.thematic','uses'=>'Admin\QuesstionController@postAddByThematic']);
		Route::get('edit/{id}', ['as'=>'get.admin.quesstion.edit','uses'=>'Admin\QuesstionController@getEdit']);
		Route::post('edit/{id}', ['as'=>'post.admin.quesstion.edit','uses'=>'Admin\QuesstionController@postEdit']);
		Route::get('delete/{id}', ['as'=>'get.admin.quesstion.delete','uses'=>'Admin\QuesstionController@getDelete']);
		
		Route::get('import/question/{id}', ['as'=>'get.admin.question.import','uses'=>'Admin\QuesstionController@getImportExcel']);
		Route::post('import/question/{id}', ['as'=>'post.admin.question.import.upload','uses'=>'Admin\QuesstionController@postUploadExcel']);
		Route::post('import/question/data/{id}', ['as'=>'post.admin.question.import','uses'=>'Admin\QuesstionController@postImportExcel']);
		Route::get('import/question/undo/{id}', ['as'=>'get.admin.question.import.undo','uses'=>'Admin\QuesstionController@getImportUndo']);

		Route::get('import/quiz/{lesson}', ['as'=>'get.admin.import.quiz.lesson','uses'=>'Admin\ImportController@getImportQuizByLesson']);
		Route::post('import/quiz/{lesson}', ['as'=>'post.admin.import.quiz.lesson','uses'=>'Admin\ImportController@postImportQuizByLesson']);
		Route::get('import/quiz/undo/{lesson}', ['as'=>'get.admin.import.quiz.lesson.undo','uses'=>'Admin\ImportController@getUndoQuizByLesson']);
		Route::post('import/quiz/data/{lesson}', ['as'=>'post.admin.import.quiz.lesson.data','uses'=>'Admin\ImportController@postDataQuizByLesson']);
	});

	Route::group(['prefix'=> 'lesson'], function(){
		Route::get('list', ['as'=>'get.admin.lesson.list','uses'=>'Admin\LessonController@getList']);
		Route::get('add', ['as'=>'get.admin.lesson.add','uses'=>'Admin\LessonController@getAdd']);
		Route::post('add', ['as'=>'post.admin.lesson.add','uses'=>'Admin\LessonController@postAdd']);
		Route::get('add/thematic/{thematic}', ['as'=>'get.admin.lesson.add.thematic','uses'=>'Admin\LessonController@getAddByThematic']);
		Route::post('add/thematic/{thematic}', ['as'=>'post.admin.lesson.add.thematic','uses'=>'Admin\LessonController@postAddByThematic']);
		Route::get('edit/{id}', ['as'=>'get.admin.lesson.edit','uses'=>'Admin\LessonController@getEdit']);
		Route::post('edit/{id}', ['as'=>'post.admin.lesson.edit','uses'=>'Admin\LessonController@postEdit']);
		Route::get('delete/{id}', ['as'=>'get.admin.lesson.delete','uses'=>'Admin\LessonController@getDelete']);
	
	});

	Route::group(['prefix'=> 'user'], function(){
		Route::get('list', ['as'=>'get.admin.user.list','uses'=>'Admin\AdminController@getListUser']);
		Route::get('add', ['as'=>'get.admin.user.add','uses'=>'Admin\AdminController@getAddUser']);
		Route::post('add', ['as'=>'post.admin.user.add','uses'=>'Admin\AdminController@postAddUser']);
		Route::get('edit/{id}', ['as'=>'get.admin.user.edit','uses'=>'Admin\AdminController@getEditUser']);
		Route::post('edit/{id}', ['as'=>'post.admin.user.edit','uses'=>'Admin\AdminController@postEditUser']);
		Route::get('delete/{id}', ['as'=>'get.admin.user.delete','uses'=>'Admin\AdminController@getDeleteUser']);
		
		Route::get('course', ['as'=>'get.admin.user.list.course','uses'=>'Admin\AdminController@getListUserCourse']);
		Route::get('add/course/{id}', ['as'=>'get.admin.user.add.course','uses'=>'Admin\AdminController@getUserAddCourse']);
		Route::post('add/course/{id}', ['as'=>'post.admin.user.add.course','uses'=>'Admin\AdminController@postUserAddCourse']);
	});

	Route::group(['prefix'=> 'teacher'], function(){
		Route::get('list', ['as'=>'get.admin.teacher.list','uses'=>'Admin\TeacherController@getList']);
		Route::get('add', ['as'=>'get.admin.teacher.add','uses'=>'Admin\TeacherController@getAdd']);
		Route::post('add', ['as'=>'post.admin.teacher.add','uses'=>'Admin\TeacherController@postAdd']);
		Route::get('edit/{id}', ['as'=>'get.admin.teacher.edit','uses'=>'Admin\TeacherController@getEdit']);
		Route::post('edit/{id}', ['as'=>'post.admin.teacher.edit','uses'=>'Admin\TeacherController@postEdit']);
		Route::get('delete/{id}', ['as'=>'get.admin.teacher.delete','uses'=>'Admin\TeacherController@getDelete']);
	});

	Route::group(['prefix'=> 'pages'], function(){
		Route::get('slide', ['as'=>'get.admin.pages.slide.list','uses'=>'Admin\PagesController@getSlide']);
		Route::post('slide/add', ['as'=>'post.admin.pages.slide.add','uses'=>'Admin\PagesController@postSlide']);
		Route::get('slide/edit/{id}', ['as'=>'get.admin.pages.slide.edit','uses'=>'Admin\PagesController@getEditSlide']);
		Route::post('slide/edit/{id}', ['as'=>'post.admin.pages.slide.edit','uses'=>'Admin\PagesController@postEditSlide']);

		Route::get('qa/list', ['as'=>'get.admin.pages.qa.list','uses'=>'Admin\PagesController@getQaList']);
		Route::post('qa/add', ['as'=>'post.admin.pages.qa.add','uses'=>'Admin\PagesController@postQaAdd']);
	});

	Route::group(['prefix'=> 'news'], function(){
		Route::get('list', ['as'=>'get.admin.news.list','uses'=>'Admin\NewController@getList']);
		Route::get('add', ['as'=>'get.admin.news.add','uses'=>'Admin\NewController@getAdd']);
		Route::post('add', ['as'=>'post.admin.news.add','uses'=>'Admin\NewController@postAdd']);
		Route::get('edit/{id}', ['as'=>'get.admin.news.edit','uses'=>'Admin\NewController@getEdit']);
		Route::post('edit/{id}', ['as'=>'post.admin.news.edit','uses'=>'Admin\NewController@postEdit']);
		Route::get('delete/{id}', ['as'=>'get.admin.news.delete','uses'=>'Admin\NewController@getDelete']);
	});
});



