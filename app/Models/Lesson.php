<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;
use App\Models\Course;
class Lesson extends Model
{
    protected $table ="m_bai_giang";

    public static function countLessonInThematic($thematic){
    	return Lesson::where([
    		['thematic', $thematic]
    	])->get()->count();
    }

    public static function countLessonByCourse($course){
    	return Lesson::where([
    		['course', $course]
    	])->get()->count();
    }

}