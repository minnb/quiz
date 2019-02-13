<?php
namespace App\Http\Controllers\Dashboard;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\User_Course;
use DB; use Session;
class DashboardController extends Controller
{
	public function __construct()
    {
    	$this->middleware('quiz');
    }
   
    public function index()
    {
        try{
            $lesson_recent = User_Course::getLessonRecentByUser(User::getInfoUser()['id']);
            return view('dashboard.layouts.index', compact('lesson_recent'));
        }catch(Exception $e){
            Session::forget('hochieuqua_vn');
            return redirect()->route('home.login');
        }
    }

    public function getLogout(){
    	Session::forget('hochieuqua_vn');
    	return redirect()->route('index');
    }
}
