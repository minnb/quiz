<?php
namespace App\Models;
use App\Models\TempAnswer;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Auth;
class AnswerImport implements ToModel, WithHeadingRow
{    

    public function model(array $row)
    {
        return new TempAnswer([
           'question_id'=> $row['id'],
           'stt'        => $row['stt'],
           'answer'     => trim($row['answer']),
           'result'     => trim($row['result']),
           'user_id'    => Auth::user()->id
        ]);
    }

    
}