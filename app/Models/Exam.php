<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;
use App\Models\User;
use App\Models\Course;
use App\Models\Quesstion;
use App\Models\HeadeQuiz;
use App\Models\DetailQuiz;
class Exam extends Model
{
    protected $table ="m_exam";

    public static function insertTabkeQuizWeek($type, $course, $subject, $week, $token){
    	$heder_quiz_id = 0;
    	$info_exam = Exam::where([['type',$type],['status', 1]])->get();
    	$check = DB::table('m_ket_qua_quiz')->where('token', $token)->get();
    	$thematic = Thematic::where([
    		['week', $week],
    		['subject', $subject]
    	])->get()[0]->id;

    	if($check->count() == 0 ){
	    	try{
	            DB::beginTransaction();
	            $heder_quiz = new HeaderQuiz();
	            $heder_quiz->type = $type;
	            $heder_quiz->user_id = User::getInfoUser()['id'];
	            $heder_quiz->result = 0;
	            $heder_quiz->description = '';
	            $heder_quiz->comment = $type;
	            $heder_quiz->course = $course;
	            $heder_quiz->thematic = 0;
	            $heder_quiz->lesson = 0;
				$heder_quiz->status = 0;
				$heder_quiz->success = 0;
				$heder_quiz->kq = 0;
				$heder_quiz->week = $week;
				$heder_quiz->periods = 0;
				$heder_quiz->subject = $subject;
				$heder_quiz->token = $token;
				$heder_quiz->save();
				$heder_quiz_id = $heder_quiz->id;
				$lesson = '';
				Exam::insertDetailQuiz($type, $heder_quiz_id, $course, $thematic, $lesson, $info_exam[0]->lv1, 1);
				Exam::insertDetailQuiz($type, $heder_quiz_id, $course, $thematic, $lesson, $info_exam[0]->lv2, 2);
				Exam::insertDetailQuiz($type, $heder_quiz_id, $course, $thematic, $lesson, $info_exam[0]->lv3, 3);
				Exam::insertDetailQuiz($type, $heder_quiz_id, $course, $thematic, $lesson, $info_exam[0]->lv4, 4);

				$total = DetailQuiz::where('quiz_id', $heder_quiz_id)->get();
				HeaderQuiz::where('id', $heder_quiz_id)->update(['total'=>$total->count()]);

	            DB::commit();
	            return $heder_quiz_id;
	        }catch (Exception $e) {
	            DB::rollBack();
	            return 0;
	        }
        }else{
        	return $check[0]->id;
        }
    }

    public static function insertTabkeQuiz($type, $course, $thematic, $lesson, $token){
    	$heder_quiz_id = 0;
    	$info_exam = Exam::where([['type',$type],['status', 1]])->get();
    	$check = DB::table('m_ket_qua_quiz')->where('token', $token)->get();
    	if($check->count() == 0){
	    	try{
	            DB::beginTransaction();
	            $heder_quiz = new HeaderQuiz();
	            $heder_quiz->type = $type;
	            $heder_quiz->user_id = User::getInfoUser()['id'];
	            $heder_quiz->result = 0;
	            $heder_quiz->description = '';
	            $heder_quiz->comment = $type;
	            $heder_quiz->course = $course;
	            $heder_quiz->thematic = $thematic;
	            $heder_quiz->lesson = $lesson;
				$heder_quiz->status = 0;
				$heder_quiz->success = 0;
				$heder_quiz->kq = 0;
				$heder_quiz->week = 0;
				$heder_quiz->periods = 0;
				$heder_quiz->subject = Subject::getSubjectIdByThematic($thematic);
				$heder_quiz->token = $token;
				$heder_quiz->save();
				$heder_quiz_id = $heder_quiz->id;

				Exam::insertDetailQuiz($type, $heder_quiz_id, $course, $thematic, $lesson, $info_exam[0]->lv1, 1);
				Exam::insertDetailQuiz($type, $heder_quiz_id, $course, $thematic, $lesson, $info_exam[0]->lv2, 2);
				Exam::insertDetailQuiz($type, $heder_quiz_id, $course, $thematic, $lesson, $info_exam[0]->lv3, 3);
				Exam::insertDetailQuiz($type, $heder_quiz_id, $course, $thematic, $lesson, $info_exam[0]->lv4, 4);

				$total = DetailQuiz::where('quiz_id', $heder_quiz_id)->get();
				HeaderQuiz::where('id', $heder_quiz_id)->update(['total'=>$total->count()]);

	            DB::commit();
	            return $heder_quiz_id;
	        }catch (\Exception $e) {
	            DB::rollBack();
	            return 0;
	        }
	    }else{
        	return $check[0]->id;
        }
    }

