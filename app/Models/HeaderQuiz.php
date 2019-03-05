<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;
use App\Models\Course;
use App\Models\DetailQuiz;
class HeaderQuiz extends Model
{
    protected $table ="m_ket_qua_quiz";

    public static function calcResultQuiz($quiz_id){
    	$answer = DetailQuiz::where([
    		['quiz_id', $quiz_id]
    	])->get();
    	$kq = 0;$success = 0;
    	foreach($answer as $item){
    		if($item->result == $item->answer){
    			$kq ++;
    		}
    	}
    	$header = HeaderQuiz::where('id', $quiz_id)->get();
    	$cal = calcPoint($header[0]->total, $kq) ; //round((10/$header[0]->total)*$kq,0);
    	if($cal >= 7){
    		$success = 1;
    	}

    	HeaderQuiz::where('id',$quiz_id)->update(['kq'=>$kq, 'success'=>$success]);
    	return 0;
    }
}