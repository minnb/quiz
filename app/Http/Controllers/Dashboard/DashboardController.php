<?php
namespace App\Http\Controllers\Dashboard;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use DB; use Session;
use Auth;
class DashboardController extends Controller
{
	public function __construct()
    {
    	$this->middleware('quiz');
    }
   
    public function index()
    {
        return view('dashboard.layouts.index');
    }

    public function getLogout(){
    	Session::forget('hochieuqua_vn');
    	return redirect()->route('index');
    }
}
