<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use App\Models\Exam;
use App\Models\Quesstion;
use App\Models\HeaderQuiz;
use DB;
class DataQuiz extends Model
{
	 protected $table ="m_template_quiz";
	 public $timestamps = false;

	public static function getTakeQuiz($type, $course, $thematic, $lesson, $token){
        $quiz_id = 0;
    	try{
            $quiz_id = Exam::insertTabkeQuiz($type,$course, $thematic, $lesson, $token);
            $question_data = Quesstion::getQuestionData($quiz_id)->toArray();
            if(count($question_data) > 0){
          		$id = $question_data['quiz_id'];
            }else{
                HeaderQuiz::where('total', 0)->delete();
                return back();
            }
        }catch(Exception $e){
            return back();
        }
        return $quiz_id;
    }
}