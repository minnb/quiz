<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use DB;
use Auth;
use App\Models\ClassRoom;
use App\Models\Course;
use App\Models\Course_Subject;
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
            $course->full_name = Course::getFullNameCourse($request->course);
            $course->link_video = trim($request->link_video);
            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = checkFolderImage();
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $course->image = $destinationPath.'/'.$file_name;
                        $file->move($destinationPath, $file_name);
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
        }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
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
            $code = $course->code;
            $img_old = $course->image;
            $course->description = $request->description;
            $course->user_id = Auth::user()->id;
            $course->status = $request->status;
            $course->unit_price = $request->unit_price;
            $course->full_name = Course::getFullNameCourse($code);
            $course->link_video = trim($request->link_video);
            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = checkFolderImage();
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $course->image = $destinationPath.'/'.$file_name;
                        $file->move($destinationPath, $file_name);
                        delete_image_no_path($img_old);
                    }
                }
            }
            $course->save();
            DB::commit();
            return redirect()->route('get.admin.course.list')->with(['flash_message'=>'Chỉnh sửa thành công']); 
        }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }

    public function getAddSubject($course){
        $course_id = fdecrypt($course);
        return view('admin.course.add_subject', compact('course_id'));
    }

     public function postAddSubject(Request $request, $course){
        $course_id = fdecrypt($course);
        try{
            DB::beginTransaction();
            $course = new Course_Subject();
            $course->course = $course_id;
            $course->subject = $request->subject;
            $course->alias = '';
            $course->user_id = Auth::user()->id;
            $course->status = 1;
            $course->onpost = 0;

            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = checkFolderImage();
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $course->image = $destinationPath.'/'.$file_name;
                        $file->move($destinationPath, $file_name);
                    }
                }
            }
            if(Course::checkSubjectInCourse($course_id, $request->subject) == 0){
                $course->save();
            }else{
                return back()->withErrorss('Môn học đã tồn tại trong khoá học')->withInput();
            }
            
            DB::commit();
            return redirect()->route('get.admin.course.list')->with(['flash_message'=>'Thêm mới thành công']); 
        }catch (ModelNotFoundException $exception ) {
            DB::rollBack();
            return back()->withErrors($exception->getMessage())->withInput();
        }
    }

    public function getDelete($idd){
        $id = fdecrypt($idd); 
        $data = Course::findOrFail($id);
        if($data->count() > 0){
            $data->status = 0;
            $data->save();
            return redirect()->route('get.admin.course.list')->with(['flash_message'=>'Block thành công']);
        }else{
            return redirect()->route('get.admin.course.list')->with(['flash_message'=>'Có lỗi xảy ra, vui lòng thực hiện lại']);
        }

    }
}
