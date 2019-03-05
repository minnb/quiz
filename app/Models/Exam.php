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

    public static function insertTabkeQuiz($type, $course, $thematic, $lesson){
    	$heder_quiz_id = 0;
    	$info_exam = Exam::where([['type',$type],['status', 1]])->get();
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
			//$heder_quiz->total = $info_exam->number_quesstion;
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
        }catch (Exception $e) {
            DB::rollBack();
            return 0;
        }
    }

    public static function insertDetailQuiz($type, $quiz_id, $course, $thematic, $lesson = '', $level_question, $number){
    	$used = 1;
    	if($type == 'QUIZ') { $used = 0 ;}
    	
    	if($lesson == ''){
    		$question_data = Quesstion::where([
				['course', $course],
				['thematic', $thematic],
				['level', $number],
				['used', $used]
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
				['used', $used]
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
}