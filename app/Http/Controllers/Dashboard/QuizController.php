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
use App\Models\HeaderQuiz;use App\Models\JobSendEmail;
use App\Models\DetailQuiz;use App\Models\Subject;
use App\Models\Quesstion;use App\Models\Thematic;
use DB; use Session;
use Auth;use Mail;use App\Jobs\SendMailQuiz;
class QuizController extends Controller
{
    
	public function __construct()
    {
    	$this->middleware('auth');
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

    public function getTakeQuiz($type_, $course_, $thematic_, $lesson_, $token){
    	$course = fdecrypt($course_); 
    	$thematic = fdecrypt($thematic_); 
    	$lesson = fdecrypt($lesson_); 
    	$type = fdecrypt($type_); 
        $quiz_id = 0;
    	try{
           
            $quiz_id = Exam::insertTabkeQuiz($type,$course, $thematic, $lesson, $token);
            $question_data = Quesstion::getQuestionData($quiz_id)->toArray();
            if(count($question_data) > 0){
                return view('dashboard.quiz.quiz', compact('question_data', 'course','thematic', 'type','quiz_id','lesson'));           
            }else{
                HeaderQuiz::where('total', 0)->delete();
                return back();
            }
        }catch(Exception $e){
            return back();
        }
    }

    //Get question luyen thi theo chuyen de
    public function getTakeQuizByThematic($type_, $course_, $thematic_, $token){
        $course = fdecrypt($course_); 
        $thematic = fdecrypt($thematic_); 
        $type = fdecrypt($type_); 
        $quiz_id = 0;
        try{
           
            $quiz_id = Exam::insertTabkeQuizByThematic($type,$course, $thematic, $token);
            $question_data = Quesstion::getQuestionData($quiz_id)->toArray();
            if(count($question_data) > 0){
                return $question_data;
                //return view('dashboard.quiz.quiz_thematic', compact('question_data', 'course','thematic', 'type','quiz_id'));           
            }else{
                HeaderQuiz::where('total', 0)->delete();
                //return back();
            }
        }catch(Exception $e){
            return back();
        }
    }

    public function getExamPeriod($type_, $course_, $token){
        $course = fdecrypt($course_); 
        $type = fdecrypt($type_); 
        $quiz_id = 0;
        try{
           
            $quiz_id = Exam::insertTabkeQuizPeriod($type, $course, $token);
            $question_data = Quesstion::getQuestionData($quiz_id)->toArray();
            if(count($question_data) > 0){
                return $question_data;
                //return  view('dashboard.quiz.quiz_period', compact('question_data', 'course', 'type','quiz_id'));           
            }else{
                HeaderQuiz::where('total', 0)->delete();
                return back();
            }
        }catch(Exception $e){
            return back();
        }
    }

    //Nop bai thi quiz
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
            HeaderQuiz::insertQueeEmail('QUIZ',$quiz_id);
            //DB::table('w_job_send_email')->insert(['type'=>'QUIZ','quiz_id'=>$quiz_id, 'status'=>0]);
            DB::commit();
            return redirect()->route('get.dashboard.quiz.take.result', ['quiz_id'=>fencrypt($quiz_id)]);
          
            //return $request->all();
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
            HeaderQuiz::insertQueeEmail('TUAN',$quiz_id);
            //DB::table('w_job_send_email')->insert(['type'=>'TUAN','quiz_id'=>$quiz_id, 'status'=>0]);
            DB::commit();
            return redirect()->route('get.dashboard.week.take.result', ['quiz_id'=>fencrypt($quiz_id)]);

        }catch(\Exception $e){
            DB::rollBack();
            return back()->withInput();;
        }       
    }

    public function postExamPeriod(Request $request, $idd, $type_){
        $quiz_id = fdecrypt($idd); 
        $type = fdecrypt($type_); 
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
            HeaderQuiz::insertQueeEmail($type,$quiz_id);
            //DB::table('w_job_send_email')->insert(['type'=>$type,'quiz_id'=>$quiz_id, 'status'=>0]);
            DB::commit();
            return redirect()->route('get.dashboard.period.take.result', ['quiz_id'=>fencrypt($quiz_id)]);

        }catch(\Exception $e){
            DB::rollBack();
            return back()->withInput();;
        }       
    }

    public function getTakeWeekResult($idd){
        $quiz_id = fdecrypt($idd); 
        try{
            $data_result = HeaderQuiz::find($quiz_id);
            $point = calcPoint($data_result->total, $data_result->kq);
            $answer_result = DetailQuiz::where('quiz_id', $quiz_id)->orderBy('id')->get();
            
            return view('dashboard.quiz.result_week', compact('data_result','answer_result','quiz_id','point'));
        }catch(\Exception $e){
            return back()->withInput();
        }
    }
    public function getTakeQuizResult($idd){
        $quiz_id = fdecrypt($idd); 
        try{
            $data_result = HeaderQuiz::calcResultQuiz($quiz_id);
            //$data_result = HeaderQuiz::find($quiz_id);
            $point = calcPoint($data_result->total, $data_result->kq);
            $answer_result = DetailQuiz::where('quiz_id', $quiz_id)->orderBy('id')->get();
            
            return view('dashboard.quiz.result_quiz', compact('data_result','answer_result','quiz_id','point'));
        }catch(\Exception $e){
            return back()->withInput();;
        }
    }

     public function getTakePeriodResult($idd){
        $quiz_id = fdecrypt($idd); 
        try{
            $data_result = HeaderQuiz::find($quiz_id);
            $point = calcPoint($data_result->total, $data_result->kq);
            $answer_result = DetailQuiz::where('quiz_id', $quiz_id)->orderBy('id')->get();
            $period_name = Exam::where('type', $data_result->type)->get()[0]->name;
            return view('dashboard.quiz.result_period', compact('data_result','answer_result','quiz_id','point','period_name'));
        }catch(\Exception $e){
            return back()->withInput();;
        }
    }
    public function getTakeThematicResult($idd){
        $quiz_id = fdecrypt($idd); 
        try{
            $data_result = HeaderQuiz::find($quiz_id);
            $point = calcPoint($data_result->total, $data_result->kq);
            $answer_result = DetailQuiz::where('quiz_id', $quiz_id)->orderBy('id')->get();
            return view('dashboard.quiz.result_thematic', compact('data_result','answer_result','quiz_id','point'));
        }catch(\Exception $e){
            return back()->withInput();;
        }
    }
    /*
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
    */
    public function getPractice(){
        try{
            $user_id = User::getInfoUser()['id'];
            $course = User_Course::getCourseByUserId($user_id);
            if($course->count()>0){
                return view('dashboard.quiz.practice_new', compact('course', 'user_id'));
            }else{
                return back();
            }
        }catch(\Exception $e){
            return back();
        }
    }

    public function getTakeQuizAgain($idd){
        $quiz_id = fdecrypt($idd);
        $question_data = Quesstion::getQuestionData($quiz_id)->toArray();
        if(count($question_data) > 0){
            $check = HeaderQuiz::find($quiz_id);
            $lesson = $check->lesson;
            $type = $check->type;
            $course = $check->course;
            $thematic = $check->thematic;
            $subject = $check->subject;
            $week = $check->week;
            $period = $check->period;
            switch ($check->type){
                case 'QUIZ':
                    return view('dashboard.quiz.quiz', compact('question_data', 'course','thematic', 'type','quiz_id','lesson'));
                    break;
                case 'TUAN':
                    return view('dashboard.quiz.quiz_week', compact('question_data', 'week','course','subject', 'type','quiz_id'));           
                    break;
                case 'CHUYENDE':
                    return view('dashboard.quiz.quiz_thematic', compact('question_data', 'course','thematic', 'type','quiz_id'));           
                    break;
                default:
                    return view('dashboard.quiz.quiz_period', compact('question_data', 'course', 'type','quiz_id'));           
                    break;
            }
            if(substr($check->type, 0, 2) == 'HK'){
                return view('dashboard.quiz.quiz_period', compact('question_data', 'course', 'type','quiz_id'));           
            }
            
        }else{
            return back();
        }
    }

}