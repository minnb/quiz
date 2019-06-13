<?php
namespace App\Http\Controllers\Dashboard;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Auth;
use App\Models\User;use App\Models\Course;
use App\Models\User_Course;
use DB; use Session;
class DashboardController extends Controller
{
	public function __construct()
    {
    	 $this->middleware('auth');
    }
   
    public function index()
    {
        try{
            $value = '';
            if (Session::has('infoUser')) {
               $value =Session::get('infoUser') ;
            }

            $course_data = Course::where([
                ['status', 1]
            ])->get();
            $lesson_recent = User_Course::getLessonRecentByUser(User::getInfoUser()['id']);
            return view('dashboard.layouts.index', compact('lesson_recent','course_data','data_user','value'));
        }catch(\Exception $e){
            Session::forget('hochieuqua_vn');
            return redirect()->route('home.login');
        }
    }

    public function getLogout(){
    	Auth::logout();
        Session::forget('hochieuqua_vn');
    	return redirect()->route('index');
    }
}
