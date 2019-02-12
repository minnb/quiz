<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;
use App\Models\ClassRoom;
use App\Models\Course_Subject;
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

}