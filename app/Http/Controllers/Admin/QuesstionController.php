<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use DB; use Auth;
use App\Models\Subject;
use App\Models\Answer;
use App\Models\Course;
use App\Models\Thematic;
use App\Models\Quesstion;use Excel;
use App\Models\AnswerImport;
use App\Models\QuestionImport;
use App\Models\TempQuestion;
use App\Models\TempAnswer;
class QuesstionController  extends Controller
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

    public function getListQuiz(){
    	$data = Quesstion::where([
            ['status', 1],['used', 0] ])->get();
    	return view('admin.quesstion.list', compact('data'));
    }
    public function getListQuest(){
        $data = Quesstion::where([
            ['status', 1],['used', 1] ])->get();
        return view('admin.quesstion.list', compact('data'));
    }
    public function getAdd(){

    }

    public function postAdd(Request $request){

    }

    public function getAddByThematic($thematic){
    	$thematic_id = fdecrypt($thematic); 
    	return view('admin.quesstion.add_by_thematic', compact('thematic_id'));
    }

    public function postAddByThematic(Request $request, $thematic){
    	$thematic_id = fdecrypt($thematic); 
    	$course = Thematic::where('id',$thematic_id)->get();
    	try{
            DB::beginTransaction();
            $quesstion = new Quesstion();
            $quesstion->course = $course[0]->course;
            $quesstion->thematic = $thematic_id;
            $quesstion->name = $request->name;
			$quesstion->alias = makeUnicode($request->name);
			$quesstion->level = $request->level;
			$quesstion->type = $request->type;
			$quesstion->status = 1;
			$quesstion->used = $request->used;
			$quesstion->name = $request->name;
            $quesstion->answer = 0;
            $quesstion->user_id = Auth::user()->id;
            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = checkFolderImage();
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $quesstion->image = $destinationPath.'/'.$file_name;
                        $file->move($destinationPath, $file_name);
                    }
                }
            }
            $quesstion->save();
            $quesstion_id = $quesstion->id;
            foreach(Input::get('answer') as $i=>$answer_value ){
        			$answer = new Answer();
        			$answer->quesstion_id = $quesstion_id;
    	    		$answer->name = $answer_value;
    	    		$answer->alias = '';
    	    		$answer->value ='';
    	    		$answer->image = '';
    	    		$stt = $i+1;
                    $answer->stt = $stt;
                    if($request->result == $stt){
                        $answer->result = $stt;
                        DB::table('m_cau_hoi')
                            ->where('id', $quesstion->id)
                            ->update(['answer' => $stt]);
                    }else{
                        $answer->result = 0;
                    }
    	    		$answer->save();
    	   	}

            DB::commit();

            if($quesstion->used == 0){
                return redirect()->route('get.admin.quesstion.list.quiz')->with(['flash_message'=>'Thêm mới hỏi thành công']);
            }else{
                return redirect()->route('get.admin.quesstion.list.question')->with(['flash_message'=>'Thêm mới câu hỏi thành công']);
            }
        }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }

    public function getEdit($idd){
        $id = fdecrypt($idd); 
        $data = Quesstion::findOrFail($id)->toArray();
        $answer = Answer::where('quesstion_id', $id)->get();
        return view('admin.quesstion.edit', compact('data','answer','id'));
    }

    public function postEdit(Request $request, $idd){
        $id = fdecrypt($idd); 
        try{
            DB::beginTransaction();
            $quesstion = Quesstion::findOrFail($id);
            $old_img = $quesstion->image;

            $quesstion->name = $request->name;
            $quesstion->alias = makeUnicode($request->name);
            $quesstion->level = $request->level;
            $quesstion->type = $request->type;
            $quesstion->status = 1;
            $quesstion->used = $request->used;
            $quesstion->name = $request->name;
            $quesstion->user_id = Auth::user()->id;
            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = checkFolderImage();
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $quesstion->image = $destinationPath.'/'.$file_name;
                        $file->move($destinationPath, $file_name);
                        delete_image_no_path($img_old);
                    }
                }
            }
            $quesstion->save();
            $quesstion_id = $quesstion->id;
            foreach(Input::get('answer') as $i=>$answer_value ){
                $stt = $i+1;
                $result = 0;
                if($request->result == $stt){
                        $result = $stt;
                        DB::table('m_cau_hoi')
                            ->where('id', $quesstion->id)
                            ->update(['answer' => $result]);
                    }

                $update = [
                        'name' =>$answer_value,
                        'value'=>'',
                        'result' => $result
                    ];
                
                DB::table('m_cau_dap_an')->where([
                        ['quesstion_id', $quesstion_id],
                        ['stt', $i+1 ]
                    ])->update($update);
            }

            DB::commit();
            return redirect()->route('get.admin.quesstion.list.quiz')->with(['flash_message'=>'Chỉnh sửa thành công']);
        }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }

    public function getDelete($idd){
        $id = fdecrypt($idd); 
        $quesstion = Quesstion::findOrFail($id);
        if($quesstion->count() > 0){
            $quesstion->status = 0;
            $quesstion->save();
            if($quesstion->used == 0){
                return redirect()->route('get.admin.quesstion.list.quiz')->with(['flash_message'=>'Block câu hỏi thành công']);
            }else{
                return redirect()->route('get.admin.quesstion.list.question')->with(['flash_message'=>'Block câu hỏi thành công']);
            }
            
        }else{
            return back()->with(['flash_message'=>'Có lỗi dữ liệu, vui lòng thử lại']);
        }

    }

    public function getImportExcel($idd){
        $thematic_id = fdecrypt($idd);
        $thematic = Thematic::find($thematic_id);
        $data = TempQuestion::where('user_id', Auth::user()->id)->get();
        return view('admin.quesstion.import', compact('thematic','thematic_id', 'data'));
    }

    public function getImportUndo($idd){
        $thematic_id = fdecrypt($idd);
        DB::table('temp_questions')->where('user_id', Auth::user()->id)->delete();
        DB::table('temp_answer')->delete();
        return redirect()->route('get.admin.question.import', ['id'=>fencrypt($thematic_id)]);
    }

    public function postUploadExcel(Request $request, $idd){
        $user_id = Auth::user()->id;
        $file_name = '';
        $thematic_id = fdecrypt($idd);
         try{
            if($request->hasFile('fileExcel')){
                $file = Input::file('fileExcel');
                $destinationPath = env('APP_DIR_DATA_FILE');
                $file_name =  'tmp_import_question'.'.'.$file->getClientOriginalExtension();
                $file->move($destinationPath, $file_name);

                DB::beginTransaction();
                
                DB::table('temp_questions')->where('user_id', $user_id)->delete();
                DB::table('temp_answer')->delete();

                Excel::import(new QuestionImport(), $destinationPath.'/'.$file_name);
                Excel::import(new AnswerImport(), $destinationPath.'/'.$file_name);

                DB::commit();
                return back()->with(['flash_message'=>'Upload thành công']);
            }
        }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }
    public function postImportExcel(Request $request, $idd){
        $thematic_id = fdecrypt($idd); 
        try{

            $data_question = TempQuestion::where('result','>',0)->orderBy('question_id')->get();
            $thematic = Thematic::find($thematic_id);
            DB::beginTransaction();

            if($data_question->count() > 0){
                foreach($data_question as $key=>$item){
                    $dtaq = new Quesstion;
                    $dtaq->type = 'radio';
                    $dtaq->used = $item->used;
                    $dtaq->course = $thematic->course;
                    $dtaq->thematic = $thematic_id;
                    $dtaq->lesson = 0;
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
           return redirect()->route('get.admin.quesstion.list.question')->with(['flash_message'=>'Tạo mới thành công']);

        }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
        
        
    }

    
}