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
use App\Models\Quesstion;
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

    public function getList(){
    	$data = Quesstion::where('status', 1)->get();
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
    	    		$answer->result = $request->result;
    	    		$answer->image = '';
    	    		$stt = $i+1;
                    $answer->stt = $stt;
    	    		$answer->save();
    	   	}

            DB::commit();
            return redirect()->route('get.admin.quesstion.list')->with(['flash_message'=>'Tạo mới thành công']);
        }catch (Exception $e) {
            DB::rollBack();
            return back()->withError($e->getMessage())->withInput();
        }
    }

}