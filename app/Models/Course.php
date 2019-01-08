<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;
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

}