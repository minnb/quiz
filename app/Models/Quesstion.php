<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;
use App\Models\Course;
use App\Models\DataQuiz;
use Illuminate\Support\Collection;
class Quesstion extends Model
{
    protected $table ="m_cau_hoi";

    public static function countQuesstionInThematic($thematic){
    	return Quesstion::where([
    		['thematic', $thematic]
    	])->get()->count();
    }

    public static function getQuestionData($thematic_id, $quiz_id){
    	$question = new Collection();
    	$data_question = DB::table('m_cau_hoi')
	            ->join('m_ket_qua_quiz_question', 'm_ket_qua_quiz_question.question_id','=','m_cau_hoi.id')
	            ->select('m_ket_qua_quiz_question.quiz_id', "m_cau_hoi.id as question_id", 'm_cau_hoi.name','m_cau_hoi.type')
	            ->where([
	            		['m_cau_hoi.thematic', $thematic_id],
	            		['m_ket_qua_quiz_question.quiz_id', $quiz_id],
	            	])
	            ->get();

	    foreach($data_question as $key=>$value){
	    	$quiz_line = new DataQuiz();
	    	$quiz_line->quiz_id = $value->quiz_id;
	    	$quiz_line->question_id = $value->question_id;
	    	$quiz_line->type = $value->type;
	    	$quiz_line->name = $value->name;

	    	$answer_data = DB::table('m_cau_dap_an')
			            ->join('m_ket_qua_quiz_question', 'm_ket_qua_quiz_question.question_id','=','m_cau_dap_an.quesstion_id')
			            ->select('m_ket_qua_quiz_question.id',"m_ket_qua_quiz_question.question_id", 'm_cau_dap_an.name','m_cau_dap_an.stt','m_cau_dap_an.value','m_cau_dap_an.result','m_cau_dap_an.image')
			            ->where([
			            		['m_ket_qua_quiz_question.quiz_id', $quiz_id],
			            		['m_ket_qua_quiz_question.question_id', $value->question_id],
			            	])
			            ->get();
	    	if($answer_data->count() > 0){
	    		$arrAnswer = [];
	    		foreach($answer_data as $item){
		    		$arr = array(
		    			'answer_id'=>$item->id,
						'question_id'=>$item->question_id,
						'stt'=>$item->stt,
						'name'=>$item->name,
						'value'=>$item->value,
						'result'=>$item->result,
						'image'=>$item->image
					);
					array_push($arrAnswer,$arr);
	    		}
	    		$quiz_line->answer = $arrAnswer;
	    	}
	    	$question->prepend($quiz_line);
	    }
		return $question;
    }

    public static function getQuizData($thematic_id){
    	$question = new Collection();
    	$data_question = DB::table('m_cau_hoi')->select('id','name','type','answer')
	            ->where([
	            		['thematic', $thematic_id],
	            		['used', 0]
	            	])->inRandomOrder()->offset(5)->limit(5)->get();
	    foreach($data_question as $key=>$value){
	    	$answer_data = DB::table('m_cau_dap_an')
			            ->where([
			            		['question_id', $value->id],
			            	])
			            ->get();
	    	if($answer_data->count() > 0){
	    		$arrAnswer = [];
	    		foreach($answer_data as $item){
		    		$arr = array(
		    			'answer_id'=>$item->id,
						'question_id'=>$item->question_id,
						'stt'=>$item->stt,
						'name'=>$item->name,
						'value'=>$item->value,
						'result'=>$item->result,
						'image'=>$item->image
					);
					array_push($arrAnswer,$arr);
	    		}
	    		$quiz_line->answer = $arrAnswer;
	    	}
	    	$question->prepend($quiz_line);
	    }
		return $question;
    }

}