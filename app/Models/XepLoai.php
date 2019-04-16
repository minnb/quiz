<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;
class XepLoai extends Model
{
    protected $table ="m_xep_loai";
    public $timestamps = false;

    public static function getXepLoai($point){
    	$data = DB::table('m_xep_loai')->where([
    		['from_point','<',$point],
    		['to_point', '>=', $point]
    	])->get();
    	if($data->count() > 0){
    		return $data[0]->name;
    	}else{
    		return 'Chưa thi';
    	}
    }
    public static function getNhanXet($point){
        $data = DB::table('m_xep_loai')->where([
            ['from_point','<',$point],
            ['to_point', '>=', $point]
        ])->get();
        if($data->count() > 0){
            return $data[0]->description;
        }else{
            return 'Chưa xếp loại';
        }
    }
}