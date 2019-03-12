<?php
namespace App\Http\Controllers\Dashboard;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\User_Course;
use App\Models\HeaderQuiz;
use App\Models\DetailQuiz;
use App\Models\Lesson;
use App\Models\Course;
use DB; use Session;
use Auth;
class ResultController extends Controller
{
    
	public function __construct()
    {
    	$this->middleware('quiz');
    }

    public function getTablePoint($idd){
    	 $user_id = fdecrypt($idd);
    	 $quiz_header = HeaderQuiz::where('user_id', $user_id)->orderBy('thematic')->get();
    	 $course = User_Course::where('user_id', $user_id)->orderBy('course')->get();
    	 return view('dashboard.result.table_point', compact('quiz_header','course'));
    }
}