<?php
namespace App\Models;
use App\Models\TempQuestion;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Auth;
class QuestionImport implements ToModel, WithHeadingRow
{

    public function model(array $row)
    {       
        
        return new TempQuestion([
           'question_id'=> $row['id'],
           'user_id'    => Auth::user()->id,
           'thematic'   => 0,
           'question'   => $row['question'],
           'stt'        => $row['stt'],
           'answer'     => $row['answer'],
           'result'     => $row['result'],
           'used'       => $row['used'],
           'level'      => $row['level'],
        ]);
    }
}
