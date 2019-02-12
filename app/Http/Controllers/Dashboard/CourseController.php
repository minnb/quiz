<?php
namespace App\Http\Controllers\Dashboard;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\User_Course;
use App\Models\Lesson;
use App\Models\Course;
use DB; use Session;
use Auth;
class CourseController extends Controller
{
    
	public function __construct()
    {
    	$this->middleware('quiz');
    }
  
    public function getList(){
        $course_data = Course::where([
                ['status', 1]
            ])->get();
        return view('dashboard.course.list', compact('course_data'));
    }

    public function getMyCourse(){
        $user_id = User::getInfoUser()['id'];
        $user_course = User_Course::getCourseByUserId($user_id);
        return view('dashboard.course.my_course', compact('user_course', 'user_id'));
    }

    public function getDetail($idd){
        $course = fdecrypt($idd); 
        $user_id = User::getInfoUser()['id'];
        $lesson_data = Lesson::where([
                ['course', $course],
                ['status', 1],
            ])->get();
        if($lesson_data->count() > 0){
            $check_user = User_Course::where([
                    ['user_id',$user_id],
                    ['course',$course],
                ])->get()->count();    
            if($check_user > 0){
                return view('dashboard.course.detail', compact('lesson_data','course'));
            }else{
                return view('dashboard.course.detail_no', compact('lesson_data','course'));
            }
            
        }else{
            return back();
        }
    }

    public function getDetailLesson($course, $lesson){
        $course_id = fdecrypt($course); 
        $lesson_id = fdecrypt($lesson); 
        $user_id = User::getInfoUser()['id'];
        $lesson_data = Lesson::where([
                ['course', $course_id],
                ['status', 1],
            ])->get();
        $lesson_detail = Lesson::find($lesson_id);
        
        if(isset($lesson_data) && isset($lesson_detail)){
            $check_user = User_Course::where([
                    ['user_id',$user_id],
                    ['course',$course_id],
                ])->get()->count(); 
            if($check_user > 0){
                return view('dashboard.course.course_lesson', compact('lesson_data','course_id', 'lesson_id', 'lesson_detail'));
            }else{
                return view('dashboard.course.course_lesson_no', compact('lesson_data','course_id', 'lesson_id', 'lesson_detail'));
            }
            
        }else{
            return back();
        }

    }
}
