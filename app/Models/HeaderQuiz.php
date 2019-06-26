<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB; use Auth;
use App\Models\Course;
use App\Models\DetailQuiz;
use App\Models\Quesstion;
class HeaderQuiz extends Model
{
    protected $table ="m_ket_qua_quiz";

    public static function calcResultQuiz($quiz_id){
    	$answer = DetailQuiz::where([
    		['quiz_id', $quiz_id]
    	])->get();
    	$kq = 0;
        $success = 0;
    	foreach($answer as $item){
            $q_type = Quesstion::find($item->question_id)->type;
            $arr_anser = json_decode($item->comment);
            if ($q_type == "value" || $q_type == "checkbox"){
                $v = 0;
                foreach($arr_anser as $k){
                    if($k->result == $k->value){
                        $v ++;
                    }
                }
                if($v == count($arr_anser)){
                    DetailQuiz::where('id', $item->id)->update(['result'=>1]);
                }
            }
            if ($q_type == "radio"){
                foreach($arr_anser as $k){
                    if($k->stt == $k->value){
                        DetailQuiz::where('id', $item->id)->update(['result'=>1]);
                    }
                }
            }
    	}

        foreach($answer as $item){
            if($item->result == 1){
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

    public static function getListQuiz($limit = ''){
        $data = '';
        $user_id =  Auth::user()->id;
        if($limit == ''){ 
             $data = HeaderQuiz::where([
                    ['user_id', $user_id]
                ])->orderBy('id','DESC')->get();
        }else{
             $data = HeaderQuiz::where([
                    ['user_id', $user_id]
                ])->limit($limit)->orderBy('id','DESC')->get();
        }
        return $data;
    }

    public static function insertQueeEmail($type, $quiz_id){
        $check = DB::table('w_job_send_email')->where('quiz_id', $quiz_id)->where('type',$type)->get();
        if($check->count() == 0){
            DB::table('w_job_send_email')->insert(['type'=>$type,'quiz_id'=>$quiz_id, 'status'=>0]);
        }
        return 0;
    }
}