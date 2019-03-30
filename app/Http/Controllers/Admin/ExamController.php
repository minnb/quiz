<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use DB;
use Auth;
use App\Models\Subject;
use App\Models\Exam;
class ExamController extends Controller
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
            $exam->type = $request->type;
			$exam->name = $request->name;
			$exam->alias = makeUnicode($request->name);
			$exam->description = $request->description;
			$exam->work_time = $request->work_time;
			$exam->lv1 = $request->lv1;
			$exam->lv2 = $request->lv2;
			$exam->lv3 = $request->lv3;
			$exam->lv4 = $request->lv4;
			$exam->number_quesstion = $request->number_quesstion;
            $exam->user_id = Auth::user()->id;
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

}