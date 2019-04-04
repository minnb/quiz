<?php
namespace App\Console\Commands;
use Illuminate\Console\Command;
use App\Models\User;
use App\Models\HeaderQuiz;use App\Models\JobSendEmail;
use App\Models\DetailQuiz;use App\Models\Subject;
use App\Models\Quesstion;use App\Models\Thematic;use App\Models\Lesson;
use DB; use Session;
use Auth;use Mail;use App\Jobs\SendMailQuiz;
class SendEmailCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:SendEmail';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Auto Send Email';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        DB::table('w_logs')->insert(['code' =>  'RUN','message' =>'Auto run send email']);
        
        $queue =  SendMailQuiz::where('status', 0)->orderBy('id')->limit(1)->get();
        $infoUser = User::find($data_quiz->user_id);
        $data_result = HeaderQuiz::find($queue[0]->quiz_id);
        $point = calcPoint($data_result->total, $data_result->kq);
        $answer_result = DetailQuiz::where('quiz_id', $queue[0]->quiz_id)->orderBy('id')->get();

        if($data_quiz->type == 'TUAN'){
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
                Mail::send('dashboard.email.email',['data'=>$data_email], function($message) use ($data_email){
                    $message->to($data_email['email'], $data_email['name'])->subject('Kết quả bài thi - '.$data_email['subject']);
                });
                SendMailQuiz::where('id',$queue[0]->id)->update(['status'=>1]);
                DB::commit();
            }catch(\Exception $e){
                DB::rollBack();
                DB::table('w_logs')->insert(['code' =>  'TUAN','message' => $e->getMessage()]);
            }
        }elseif ($data_quiz->type == 'QUIZ') {
            $data_email =[
                'name'=> $infoUser->name,
                'email'=> $infoUser->email,
                'point' => $data_quiz->point,
                'subject'=> Lesson::findOrFail($data_result->lesson)->name,
                'result_header' => $data_result,
                'result_answer' => $answer_result 
            ];
            try{
                DB::beginTransaction();
                Mail::send('dashboard.email.email',['data'=>$data_email], function($message) use ($data_email){
                    $message->to($data_email['email'], $data_email['name'])->subject('Kết quả bài thi - '.$data_email['subject']);
                });
                SendMailQuiz::where('id',$queue[0]->id)->update(['status'=>1]);
                DB::commit();
            }catch(\Exception $e){
                DB::rollBack();
                DB::table('w_logs')->insert(['code' =>  'TUAN','message' => $e->getMessage()]);
            }
        }

    }
}

