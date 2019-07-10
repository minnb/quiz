<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;
class TempAnswer extends Model
{
    protected $table ="temp_answer";
    protected  $fillable = array('question_id', 'stt', 'answer', 'result','user_id');
}