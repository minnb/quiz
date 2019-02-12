<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;
use App\Models\Course;
use App\Models\User;
class User_Course extends Model
{
    protected $table ="user_course";
   
    public static function getCourseByUserId($user_id){
    	$data = DB::table('user_course')->where('user_id', $user_id)->get();
    	return $data;
    }
    
}