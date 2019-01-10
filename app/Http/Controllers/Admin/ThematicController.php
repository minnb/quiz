<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use DB; use Auth;
use App\Models\Subject;
use App\Models\Course;
use App\Models\Thematic;
class ThematicController extends Controller
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
    	$data = Thematic::where('status', 1)->orderBy('id','desc')->get();
        return view('admin.thematic.list', compact('data'));
    }

    public function getAdd($course, $subject){
    	$subject_id = fdecrypt($subject); 
    	$course_id = fdecrypt($course); 
    	return view('admin.thematic.add',compact('subject_id', 'course_id'));
    }

    public function postAdd(Request $request, $course, $subject){
    	$subject_id = fdecrypt($subject); 
        $course_id = fdecrypt($course); 
        try{
            DB::beginTransaction();
            $thematic = new Thematic();
            $thematic->course = $course_id;
            $thematic->subject = $subject_id;
            $thematic->class = Course::getClassByCourse($course_id);
            $thematic->name = $request->name;
            $thematic->alias = makeUnicode($request->name);
            $thematic->description = $request->description;
            $thematic->keywords = $request->keywords;
            $thematic->status = $request->status;
            $thematic->onpost = 0;
            $thematic->user_id = Auth::user()->id;
            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = checkFolderImage();
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $thematic->image = $destinationPath.'/'.$file_name;
                        $file->move($destinationPath, $file_name);
                    }
                }
            }
            $thematic->save();
            DB::commit();
            return redirect()->route('get.admin.thematic.list')->with(['flash_message'=>'Tạo mới thành công']);
        }catch (Exception $e) {
            DB::rollBack();
            return back()->withError($e->getMessage())->withInput();
        }
    }

    public function getEdit($id){
        $thematic_id = fdecrypt($id); 
        $data = Thematic::find($thematic_id)->toArray();
        return view('admin.thematic.edit', compact('data', 'thematic_id'));
    }
    public function postEdit(Request $request, $id){
        $thematic_id = fdecrypt($id); 
        try{
            DB::beginTransaction();
            $thematic = Thematic::find($thematic_id);
            $img_old = $thematic->image;

            $thematic->name = $request->name;
            $thematic->alias = makeUnicode($request->name);
            $thematic->description = $request->description;
            $thematic->keywords = $request->keywords;
            $thematic->status = $request->status;
            $thematic->user_id = Auth::user()->id;

            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = checkFolderImage();
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $thematic->image = $destinationPath.'/'.$file_name;
                        $file->move($destinationPath, $file_name);
                        delete_image_no_path($img_old);
                    }
                }
            }
            $thematic->save();
            DB::commit();
            return redirect()->route('get.admin.thematic.list')->with(['flash_message'=>'Chỉnh sửa thành công']);
        }catch (Exception $e) {
            DB::rollBack();
            return back()->withError($e->getMessage())->withInput();
        }
    }

    public function getDelete($id){
        $thematic_id = fdecrypt($id); 
        try{
            $thematic = Thematic::findOrFail($thematic_id);
            $thematic->status = 0;
            $thematic->save();
            return back()->with(['flash_message'=>'Xoá thành thành công']);
        }catch (Exception $e) {
            DB::rollBack();
            return back()->withError($e->getMessage())->withInput();
        }
        
    }

}