    public static function insertTabkeQuizPeriod($type, $course, $token){
    	$heder_quiz_id = 0;
    	$info_exam = Exam::where([['type',$type],['status', 1]])->get();
    	$check = DB::table('m_ket_qua_quiz')->where('token', $token)->get();
    	if($check->count() == 0){
	    	try{
	            DB::beginTransaction();
	            $heder_quiz = new HeaderQuiz();
	            $heder_quiz->type = $type;
	            $heder_quiz->user_id = User::getInfoUser()['id'];
	            $heder_quiz->result = 0;
	            $heder_quiz->description = '';
	            $heder_quiz->comment = $type;
	            $heder_quiz->course = $course;
	            $heder_quiz->thematic = 0;
	            $heder_quiz->lesson = 0;
				$heder_quiz->status = 0;
				$heder_quiz->success = 0;
				$heder_quiz->kq = 0;
				$heder_quiz->week = 0;
				$heder_quiz->periods = substr($type, 2, 2);
				$heder_quiz->subject = 0;
				$heder_quiz->token = $token;
				$heder_quiz->save();
				$heder_quiz_id = $heder_quiz->id;

				Exam::insertDetailQuizPeriod($heder_quiz_id, $course, $info_exam[0]->from_week, $info_exam[0]->to_week, $info_exam[0]->lv4, 4);
				Exam::insertDetailQuizPeriod($heder_quiz_id, $course, $info_exam[0]->from_week, $info_exam[0]->to_week, $info_exam[0]->lv3, 3);
				Exam::insertDetailQuizPeriod($heder_quiz_id, $course, $info_exam[0]->from_week, $info_exam[0]->to_week, $info_exam[0]->lv2, 2);
				Exam::insertDetailQuizPeriod($heder_quiz_id, $course, $info_exam[0]->from_week, $info_exam[0]->to_week, $info_exam[0]->lv1, 1);		

				$total = DetailQuiz::where('quiz_id', $heder_quiz_id)->get();
				HeaderQuiz::where('id', $heder_quiz_id)->update(['total'=>$total->count()]);

	            DB::commit();
	            return $heder_quiz_id;
	        }catch (\Exception $e) {
	            DB::rollBack();
	            return 0;
	        }
	    }else{
        	return $check[0]->id;
        }
    }

    public static function insertDetailQuiz($type, $quiz_id, $course, $thematic, $lesson = '', $level_question, $number){
    	$used = 1;
    	if($type == 'QUIZ') { $used = 0 ;}
    	
    	if($lesson == '' || $lesson == '0'){
    		$question_data = Quesstion::where([
				['course', $course],
				['thematic', $thematic],
				['level', $number],
				['used', $used],
				['status', 1]
			])->inRandomOrder()->limit($level_question)->get();
			if($question_data->count() > 0 ){
	    		foreach ($question_data as $key => $value) {
					$detail_quiz = new DetailQuiz();
					$detail_quiz->quiz_id = $quiz_id;
					$detail_quiz->question_id = $value->id;
					$detail_quiz->answer = 0;
					$detail_quiz->comment = '';
					$detail_quiz->result = $value->answer;
					$detail_quiz->answer_time = 0;
					$detail_quiz->save();
				}
			}
		}else{
			$question_data = Quesstion::where([
				['course', $course],
				['thematic', $thematic],
				['lesson', $lesson],
				['level', $number],
				['used', $used],
				['status', 1]
			])->inRandomOrder()->limit($level_question)->get();
			if($question_data->count() > 0 ){
	    		foreach ($question_data as $key => $value) {
					$detail_quiz = new DetailQuiz();
					$detail_quiz->quiz_id = $quiz_id;
					$detail_quiz->question_id = $value->id;
					$detail_quiz->answer = 0;
					$detail_quiz->comment = '';
					$detail_quiz->result = $value->answer;
					$detail_quiz->answer_time = 0;
					$detail_quiz->save();
				}
    		}
		}
		return 0;
    }
    public static function insertDetailQuizPeriod($quiz_id, $course, $from, $to, $level_question, $number){
        for($i = 1; $i <= $level_question; $i++){
        	$thematic = DB::table('m_chuyen_de')->where('course', $course)
                    ->whereBetween('week', [$from, $to])->inRandomOrder()->limit(1)->get();

    		$question_data = Quesstion::where([
				['course', $course],
				['level', $number],
				['thematic', $thematic[0]->id],
				['used', 1],
				['status', 1]
			])->inRandomOrder()->limit(1)->distinct()->get();

			$detail_quiz = new DetailQuiz();
			$detail_quiz->quiz_id = $quiz_id;
			$detail_quiz->question_id = $value->id;
			$detail_quiz->answer = 0;
			$detail_quiz->comment = '';
			$detail_quiz->result = $value->answer;
			$detail_quiz->answer_time = 0;
			$detail_quiz->save();
			
			/*
			if($question_data->count() > 0 ){
	    		foreach ($question_data as $key => $value) {
					$detail_quiz = new DetailQuiz();
					$detail_quiz->quiz_id = $quiz_id;
					$detail_quiz->question_id = $value->id;
					$detail_quiz->answer = 0;
					$detail_quiz->comment = '';
					$detail_quiz->result = $value->answer;
					$detail_quiz->answer_time = 0;
					$detail_quiz->save();
				}
    		}
    		*/
    	}

    	return 0;
    }

    public static function getWeeks($course){
    	$data = Thematic::where([
    		['course', $course],
    		['week','<>', ''],
    		['status', 1]
    	])->select('subject','week')->groupBy('subject','week')->get();
    	return $data;
    }

    public static function getPeriod($type){
    	$data = Exam::where([
    		['type', $type],
    		['status', 1]
    	])->get();
    	return $data;
    }
}