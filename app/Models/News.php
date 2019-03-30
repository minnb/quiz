<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use DB;
class News extends Model
{
    protected $table ="z_news";

    public static function getTopNews($top = 3){
    	$data = News::where('status', 1)->limit($top)->orderBy('id', 'DESC')->get();
    	return $data;
    }

}