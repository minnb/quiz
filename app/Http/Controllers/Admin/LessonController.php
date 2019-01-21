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
use App\Models\Lesson;
class LessonController  extends Controller
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
    	$data = Lesson::where('status', 1)->get();
    	return view('admin.lesson.list', compact('data'));
    }

    public function getAdd(){

    }

    public function postAdd(Request $request){

    }

    public function getAddByThematic($thematic){
    	$thematic_id = fdecrypt($thematic); 
    	return view('admin.lesson.add_by_thematic', compact('thematic_id'));
    }

    public function postAddByThematic(Request $request, $thematic){
    	$thematic_id = fdecrypt($thematic); 
    	$course = Thematic::where('id',$thematic_id)->get();
    	try{
            DB::beginTransaction();
            $lesson = new Lesson();
            $lesson->course = $course[0]->course;
            $lesson->thematic = $thematic_id;
            $lesson->name = $request->name;
			$lesson->alias = makeUnicode($request->name);
			$lesson->link_video = $request->link_video;
			$lesson->description = $request->description;
            $lesson->content = $request->content;
            $lesson->keywords = $request->keywords;
			$lesson->status = 1;
			$lesson->sort = 0;
            $lesson->user_id = Auth::user()->id;
            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = checkFolderImage();
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $lesson->image = $destinationPath.'/'.$file_name;
                        $file->move($destinationPath, $file_name);
                    }
                }
            }
            $lesson->save();
            DB::commit();
            return redirect()->route('get.admin.thematic.list.byid',['id'=>fencrypt($thematic_id)])->with(['flash_message'=>'Tạo mới thành công']);
        }catch (Exception $e) {
            DB::rollBack();
            return back()->withError($e->getMessage())->withInput();
        }
    }

    public function getEdit($idd){
        $id = fdecrypt($idd); 
        $data = Lesson::findOrFail($id)->toArray();
        return view('admin.lesson.edit', compact('data','id'));
    }

    public function postEdit(Request $request, $idd){
        $id = fdecrypt($idd); 
        try{
            DB::beginTransaction();
            $lesson = Lesson::findOrFail($id);
            $old_img = $lesson->image;
            $lesson->course = $course[0]->course;
            $lesson->thematic = $thematic_id;
            $lesson->name = $request->name;
            $lesson->alias = makeUnicode($request->name);
            $lesson->link_video = $request->link_video;
            $lesson->description = $request->description;
            $lesson->content = $request->content;
            $lesson->keywords = $request->keywords;
            $lesson->status = 1;
            $lesson->sort = 0;
            $lesson->user_id = Auth::user()->id;
            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = checkFolderImage();
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $lesson->image = $destinationPath.'/'.$file_name;
                        $file->move($destinationPath, $file_name);
                        delete_image_no_path($img_old);
                    }
                }
            }
            $lesson->save();
            DB::commit();
            return redirect()->route('get.admin.lesson.list')->with(['flash_message'=>'Chỉnh sửa thành công']);
        }catch (Exception $e) {
            DB::rollBack();
            return back()->withError($e->getMessage())->withInput();
        }
    }

    public function getDelete($idd){
        $id = fdecrypt($idd); 
        $data = Lesson::findOrFail($id);
        if($data->count() > 0){
            $data->status = 0;
            $data->save();
            return redirect()->route('get.admin.lesson.list')->with(['flash_message'=>'Block thành công']);
        }else{
            return redirect()->route('get.admin.lesson.list')->with(['flash_message'=>'Có lỗi xảy ra, vui lòng thực hiện lại']);
        }

    }
}