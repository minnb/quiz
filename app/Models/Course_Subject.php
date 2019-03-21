<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;
use App\Models\ClassRoom;
class Course_Subject extends Model
{
    protected $table ="m_khoahoc_monhoc";

    public static function getListSubjectInCourse($course = ''){
    	if($course == ''){
    		$data = DB::table('m_mon_hoc')
    			->join('m_khoahoc_monhoc', 'm_khoahoc_monhoc.subject','=','m_mon_hoc.id')
    			->select('m_mon_hoc.name', 'm_mon_hoc.id', 'm_khoahoc_monhoc.course' )
    			->orderby('m_mon_hoc.name')->get();
    	}else{
    		$data = DB::table('m_mon_hoc')
    			->join('m_khoahoc_monhoc', 'm_khoahoc_monhoc.subject','=','m_mon_hoc.id')
    			->where('m_khoahoc_monhoc.course',$course)
    			->select('m_mon_hoc.name', 'm_mon_hoc.id', 'm_khoahoc_monhoc.course' )
    			->orderby('m_mon_hoc.name')->get();
    	}
    	
    	return $data;
    }

}

/*
$data = DB::table('items')
				->join('sales_price', 'items.id','=','sales_price.item_id')
				->where([
					['sales_price.end_date','>=',date("Y-m-d")],
					['items.status','=',1],
					['sales_price.image', '!=', ''],
					['sales_price.image_type', '=', $type]
				])
				->select('items.id','items.name','items.cate_name' ,'items.thoigian_string','sales_price.unit_price','sales_price.discount_amount', 'sales_price.path', 'sales_price.image')
				->orderby('sales_price.id','DESC')
				->take($top)
				->get();
*/