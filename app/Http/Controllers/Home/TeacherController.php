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
class TeacherController extends Controller
{
    public function getTeacherDetail($idd,$name)
    {
    	$id = fdecrypt($idd);
    	$data = Teacher::find($id);
    	if($data->count() > 0){
    		return view('home.pages.teacher_detail', compact('data'));
    	}else{
    		return back();
    	}
        
    }


}
