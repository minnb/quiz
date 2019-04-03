<?php
namespace App\Http\Controllers\Dashboard;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\User_Course;
use App\Models\Lesson;
use App\Models\Course;
use App\Models\Exam;
use App\Models\HeaderQuiz;
use App\Models\DetailQuiz;
use App\Models\Quesstion;use App\Models\Thematic;
use DB; use Session;
use Auth;use Mail;use App\Jobs\SendMailQuiz;
class QuizController extends Controller
{
    
	public function __construct()
    {
    	$this->middleware('quiz');
    }

    public function getTakeQuizByWeek($type_id, $course_id,$subject_id, $week_id, $token){
        $type = fdecrypt($type_id); 
        $course = fdecrypt($course_id); 
        $subject = fdecrypt($subject_id); 
        $week = fdecrypt($week_id); 
        $quiz_id = 0;
        try{

            $quiz_id = Exam::insertTabkeQuizWeek($type,$course, $subject, $week, $token);
            $question_data = Quesstion::getQuestionData($quiz_id)->toArray();

            if(count($question_data) > 0){
                return view('dashboard.quiz.quiz_week', compact('question_data', 'week','course','subject', 'type','quiz_id'));           
            }else{
                HeaderQuiz::where('total', 0)->delete();
                return back();
            }
        }catch(Exception $e){
            return back();
        }
    }

    public function getTakeQuiz($type, $course, $thematic, $lesson, $token){
    	$course_id = fdecrypt($course); 
    	$thematic_id = fdecrypt($thematic); 
    	$lesson_id = fdecrypt($lesson); 
    	$quiz_type = fdecrypt($type); 
        $quiz_id = 0;
    	try{
           
            $quiz_id = Exam::insertTabkeQuiz($quiz_type,$course_id, $thematic_id, $lesson_id, $token);
            $question_data = Quesstion::getQuestionData($quiz_id)->toArray();
            if(count($question_data) > 0){
                return view('dashboard.quiz.quiz', compact('question_data', 'id','course_id','thematic_id', 'quiz_type','quiz_id','lesson_id'));           
            }else{
                HeaderQuiz::where('total', 0)->delete();
                return back();
            }
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
                if($request->input('questions', [$key]) != null and $request->answer[$key] == true){
                    $result[$key] = $request->answer[$key];
                    DetailQuiz::where([
                        ['quiz_id', $quiz_id],
                        ['question_id', $question]
                    ])->update(['answer' => $request->answer[$key]]);
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

    public function postTakeQuizWeek(Request $request, $idd){
        $quiz_id = fdecrypt($idd); 
        $result = [];
        try{
            DB::beginTransaction();

            foreach ($request->input('questions', []) as $key => $question){
                if($request->input('questions', [$key]) != null and $request->answer[$key] == true){
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

        }catch(\Exception $e){
            DB::rollBack();
            return back();
        }       
    }

    public function getTakeQuizResult($idd){
        $quiz_id = fdecrypt($idd); 
        try{
            $data_result = HeaderQuiz::find($quiz_id);
            $point = calcPoint($data_result->total, $data_result->kq);
            $answer_result = DetailQuiz::where('quiz_id', $quiz_id)->orderBy('id')->get();
            $infoUser = User::find($data_result->user_id);
            $data_email =[
                'name'=> $infoUser->name,
                'email'=> $infoUser->email,
                'point' => $point,
                'subject'=> Thematic::find($data_result->thematic)->name,
                'result_header' => $data_result,
                'result_answer' => $answer_result 
            ];

           //$time = $request->time * 60 * 60;
           //dispatch(new SendMailQuiz($data_email))->delay(Carbon::now()->addMinutes(2));
           //SendMailQuiz::dispatch($data_email)->delay(now()->addMinutes(2));
            try{
                Mail::send('dashboard.email.result_quiz',['data'=>$data_email], function($message) use ($data_email){
                    $message->to($data_email['email'], $data_email['name'])->subject('Kết quả bài thi - '.$data_email['subject']);
                });
            }catch(\Exception $e){
                return view('dashboard.quiz.quiz_result', compact('data_result','answer_result','quiz_id','point'));
            }
            return view('dashboard.quiz.quiz_result', compact('data_result','answer_result','quiz_id','point'));
        }catch(\Exception $e){
            return back();
        }
        
    }

    public function getTakeQuizResultDetail($idd){
        $quiz_id = fdecrypt($idd); 
        try{
            $data_result = HeaderQuiz::find($quiz_id);
            $point = calcPoint($data_result->total, $data_result->kq);
            $answer_result = DetailQuiz::where('quiz_id', $quiz_id)->orderBy('id')->get(); 
            return view('dashboard.quiz.quiz_result', compact('data_result','answer_result','quiz_id','point'));
        }catch(\Exception $e){
            return back();
        }
        
    }

    public function getPractice(){
        try{
            $user_id = User::getInfoUser()['id'];
            $course = User_Course::getCourseByUserId($user_id);
            if($course->count()>0){
                return view('dashboard.quiz.practice', compact('course', 'user_id'));
            }else{
                return back();
            }
        }catch(\Exception $e){
            return back();
        }
    }

    public function getQuizData(){
        
    }
}