<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use App\Http\Resources\QuizResources;
use DB;
use Auth;
use App\Models\QuizCollection;
use App\Models\Thematic;
use App\Models\Lesson;
use App\Models\Quesstion;
use App\Models\HeaderQuiz;
use App\Models\Exam;
class QuizController extends Controller
{
	public function getDataQuiz($id, $token){
		$response = [
            'status' => false,
        ];
		if($token == "0795879133"){
			$data_quiz = HeaderQuiz::findOrFail($id);
			$dataQuestion = new QuizCollection();
			$dataQuestion->id=$id;
			$dataQuestion->quiz=Exam::getName($data_quiz->type);
			$dataQuestion->thematic=$data_quiz->thematic == '' ? '' : Thematic::find($data_quiz->thematic)->name;
			$dataQuestion->lesson =$data_quiz->lesson == '' ? '' : Lesson::find($data_quiz->lesson)->name;
			$dataQuestion->data = Quesstion::getQuestionData($id);
			return response()->json($dataQuestion, 200);
		}else{
			return response()->json($response, 404);
		}
	}

}