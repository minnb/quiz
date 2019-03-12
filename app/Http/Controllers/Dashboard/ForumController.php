<?php
namespace App\Http\Controllers\Dashboard;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use App\Models\User;use App\Models\Course;
use App\Models\User_Course;
use DB; use Session;
class ForumController extends Controller
{
	public function __construct()
    {
    	$this->middleware('quiz');
    }

    public function getIndex(){
    	$courses = Course::where('status',1)->orderBy('code')->get();
    	return view('dashboard.forum.index', compact('courses'));
    }

    public function postCommnetByLesson($course, $lesson){
    	$course_id = fdecrypt($course); 
        $lesson_id = fdecrypt($lesson); 
        
    }
}