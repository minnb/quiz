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
        $quiz_id = 0;
    	try{
            $check = HeaderQuiz::where([
                    ['lesson', $id],
                    ['success', 0],
                    ['user_id', User::getInfoUser()['id']]
                ])->get();

            if($check->count() > 0){
                DetailQuiz::where('quiz_id', $check[0]->id)->delete();
                HeaderQuiz::where([
                    ['lesson', $id],
                    ['success', 0],
                    ['user_id', User::getInfoUser()['id']]
                ])->delete();
                
                $quiz_id = Exam::insertTabkeQuiz($quiz_type,$course_id, $thematic_id, $id);
            }else{
                $quiz_id = Exam::insertTabkeQuiz($quiz_type,$course_id, $thematic_id, $id);
            }
            /*
            if( $quiz_id > 0){
                $question_data = Quesstion::getQuestionData($thematic_id, $quiz_id)->toArray();
            }
            */
            $question_data = Quesstion::getQuestionData($thematic_id, $quiz_id)->toArray();
            if(count($question_data) > 0){
                return view('dashboard.quiz.quiz', compact('question_data', 'id','course_id','thematic_id', 'quiz_type','quiz_id'));           
            }else{
                HeaderQuiz::where('total', 0)->delete();
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

    public function postTakeQuizDetail(Request $request, $idd){
    	$quiz_id = fdecrypt($idd); 
        $result = [];
        try{
            DB::beginTransaction();

            foreach ($request->input('questions', []) as $key => $question){
                if($request->input('questions', [$key]) != null){
                    $result[$key] = $request->answer[$key];
                    DetailQuiz::where('quiz_id', $quiz_id)
                        ->where('question_id', $question)
                        ->update(['answer' => $request->answer[$key]]);
                }               
            }

            HeaderQuiz::where('id', $quiz_id)->update(['status' => 1]);
            HeaderQuiz::calcResultQuiz($quiz_id);
            DB::commit();
            return redirect()->route('get.dashboard.quiz.take.result', ['quiz_id'=>fencrypt($quiz_id)]);

        }catch(Exception $e){
            DB::rollBack();
            return back();
        }       
    }

    public function getTakeQuizResult($idd){
        $quiz_id = fdecrypt($idd); 
        try{
            $data_result = HeaderQuiz::find($quiz_id);
            $point = calcPoint($data_result->total, $data_result->kq);
            $answer_result = DetailQuiz::where('quiz_id', $quiz_id)->get();
            return view('dashboard.quiz.quiz_result', compact('data_result','answer_result','quiz_id','point'));
        }catch(Exception $e){
            return back();
        }
        
    }

    public function getPractice(){
        try{
            $user_id = User::getInfoUser()['id'];
            $course_code = User_Course::getCourseByUserId($user_id)[0]->course;
            $lessonOfUser = User_Course::getLessonByUser(User::getInfoUser()['id']);
            return view('dashboard.quiz.practice', compact('course_code', 'user_id', 'lessonOfUser'));
        }catch(Exception $e){
            return back();
        }
    }

    public function getQuizData(){
        
    }
}