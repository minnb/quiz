<?php
namespace App\Http\Controllers\Dashboard;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\User_Course;
use App\Models\Lesson;
use App\Models\Course;
use App\Models\Exam;
use App\Models\HeaderQuiz;
use App\Models\DetailQuiz;
use App\Models\Quesstion;
use DB; use Session;
use Auth;
class QuizController extends Controller
{
    
	public function __construct()
    {
    	$this->middleware('quiz');
    }

    public function getTakeQuiz($type, $course, $thematic, $idd){
    	$course_id = fdecrypt($course); 
    	$thematic_id = fdecrypt($thematic); 
    	$id = fdecrypt($idd); 
    	$quiz_type = fdecrypt($type); 
    	try{
    		$quiz_id = Exam::insertTabkeQuiz($quiz_type,$course_id, $thematic_id, $id);
    		if( $quiz_id > 0){
				$question_data = Quesstion::getQuestionData($thematic_id, $quiz_id);
	           	return view('dashboard.quiz.quiz', compact('question_data', 'id','course_id','thematic_id', 'quiz_type'));
    		}else{
    			return back();
    		}
            
        }catch(Exception $e){
            return back();
        }
    }

    public function getTakeQuizDetail($idd, $question){
    	$quiz_id = fdecrypt($idd); 
    	$question_id = fdecrypt($question); 
    	try{
            $question_data = '';
            return view('dashboard.quiz.take_quiz', compact('question_data', 'id'));
        }catch(Exception $e){
            return back();
        } 
    }

    public function postTakeQuizDetail(Request $request, $idd, $question){
    	$quiz_id = fdecrypt($idd); 
    	$question_id = fdecrypt($question); 

    }

}