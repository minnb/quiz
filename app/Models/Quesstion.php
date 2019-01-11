<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;
use App\Models\Course;
class Quesstion extends Model
{
    protected $table ="m_cau_hoi";

    public static function countQuesstionInThematic($thematic){
    	return Quesstion::where([
    		['thematic', $thematic]
    	])->get()->count();
    }
}