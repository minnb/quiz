<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;
use App\Models\User;
class Slider extends Model
{
    protected $table ="z_slider";

    public static function getSlide(){
    	$data = Slider::where('status',1)->orderBy('sort')->get();
    	return $data;
    }
}