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
use App\Models\QuizCollection;
use App\Models\Quesstion;
class QuizController extends Controller
{
	public function getDataQuiz($id, $token){
		$response = [
            'status' => false,
        ];
		if($token == "0795879133"){
			$dataQuestion = new QuizCollection();
			$dataQuestion->id=1;
			$dataQuestion->quiz='';
			$dataQuestion->thematic='';
			$dataQuestion->lesson ='';
			$dataQuestion->data = (object)Quesstion::getQuestionData($id);
			return response()->json($dataQuestion, 200);
		}else{
			return response()->json($response, 404);
		}
	}

}