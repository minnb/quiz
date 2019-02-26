<?php
namespace App\Models;
use App\Models\TempQuestion;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Concerns\ToModel;
use Auth;
class QuestionImport implements ToModel
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
           'user_id'    => $user_id,
           'thematic'   => 0,
           'question'   => $row[0],
           'stt'        => $row[1],
           'answer'     => $row[2],
           'result'     => $row[3]
        ]);
    }
}