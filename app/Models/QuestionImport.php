<?php
namespace App\Models;
use App\Models\TempQuestion;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Auth;
class QuestionImport implements ToModel, WithHeadingRow
{
    /**
     * @param array $row
     *
     * @return User|null
     */
    public function model(array $row)
    {
        $user_id = Auth::user()->id;
        return new TempQuestion([
           'question_id'=> $row['id'],
           'user_id'    => $user_id,
           'thematic'   => 0,
           'question'   => $row['question'],
           'stt'        => $row['stt'],
           'answer'     => $row['answer'],
           'result'     => $row['result'],
           'used'       => $row['used'],
        ]);
    }
}