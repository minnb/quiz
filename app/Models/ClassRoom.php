<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;
use App\Models\Course;
class ClassRoom extends Model
{
    protected $table ="m_lop_hoc";

    public static function countCourseByClass($class_id){
    	$count = 0;
    	if($class_id > 0){
    		$count = Course::where([
    			['class', $class_id],
    			['status', 1]
    		])->get()->count();
    	}
    	return $count;
    }

}