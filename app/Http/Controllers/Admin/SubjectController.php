<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use DB;
use Auth;
use App\Models\Subject;
use App\Models\Course;
class SubjectController extends Controller
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

    public function getList()
    {
        $data = Subject::orderBy('id','desc')->get();
        return view('admin.subject.list', compact('data'));
    }

    public function getAdd(){
        return view('admin.subject.add');
    }

    public function postAdd(Request $request){
        try{
            DB::beginTransaction();
            $subject = new Subject();
            $subject->course = 0;
            $subject->class = 0;
            $subject->name = $request->name;
            $subject->alias = makeUnicode($request->name);
            $subject->description = $request->description;
            $subject->onpost = 0;
            $subject->sort = 0;
            $subject->status = $request->status;
            $subject->sort = 0;
            $subject->user_id = Auth::user()->id;

            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = checkFolderImage();
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $subject->image = $destinationPath.'/'.$file_name;
                        $file->move($destinationPath, $file_name);
                    }
                }
            }
            if(Subject::checkExitsSubject(makeUnicode($request->name)) == 0){
                $subject->save();
            }else{
                return redirect()->route('get.admin.subject.add')->with(['flash_message'=>'Khóa học đã tồn tại'])->withInput();     
            }
           
            DB::commit();
            return redirect()->route('get.admin.subject.list')->with(['flash_message'=>'Tạo mới thành công']);

         }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }

    public function getEdit($id){
    	$subject_id = fdecrypt($id); 
    	$data = Subject::find($subject_id);
    	return view('admin.subject.edit', compact('data', 'subject_id'));
    }

    public function postEdit(Request $request, $id){
    	$subject_id = fdecrypt($id); 
    	try{
            DB::beginTransaction();
            $subject = Subject::find($subject_id);
            $img_old = $subject->image;

            $subject->name = $request->name;
            $subject->alias = makeUnicode($request->name);
            $subject->description = $request->description;
            $subject->status = $request->status;
            $subject->user_id = Auth::user()->id;

            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = checkFolderImage();
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $subject->image = $destinationPath.'/'.$file_name;
                        $file->move($destinationPath, $file_name);
                        delete_image_no_path($img_old);
                    }
                }
            }

            if(makeUnicode($request->name) != $subject->alias){
             	if(Subject::checkExitsSubject(makeUnicode($request->name)) == 0){
                	$subject->save();
            	}else{
            		return redirect()->route('get.admin.subject.edit',['id'=>fencrypt($subject_id)])->with(['flash_message'=>'Khóa học đã tồn tại'])->withInput();     
            	}
            }else{
                $subject->save();
            }

            DB::commit();
            return redirect()->route('get.admin.subject.list')->with(['flash_message'=>'Chỉnh sửa thành công']); 
         }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }

    public function getDelete($idd){
        $id = fdecrypt($idd); 
        $data = Subject::findOrFail($id);
        if($data->count() > 0){
            $data->status = 0;
            $data->save();
            return redirect()->route('get.admin.subject.list')->with(['flash_message'=>'Block thành công']);
        }else{
            return redirect()->route('get.admin.subject.list')->with(['flash_message'=>'Có lỗi xảy ra, vui lòng thực hiện lại']);
        }

    }
}