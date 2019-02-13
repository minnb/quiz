<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;
use App\Models\Course;
use App\Models\User;
use App\Models\Lesson;
class User_Course extends Model
{
    protected $table ="user_course";
   
    public static function getCourseByUserId($user_id){
    	$data = DB::table('user_course')->where('user_id', $user_id)->get();
    	return $data;
    }
    
    public static function getLessonRecentByUser($user_id){
    	$course = '';
    	$course_data = User_Course::getCourseByUserId($user_id);
    	if($course_data->count() > 0){
    		$course = $course_data[0]->course;
    	}
    	$data = Lesson::where([
                ['course', $course],
                ['status', 1],
            ])->limit(3)->get();
    	return $data;
    }
}