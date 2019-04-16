<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\HeaderQuiz;use App\Models\JobSendEmail;
use App\Models\DetailQuiz;use App\Models\Subject;
use App\Models\Quesstion;use App\Models\Thematic;use App\Models\Lesson;
use DB; use Session;
use Auth;use Mail;
use App\Jobs\SendMailQuiz;use App\Models\Exam;
class SystemController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function getLogs()
    {
        $data = DB::table('w_logs')->orderBy('id','DESC')->limit(500)->get();
        return view('admin.system.logs', compact('data'));
    }

    public function getJobSendEmail(){

        $data = DB::table('w_job_send_email')
                ->join('m_ket_qua_quiz', 'm_ket_qua_quiz.id','=','w_job_send_email.quiz_id')
                ->join('users', 'users.id','=','m_ket_qua_quiz.user_id')
                ->select('w_job_send_email.*', 'users.email', 'users.name')
                ->orderBy('w_job_send_email.id', 'DESC')->limit(500)->get();
        return view('admin.system.job_send_email', compact('data'));   
    }

    public function getManualSendEmail($idd){
        $quiz_id = fdecrypt($idd);

        $queue =  DB::table('w_job_send_email')->where([['status', 0],['quiz_id', $quiz_id]])->orderBy('id')->limit(1)->get();
        $data_result = HeaderQuiz::find($queue[0]->quiz_id);
        $infoUser = User::find($data_result->user_id);     
        $point = calcPoint($data_result->total, $data_result->kq);
        $answer_result = DetailQuiz::where('quiz_id', $queue[0]->quiz_id)->orderBy('id')->get();

        if($data_result->type == 'TUAN'){
            $data_email =[
                'name'=> $infoUser->name,
                'email'=> $infoUser->email,
                'point' => $point,
                'subject'=> Subject::findOrFail($data_result->subject)->name. '- Tuần '.$data_result->week,
                'result_header' => $data_result,
                'result_answer' => $answer_result 
            ];
            try{
                DB::beginTransaction();
                Mail::send('dashboard.email.result_week',['data'=>$data_email], function($message) use ($data_email){
                    $message->to($data_email['email'], $data_email['name'])->subject('Kết quả bài thi - '.$data_email['subject']);
                });
                DB::table('w_job_send_email')->where('id',$queue[0]->id)->update(['status'=>1]);
                DB::commit();
            }catch(\Exception $e){
                DB::rollBack();
                DB::table('w_logs')->insert(['code' =>  'TUAN','message' => $e->getMessage()]);
                return back()->withErrors('Có lỗi xảy ra, gửi mail không thành công');
            }
        }elseif ($data_result->type == 'QUIZ') {
            $data_email =[
                'name'=> $infoUser->name,
                'email'=> $infoUser->email,
                'point' => $point,
                'subject'=> Lesson::findOrFail($data_result->lesson)->name,
                'result_header' => $data_result,
                'result_answer' => $answer_result 
            ];
            try{
                DB::beginTransaction();
                Mail::send('dashboard.email.result_quiz',['data'=>$data_email], function($message) use ($data_email){
                    $message->to($data_email['email'], $data_email['name'])->subject('Kết quả bài thi - '.$data_email['subject']);
                });
                DB::table('w_job_send_email')->where('id',$queue[0]->id)->update(['status'=>1]);
                DB::commit();
            }catch(\Exception $e){
                DB::rollBack();
                DB::table('w_logs')->insert(['code' =>  'TUAN','message' => $e->getMessage()]);
                return back()->withErrors('Có lỗi xảy ra, gửi mail không thành công');
            }
        }elseif(substr($data_result->type,0,2) == 'HK') {
            $data_email =[
                'name'=> $infoUser->name,
                'email'=> $infoUser->email,
                'point' => $point,
                'subject'=> Exam::where('type', $data_result->type)->get()[0]->name,
                'result_header' => $data_result,
                'result_answer' => $answer_result 
            ];
            try{
                DB::beginTransaction();
                Mail::send('dashboard.email.result_period',['data'=>$data_email], function($message) use ($data_email){
                    $message->to($data_email['email'], $data_email['name'])->subject('Kết quả bài thi - '.$data_email['subject']);
                });
                DB::table('w_job_send_email')->where('id',$queue[0]->id)->update(['status'=>1]);
                DB::commit();
            }catch(Exception $e){
                DB::rollBack();
                DB::table('w_logs')->insert(['code' => $data_result->type,'message' => $e->getMessage()]);
            }
        }elseif($data_result->type == 'CHUYENDE') {
            $data_email =[
                'name'=> $infoUser->name,
                'email'=> $infoUser->email,
                'point' => $point,
                'subject'=> Thematic::find($data_result->thematic)->name,
                'result_header' => $data_result,
                'result_answer' => $answer_result 
            ];
            try{
                DB::beginTransaction();
                Mail::send('dashboard.email.result_thematic',['data'=>$data_email], function($message) use ($data_email){
                    $message->to($data_email['email'], $data_email['name'])->subject('Kết quả bài thi chuyên đề - '.$data_email['subject']);
                });
                DB::table('w_job_send_email')->where('id',$queue[0]->id)->update(['status'=>1]);
                DB::commit();
            }catch(Exception $e){
                DB::rollBack();
                DB::table('w_logs')->insert(['code' => $data_result->type,'message' => $e->getMessage()]);
            }
        }
        return back()->withErrors('Gửi mail thành công');        
    }
}
