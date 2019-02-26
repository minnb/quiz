<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;
class TempQuestion extends Model
{
    protected $table ="temp_questions";
    protected  $fillable = array('user_id','thematic', 'question', 'stt', 'answer', 'result');
}