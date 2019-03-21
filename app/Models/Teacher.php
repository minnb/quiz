<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;
class Teacher extends Model
{
    protected $table ="m_giao_vien";
    
    public static function getSelectTeacher(){
    	return DB::table('m_giao_vien')->select('id', 'name')->get();
    }
}