<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;
use App\Models\Course;
use App\Models\ClassRoom;
use App\Models\Subject;
class Thematic extends Model
{
    protected $table ="m_chuyen_de";
    
    public static function getCourseByThematic($thematic){
    	$thematic = Thematic::find($thematic);
    	$course = Course::where('code',$thematic->course)->get();
    	$class = ClassRoom::find($thematic->class)->name;
    	$subject = Subject::find($thematic->subject)->name;
    	return $subject.' - '.$class.' - '.$course[0]->name;
    }


}