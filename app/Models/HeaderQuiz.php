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

    public static function calcResultQuizV1($quiz_id){
        $answer = DetailQuiz::where([
            ['quiz_id', $quiz_id]
        ])->get();
        $kq = 0;
        $success = 0;
        foreach($answer as $item){
            $q_type = Quesstion::find($item->question_id)->type;
            $arr_anser = json_decode($item->comment);
            if (count($arr_anser) > 0) {

            }else{
                DetailQuiz::where('id', $item->id)->update(['result'=>0]);
            }
        }
    }

    public static function calcResultQuiz($quiz_id){
    	$answer = DetailQuiz::where([['quiz_id', $quiz_id]])->orderBy('id')->get();
    	foreach($answer as $item){
            $q_type = Quesstion::find($item->question_id)->type;
            $arr_anser = json_decode($item->comment);
            if (count($arr_anser) > 0) {
                if ($q_type == "value"){
                    $v = 0;
                    foreach($arr_anser as $k){
                        if(trim($k->result) == trim($k->value)){
                            $v ++;
                        }
                    }
                    if($v == count($arr_anser)){
                        DetailQuiz::where('id', $item->id)->update(['result'=>1]);
                    }else{
                        DetailQuiz::where('id', $item->id)->update(['result'=>0]);
                    }
                }

                if ($q_type == "checkbox"){
                    $cb = 0;
                    $cr = 0;
                    foreach($arr_anser as $kc){
                        if(trim($kc->result) == trim($kc->stt) && trim($kc->stt) == trim($kc->value)){
                            $cr ++;
                        }
                        $cb = Answer::where('id', $item->question_id)->where('result', '>',0)->get()->count();
                        //if(trim($kc->result) == trim($kc->stt)){
                            //$cb ++;
                        //}
                    }
                    if($cr == $cb){
                        DetailQuiz::where('id', $item->id)->update(['result'=>1]);
                    }else{
                        DetailQuiz::where('id', $item->id)->update(['result'=>0]);
                    }
                }

                if ($q_type == "radio"){
                    foreach($arr_anser as $kk){
                        if(trim($kk->result) == trim($kk->value)){
                            DetailQuiz::where('id', $item->id)->update(['result'=>1]);
                        }else{
                            DetailQuiz::where('id', $item->id)->update(['result'=>0]);
                        }
                    }
                }
            }else{
                DetailQuiz::where('id', $item->id)->update(['result'=>0]);
            }
            
    	}
        return 0;       
    }

    public static function RatingScore($quiz_id){
        $answer = DetailQuiz::where([['quiz_id', $quiz_id]])->orderBy('id')->get();
        $header = HeaderQuiz::where('id', $quiz_id)->get();
        $kq = 0;
        $success = 0;
        foreach($answer as $item){
            if($item->result == 1){
                $kq = $kq + 1;
            }
        }
        $data_result = HeaderQuiz::find($quiz_id);
        $data_result->kq = $kq;
        $data_result->success = calcPoint($header[0]->total, $kq) > 7 ? 1 : 0;
        $data_result->save();

        return $data_result;
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