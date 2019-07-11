<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;use Auth;
use App\Models\ClassRoom;
use App\Models\Course_Subject;
use App\Models\User;
class Course extends Model
{
    protected $table ="m_khoa_hoc";
    public static function getCourseName($id){
    	if($id == 0){
    		return "Cơ bản";
    	}else{
    		return "Nâng cao";
    	}
    }
    public static function checkMemberDashboard(){
        $data = Course::getMyCourse();
        if(isset($data) && $data->count() > 0){
            return true;
        }else{
            return false;
        }
    }
    public static function checkUserCourse($code){
        $course = DB::table('user_course')->where([
            ['course', $code],
            ['user_id', Auth::user()->id]
        ])->get()->toArray();
        return $course;
    }
    public static function getMyCourse(){
        $course = DB::table('m_khoa_hoc')
            ->join('user_course', 'm_khoa_hoc.code', '=', 'user_course.course')
            ->where('user_course.status', 0)->where('user_course.user_id', Auth::user()->id)
            ->select('m_khoa_hoc.*')
            ->get();
        return $course;
    }


    public static function getCourseSelect($status){
        return DB::table('m_khoa_hoc')->where('status', $status)->select('code as id', 'full_name as name')->get();
    }

    public static function checkSourceOnClass($class, $course){
    	$count = Course::where([
    		['class', $class],
    		['course', $course],
    		['status', 1]
    	])->get()->count();
    	if($count == 1){
    		return 1;
    	}else{
    		return 0;
    	}
    }

    public static function checkSubjectInCourse($course, $subject){
        $count = Course_Subject::where([
            ['subject', $subject],
            ['course', $course]
        ])->get()->count();
        if($count == 1){
            return 1;
        }else{
            return 0;
        }
    }
    public static function getClassByCourse($code){
        $data =  Course::where('code', $code)->get();
        return $data[0]->class;
    }
    
    public static function getFullNameCourse($code){
        $data =  Course::where('code', $code)->get();
        $class = ClassRoom::find($data[0]->class)->name;
        return $class.' - '.$data[0]->name;
    }

    public static function getFullNameCourseById($id){
        $data =  Course::where('id', $id)->get();
        $class = ClassRoom::find($data[0]->class)->name;
        return $class.' - '.$data[0]->name;
    }

    public static function getPriceCourse($code){
        $data =  Course::where('code', $code)->get();
        return $data[0]->unit_price;
    }
}