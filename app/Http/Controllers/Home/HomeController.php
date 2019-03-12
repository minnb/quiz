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
class HomeController extends Controller
{
    public function __construct()
    {
    }

    public function index()
    {
    	$data_course = Course::where('status',1)->orderBy('code')->get();
    	$data_teacher = Teacher::where('status', 1)->orderBy('id')->get();
        return view('home.layouts.index', compact('data_teacher', 'data_course'));
    }


}
