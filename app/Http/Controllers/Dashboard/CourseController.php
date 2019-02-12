<?php
namespace App\Http\Controllers\Dashboard;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use DB; use Session;
use Auth;
class CourseController extends Controller
{
	public function __construct()
    {
    	$this->middleware('quiz');
    }
  
    public function getList(){

        return view('dashboard.course.list');
    }

    public function getMyCourse(){
        
        return view('dashboard.course.my_course');
    }

    public function getDetail($idd){

        return view('dashboard.course.detail');
    }
}
