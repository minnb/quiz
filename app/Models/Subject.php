<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;
class Subject extends Model
{
    protected $table ="m_mon_hoc";
    public static function checkExitsSubject($alias){
    	return Subject::where('alias', $alias)->get()->count();
    }

    public static function getSelectSubject(){
    	$data = DB::table('m_mon_hoc')->select('id','name')->get();
    	return $data;
    }
}