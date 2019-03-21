<?php
namespace App\Http\Controllers\Home;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\Http\Requests\RegisterFormRequest;
use Illuminate\Http\Response;
use App\Models\User;
use App\Models\User_Course;
use JWTAuth; use Session;
use Validator;
use JWTFactory;
use DB; 
use Socialite;
class RegisterController extends Controller
{
	
    public function registerCourse($idd){
    	$course = fdecrypt($idd); 
    	if(Session::has('hochieuqua_vn')){
    		$user = User::getInfoUser();
    		$check = User_Course::where([
    				['course', $course],
    				['user_id', $user['id']]
    			])->get()->count();
    		if($check == 0){
    			try{
		            DB::beginTransaction();
		            $data = new User_Course;
		            $data->user_id = $user['id'];
		            $data->course = $course;
		            $data->begin_date = date("Y/m/d");
		            $data->end_date = '9999-01-01';
		            $data->user_create = $user['id'];
		            $data->status = 0;
		            $data->save();
		            DB::commit();
		        }catch (Exception $e) {
		            DB::rollBack();
		            return back()->withError($e->getMessage())->withInput();
		        }   
    		}
    		return redirect()->route('get.dashboard.course.detail',['id'=>fencrypt($course)]);
    		
    	}else{
    		return redirect()->route('home.login');
    	}

    }
}
