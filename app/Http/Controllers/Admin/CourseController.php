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
        return view('admin.class.list', compact('data'));
    }

    public function getAdd($class){
        $class_id = fdecrypt($class);
        return view('admin.course.add', compact('class_id'));
    }
}
