<?php
namespace App\Http\Controllers\Home;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Http\Requests\RegisterFormRequest;
use Illuminate\Http\Response;
use App\Models\User;
use App\Models\Course;
use App\Models\Teacher;
use JWTAuth; use Session;
use Validator;
use JWTFactory;
use DB; 
class CourseController extends Controller
{
    public function getCourseDetail($idd, $name)
    {
    	$id = fdecrypt($idd);
    	$data = Course::find($id);
    	$data_course = Course::where('status',1)->orderBy('code')->get();
    	if($data->count() > 0){
    		return view('home.pages.course_detail', compact('data','data_course'));
    	}else{
    		return back();
    	}
        
    }


}
