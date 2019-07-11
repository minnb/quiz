<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use DB;use Auth;use Excel;
use App\Models\Subject;
use App\Models\TempQuestion;
use App\Models\QuestionImport;
use App\Models\AnswerImport;
use App\Models\Quesstion;
use App\Models\TempAnswer;
use App\Models\Answer;
use App\Models\Exam;use App\Models\Week;
class ExamController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('admin');
    }

    public function getList(){
    	$data = Exam::orderby('type')->get();
    	return view('admin.exam.list', compact('data'));
    }

    public function getAdd(){
    	return view('admin.exam.add');
    }

    public function postAdd(Request $request){
    	try{
            DB::beginTransaction();
            $exam = new Exam();
            $exam->type = $request->type;
			$exam->name = $request->name;
			$exam->alias = makeUnicode($request->name);
			$exam->description = $request->description;
			$exam->work_time = $request->work_time;
			$exam->number_quesstion = $request->number_quesstion;
			$exam->lv1 = $request->lv1;
			$exam->lv2 = $request->lv2;
			$exam->lv3 = $request->lv3;
			$exam->lv4 = $request->lv4;
			$exam->status = 1;
            $exam->user_id = Auth::user()->id;
            $total = $request->lv1 + $request->lv2 + $request->lv3 + $request->lv4;
            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = checkFolderImage();
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $exam->image = $destinationPath.'/'.$file_name;
                        $file->move($destinationPath, $file_name);
                    }
                }
            }
            if($total == $request->number_quesstion){
            	$exam->save();
            }else{
            	return back()->withErrorss('Số lượng câu hỏi không bằng nhau')->withInput();
            }
            DB::commit();
            return redirect()->route('get.admin.exam.list')->with(['flash_message'=>'Tạo mới thành công']);
         }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }

    public function getEdit($idd){
    	$id = fdecrypt($idd); 
    	$data = Exam::find($id)->toArray();
    	return view('admin.exam.edit', compact('id','data'));
    }

     public function postEdit(Request $request, $idd){
     	$id = fdecrypt($idd); 
    	try{
            DB::beginTransaction();
            $exam = Exam::findOrFail($id);
            $img_old = $exam->image;
            //$exam->type = $request->type;
			$exam->name = $request->name;
			$exam->alias = ""; // makeUnicode($request->name);
			$exam->description = $request->description;
			$exam->work_time = $request->work_time;
			$exam->lv1 = $request->lv1;
			$exam->lv2 = $request->lv2;
			$exam->lv3 = $request->lv3;
			$exam->lv4 = $request->lv4;
			$exam->number_quesstion = $request->lv1 + $request->lv2 + $request->lv3 + $request->lv4;
            $exam->user_id = Auth::user()->id;
            $exam->image = "";
            $exam->from_week = $request->from_week;
            $exam->to_week = $request->to_week;
            /*
            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = checkFolderImage();
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $exam->image = $destinationPath.'/'.$file_name;
                        $file->move($destinationPath, $file_name);
                        delete_image_no_path($img_old);
                    }
                }
            }
            
            $total = $request->lv1 + $request->lv2 + $request->lv3 + $request->lv4;
            if($total == $request->number_quesstion){
            	$exam->save();
            }else{
            	return back()->withErrorss('Số lượng câu hỏi không bằng nhau')->withInput();
            }
            */
            $exam->save();
            DB::commit();
            return redirect()->route('get.admin.exam.list')->with(['flash_message'=>'Chỉnh sửa thành công']);
         }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }

    public function getDelete($idd){
    	$id = fdecrypt($idd); 
    	try{
            $exam = Exam::findOrFail($id);
            $exam->status = 0;
            $exam->save();
            return back()->with(['flash_message'=>'Xoá thành thành công']);
        }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }

    public function getWeeks(){
        $data = Week::orderby('id')->get();
        return view('admin.exam.week', compact('data'));
    }

    public function getEditWeeks($idd){
        $id = fdecrypt($idd); 
        $data = Week::findOrFail($id);
        return view('admin.exam.edit_week', compact('id', 'data'));
    }

    public function postEditWeeks(Request $request, $idd){
        $id = fdecrypt($idd); 
        try{
            $data = Week::findOrFail($id);
            $data->to_date = convertDateTo2Char($request->singledatepicker2,'-');
            $data->from_date = convertDateTo2Char($request->singledatepicker1,'-');
            $data->save();
            return redirect()->route('get.admin.exam.weeks')->with(['flash_message'=>'Chỉnh sửa thành công']);
        }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }

    public function createWeek(){
        for($i=1; $i<=35; $i++){
            $a = new Week();
            $a->name = 'Tuần '.$i;
            $a->code = '';
            $a->lesson = '';
            $a->save();
        }
        return 0;
    }

    public function getExamImportExcel(){
        try {
            $data = Exam::where('type','like','HK%')->orderBy('type')->get();
            return view('admin.exam.exam_list', compact('data'));
        } catch (Exception $e) {
            return back()->withErrors($e->getMessage())->withInput();
        }
    }

    public function getPageExamImportExcel($course, $types){
        $type = fdecrypt($types);
        try {
            $exam_data = Exam::where('type', $type)->get();
            $data =TempQuestion::where('user_id', Auth::user()->id)->get();
            return view('admin.exam.import_quiz_by_hk', compact('type','exam_data','data','course'));              
        } catch (\Exception $e) {
            return back()->withErrors($e->getMessage())->withInput();
        }
    }

    public function postPageExamImportExcel(Request $request,$course, $types){
        $type = fdecrypt($types);
        $user_id = Auth::user()->id;
        $file_name = '';
         try{
            if($request->hasFile('fileExcel')){
                $file = Input::file('fileExcel');
                $destinationPath = public_path().env('APP_DIR_DATA_FILE');
                $file_name =  'tmp_import_question'.'.'.$file->getClientOriginalExtension();
               
                $file->move($destinationPath, $file_name);

                DB::beginTransaction();
                
                DB::table('temp_questions')->where('user_id', Auth::user()->id)->delete();
                DB::table('temp_answer')->where('user_id', Auth::user()->id)->delete();
                Excel::import(new QuestionImport(), $destinationPath.'/'.$file_name);
                Excel::import(new AnswerImport() , $destinationPath.'/'.$file_name);
                DB::commit();
                return back()->with(['flash_message'=>'Upload thành công']);
            }
        }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        } 
    }
    
    public function postDataExamImportExcel(Request $request,$course, $types){
        $type = fdecrypt($types);
        try{
            $data_question = TempQuestion::select('question_id')->groupby('question_id')->get();
            DB::beginTransaction();
            if($data_question->count() > 0){
                foreach($data_question as $key=>$item){
                    $data_ins = TempQuestion::where('question_id', $item->question_id)->get();
                    if($data_ins->count() > 0){
                        $dtaq = new Quesstion;
                        $dtaq->type = getTypeQuestion($data_ins[0]->style);;
                        $dtaq->used = $data_ins[0]->used;
                        $dtaq->course = $course;
                        $dtaq->thematic = 0;
                        $dtaq->lesson = 0;
                        $dtaq->name = $data_ins[0]->question;
                        $dtaq->alias = '';
                        $dtaq->image = '';
                        $dtaq->level = $data_ins[0]->level;
                        $dtaq->status = 1;
                        $dtaq->answer = $data_ins[0]->result;
                        $dtaq->user_id = Auth::user()->id;
                        $dtaq->quiz = $type;
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
            }           
            DB::table('temp_questions')->where('user_id', Auth::user()->id)->delete();
            DB::table('temp_answer')->where('user_id', Auth::user()->id)->delete();
            DB::commit();
           return redirect()->route('get.admin.exam.import.list')->with(['flash_message'=>'Import câu hỏi thành công']);
        }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }

    public function getUndoExamImportExcel($types){
        $type = fdecrypt($types);
        try {
            DB::beginTransaction();
                DB::table('temp_questions')->where('user_id', Auth::user()->id)->delete();
                DB::table('temp_answer')->where('user_id', Auth::user()->id)->delete();
            DB::commit();
            return redirect()->route('get.admin.exam.import.excel',['type'=>fencrypt($type)])->with(['flash_message'=>'Xóa dữ liệu thành công']);     
        } catch (\Exception $e) {
            B::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }
}