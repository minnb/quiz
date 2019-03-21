<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use DB; use Auth;
use App\Models\Subject;
use App\Models\User;
use App\Models\Course;
use App\Models\Teacher;
use App\Models\Thematic;use App\Models\Lesson;
class TeacherController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function getList(){
    	$data = Teacher::where('status', 1)->orderBy('id','desc')->get();
        return view('admin.teacher.list', compact('data'));
    }

    public function getAdd(){
    	return view('admin.teacher.add');
    }

    public function postAdd(Request $request){
        try{
            DB::beginTransaction();
            $data = new Teacher();
            $data->name = $request->name;
            $data->email = $request->email;
            $data->phone = $request->phone;
            $data->description = $request->description;
            $data->status = $request->status;
            $data->user_id = Auth::user()->id;
            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = checkFolderImage();
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $data->avata = $destinationPath.'/'.$file_name;
                        $file->move($destinationPath, $file_name);
                    }
                }
            }
            $data->save();
            $checkUser = User::where('email',$request->email)->get();
            if($checkUser->count()>0){
                User::where('email',$request->email)->update([
                    'avata'=> $data->avata, 
                    'teacher'=>1,
                    'phone' => $data->phone
                ]);
            }
            DB::commit();
            return redirect()->route('get.admin.teacher.list')->with(['flash_message'=>'Tạo mới thành công']);
        }catch (Exception $e) {
            DB::rollBack();
            return back()->withError($e->getMessage())->withInput();
        }
    }

    public function getEdit($id){
        $teacher_id = fdecrypt($id); 
        $data = Teacher::find($teacher_id)->toArray();
        return view('admin.teacher.edit', compact('data', 'teacher_id'));
    }
    public function postEdit(Request $request, $id){
        $teacher_id = fdecrypt($id); 
        try{
            DB::beginTransaction();
            $data = Teacher::find($teacher_id);
            $avat_old = $data->avata;
            $data->name = $request->name;
            $data->email = $request->email;
            $data->phone = $request->phone;
            $data->description = $request->description;
            $data->status = $request->status;
            $data->user_id = Auth::user()->id;
            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = checkFolderImage();
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $data->avata = $destinationPath.'/'.$file_name;
                        $file->move($destinationPath, $file_name);
                        delete_image_no_path($avat_old);
                    }
                }
            }
            $data->save();
            $checkUser = User::where('email',$request->email)->get();
            if($checkUser->count()>0){
                User::where('email',$request->email)->update([
                    'avata'=> $data->avata, 
                    'teacher'=>1,
                    'phone' => $data->phone
                ]);
            }
            DB::commit();
            return redirect()->route('get.admin.teacher.list')->with(['flash_message'=>'Chỉnh sửa thành công']);
        }catch (Exception $e) {
            DB::rollBack();
            return back()->withError($e->getMessage())->withInput();
        }
    }

    public function getDelete($id){
        $teacher_id = fdecrypt($id); 
        try{
            $teacher = Teacher::findOrFail($teacher_id);
            $teacher->status = 0;
            $teacher->save();
            return back()->with(['flash_message'=>'Xoá thành thành công']);
        }catch (Exception $e) {
            DB::rollBack();
            return back()->withError($e->getMessage())->withInput();
        }
        
    }

}