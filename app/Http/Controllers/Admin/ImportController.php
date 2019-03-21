<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use DB;
use Auth;
use App\Models\Lesson;
use App\Models\Answer;
use App\Models\Course;
use App\Models\Thematic;
use App\Models\Quesstion;use Excel;
use App\Models\AnswerImport;
use App\Models\QuestionImport;
use App\Models\TempQuestion;
use App\Models\TempAnswer;
class ImportController extends Controller
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

    public function getImportQuizByLesson($lesson){
    	$lesson_id = fdecrypt($lesson); 
    	$data = TempQuestion::where('user_id', Auth::user()->id)->get();
    	return view('admin.quesstion.import_quiz_by_lesson', compact('lesson_id', 'data'));
    }
    public function getUndoQuizByLesson($lesson){
        $lesson_id = fdecrypt($lesson); 
        DB::table('temp_questions')->where('user_id', Auth::user()->id)->delete();
        DB::table('temp_answer')->delete();
        return redirect()->route('get.admin.import.quiz.lesson', ['id'=>fencrypt($lesson_id)]);
    }

    public function postImportQuizByLesson(Request $request, $lesson){
    	$lesson_id = fdecrypt($lesson); 
        $file_name = '';
         try{
            if($request->hasFile('fileExcel')){
                $file = Input::file('fileExcel');
                $destinationPath = env('APP_DIR_DATA_FILE');
                $file_name =  'tmp_import_quiz'.'.'.$file->getClientOriginalExtension();
                $file->move($destinationPath, $file_name);

                DB::beginTransaction();
                
                DB::table('temp_questions')->where('user_id', Auth::user()->id)->delete();
                DB::table('temp_answer')->delete();

                Excel::import(new QuestionImport(), $destinationPath.'/'.$file_name);
                Excel::import(new AnswerImport(), $destinationPath.'/'.$file_name);

                DB::commit();
                return back()->with(['flash_message'=>'Upload thành công']);
            }
        }catch (Exception $e) {
            DB::rollBack();
            return back()->withError($e->getMessage())->withInput();
        }
    }

    public function postDataQuizByLesson(Request $request, $lesson){
    	$lesson_id = fdecrypt($lesson); 
        $lesson = Lesson::find($lesson_id);
        try{

            $data_question = TempQuestion::where('result','>',0)->orderBy('question_id')->get();
            DB::beginTransaction();

            if($data_question->count() > 0){
                foreach($data_question as $key=>$item){
                    $dtaq = new Quesstion;
                    $dtaq->type = 'radio';
                    $dtaq->used = $item->used;
                    $dtaq->course = $lesson->course;
                    $dtaq->thematic = $lesson->thematic;
                    $dtaq->lesson = $lesson->id;
                    $dtaq->name = $item->question;
                    $dtaq->alias = '';
                    $dtaq->image = '';
                    $dtaq->level = $item->level;
                    $dtaq->status = 1;
                    $dtaq->answer = $item->result;
                    $dtaq->user_id = Auth::user()->id;
                    $dtaq->save();
                    $q_id = $dtaq->id;

                    $data_answer = TempAnswer::where('question_id', $item->question_id)->orderBy('stt')->get();
                    if($data_answer->count() > 0){
                        foreach($data_answer as $key=>$value){
                            $dtAnswer = new Answer;
                            $dtAnswer->stt = $value->stt;
                            $dtAnswer->quesstion_id = $q_id ;
                            $dtAnswer->name = $value->answer;
                            $dtAnswer->alias ='';
                            $dtAnswer->value ='';
                            $dtAnswer->result = $value->result;
                            $dtAnswer->image ='';
                            $dtAnswer->save();
                        }
                    }
                }
            }
            
            DB::table('temp_questions')->where('user_id', Auth::user()->id)->delete();
            DB::table('temp_answer')->delete();

            DB::commit();
           return redirect()->route('get.admin.quesstion.list.quiz')->with(['flash_message'=>'Tạo mới thành công']);

        }catch (Exception $e) {
            DB::rollBack();
            return back()->withError($e->getMessage())->withInput();
        }
    }
}