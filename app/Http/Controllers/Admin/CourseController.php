<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
use Auth;
use App\Models\ClassRoom;
use App\Models\Course;
class CourseController extends Controller
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

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function getList()
    {
         $data = Course::orderBy('id','desc')->get();
        return view('admin.course.list', compact('data'));
    }

    public function getAdd($class){
        $class_id = fdecrypt($class);
        return view('admin.course.add', compact('class_id'));
    }

    public function postAdd(Request $request, $class){
        $class_id = fdecrypt($class);
        try{
            DB::beginTransaction();
            $course = new Course();
            $course->code = 'HHQ'.$class_id.$request->course;
            $course->class = $class_id;
            $course->course = $request->course;
            $course->name = Course::getCourseName($request->course);
            $course->description = $request->description;
            $course->alias = makeUnicode(Course::getCourseName($request->course));
            $course->user_id = Auth::user()->id;
            $course->onpost = 0;
            $course->status = $request->status;

            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = checkFolderImage();
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $course->image = $destinationPath.'/'.$file_name;
                    }
                }
            }
            if(Course::checkSourceOnClass($class_id, $request->course) == 0){
                $course->save();
            }else{
                return redirect()->route('get.admin.course.add',['class'=>fencrypt($class_id)])->with(['flash_message'=>'Khóa học đã tồn tại'])->withInput();     
            }
            
            DB::commit();
            return redirect()->route('get.admin.course.list')->with(['flash_message'=>'Tạo mới thành công']); 
        }catch (Exception $e) {
            DB::rollBack();
            return redirect()->route('get.admin.course.list')->with(['flash_message'=>'Caught exception: ',  $e->getMessage(), "\n"]); 
        }
    }

    public function getEdit($id){
        $course_id = fdecrypt($id);
        $data = Course::find($course_id)->toArray();
        return view('admin.course.edit', compact('data', 'course_id'));
    }

    public function postEdit(Request $request, $id){
        $course_id = fdecrypt($id);
        try{
            DB::beginTransaction();
            $course = Course::find($course_id);
            $course->description = $request->description;
            $course->user_id = Auth::user()->id;
            $course->status = $request->status;

            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = checkFolderImage();
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $course->image = $destinationPath.'/'.$file_name;
                    }
                }
            }
            $course->save();
            DB::commit();
            return redirect()->route('get.admin.course.list')->with(['flash_message'=>'Chỉnh sửa thành công']); 
        }catch (Exception $e) {
            DB::rollBack();
            return redirect()->route('get.admin.course.list')->with(['flash_message'=>'Caught exception: ',  $e->getMessage(), "\n"]); 
        }
    }
}
