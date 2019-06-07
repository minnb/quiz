<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use DB;
use Auth;
use App\Models\User;
use App\Models\Role_User;
use App\Models\User_Course;
use App\Models\Quesstion;
class QuizController extends Controller
{
	public function getDataQuiz($id, $token){
		$response = [
            'status' => false,
        ];

		if($token == "0795879133"){
			return response()->json(Quesstion::getQuestionData($id), 200);
		}else{
			return response()->json($response, 404);
		}
	}

}