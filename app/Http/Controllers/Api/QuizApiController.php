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
use App\Models\DetailQuiz;
use App\Models\Exam;
class QuizApiController extends Controller
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
			$dataQuestion->data = Quesstion::getQuestionDataApi($id);
			//return response()->json($dataQuestion, 200);
			return $dataQuestion;
		}else{
			return response()->json($response, 404);
		}
	}

	public function postDataQuiz(Request $request){
		try{
				$data = collect(json_decode($request->getContent(),true));
				$quiz_id = $data['id'];
				$quizHeader = $request->isMethod('put') ? HeaderQuiz::findOrFail($data['id']) : new HeaderQuiz;
				$lstAnswer = $data['data'];

            DB::beginTransaction();
            foreach ($lstAnswer as $key=>$dataAnswer){    
            	if($dataAnswer['type'] == 'radio'){
            		foreach($dataAnswer['answer'] as $item){
            			DetailQuiz::where('quiz_id', $quiz_id)
                        ->where('question_id', $dataAnswer['question_id'])
                        ->update(['answer' => $item['result']]);
            		}    
            	}else{
        			DetailQuiz::where('quiz_id', $quiz_id)
                    ->where('question_id', $dataAnswer['question_id'])
                    ->update(['comment' => json_encode($dataAnswer['answer'])]);
            	}
            }
            HeaderQuiz::where('id', $quiz_id)->update(['status' => 1]);
            HeaderQuiz::calcResultQuiz($quiz_id);
            //HeaderQuiz::insertQueeEmail('QUIZ',$quiz_id);
            $quizResult = DetailQuiz::where('quiz_id', $quiz_id)->get();
            $arrAnswer = [];
            foreach($quizResult as $key=>$item){
            	$arr = array(
		    			'question_id'=>$item->question_id,
						'answer'=>$item->answer,
						'answer_value'=>json_decode($item->comment),
						'result'=>$item->result
					);
				array_push($arrAnswer,$arr);
            }
            DB::commit();
            //return response()->json($dataQuestion, 200);
            return $arrAnswer;
        }catch(Exception $e){
            DB::rollBack();
            return response()->json($e, 404);
        } 
	}
}