<?php
namespace App\Http\Controllers\Dashboard;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use DB;
use Auth;
class DashboardController extends Controller
{
	public function __construct()
    {
        $this->middleware('auth.member:api');
    }
   
    public function index()
    {
        return view('dashboard.layouts.index');
    }
}
