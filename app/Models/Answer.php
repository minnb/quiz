<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;
use App\Models\Course;
class Answer extends Model
{
    protected $table ="m_cau_dap_an";

    public static function getAswerTrue($id){
    	$result = 0;
    	$data = Answer::where('quesstion_id', $id)->get();
    	foreach($data as $item){
    		if($item->result == $item->stt){
    			$result = $item->result;
    		}
    	}
    	return $result;
    }
}