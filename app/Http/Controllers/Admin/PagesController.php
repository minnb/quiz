<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use DB; use Auth;
use App\Models\Subject;
use App\Models\Answer;
use App\Models\Course;
use App\Models\Thematic;
use App\Models\Slider;
use App\Models\User;
class PagesController  extends Controller
{
  	public function __construct()
    {
        $this->middleware('auth');
    }

    public function getSlide(){
    	$data = Slider::where('status', 1)->orderBy('sort')->get();
    	return view('admin.pages.list_slide', compact('data'));
    }

    public function postSlide(Request $request){
    	$request->validate([
            'name1' => 'max:191',
            'name2' => 'max:191',
            'link_video' => 'max:191',
            'fileImage'	=> 'max:2048'
        ]);
    	try{
            DB::beginTransaction();
            $data = new Slider();
            $data->name1 = $request->name1;
            $data->name2 = $request->name2;
            $data->link =  $request->link;
			$data->alias = makeUnicode($request->name1);
			$data->status = 1;
			$data->sort = $request->sort;
            $data->user_id = Auth::user()->id;
            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = 'public/uploads/slider';
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $data->image = $destinationPath.'/'.$file_name;
                        $file->move($destinationPath, $file_name);
                    }
                }
            }
            $data->save();
            DB::commit();
            return redirect()->route('get.admin.pages.slide.list')->with(['flash_message'=>'Tạo mới thành công']);
        }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }

    public function getEditSlide($idd){
    	$id = fdecrypt($idd);
    	$data = Slider::find($id);
    	$data_image = Slider::where('status', 1)->orderBy('sort')->get();
    	return view('admin.pages.edit_slide', compact('data','data_image','id'));
    }

    public function postEditSlide(Request $request, $idd){
    	$id = fdecrypt($idd);
    	$request->validate([
            'name1' => 'max:191',
            'name2' => 'max:191',
            'link_video' => 'max:191',
            'fileImage'	=> 'max:2048'
        ]);
    	try{
            DB::beginTransaction();
            $data = Slider::find($id);
            $old_img = $data->image;
            
            $data->name1 = $request->name1;
            $data->name2 = $request->name2;
            $data->link =  $request->link;
			$data->alias = makeUnicode($request->name1);
			$data->status = $request->status;
			$data->sort = $request->sort;
            $data->user_id = Auth::user()->id;
            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = 'public/uploads/slider';
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $data->image = $destinationPath.'/'.$file_name;
                        $file->move($destinationPath, $file_name);
                        delete_image_no_path($old_img);
                    }
                }
            }
            $data->save();
            DB::commit();
            return redirect()->route('get.admin.pages.slide.list')->with(['flash_message'=>'Chỉnh sửa thành công']);
        }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }
    
    public function getQaList(){
        $data =DB::table('z_qa')->orderBy('id', 'DESC')->get();
        return view('admin.pages.list_qa',compact('data'));
    }

    public function postQaAdd(Request $request){
        try{
            DB::beginTransaction();
            DB::table('z_qa')->insert([
                'name'=>trim($request->name),
                'content'=>$request->content,
                'status'=>1,
                'alias'=>'',
                'user_id'=>Auth::user()->id
            ]);
            DB::commit();
            return back()->with(['flash_message'=>'Thêm mới thành công']);
        }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }
    public function getQaEdit($idd){
        $id = fdecrypt($idd);
        $data = DB::table('z_qa')->where('id', $id)->get();
        return view('admin.pages.edit_qa', compact('data', 'id'));
    }
    public function postQaEdit(Request $request, $idd){
        $id = fdecrypt($idd);
        try{
            DB::beginTransaction();
            DB::table('z_qa')->where('id', $id)->update([
                'name'=>trim($request->name),
                'content'=>$request->content,
                'user_id'=>Auth::user()->id
            ]);
            DB::commit();
            return redirect()->route('get.admin.pages.qa.list')->with(['flash_message'=>'Chỉnh sửa thành công']);
        }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }
    public function getQaDelete($idd){
        $id = fdecrypt($idd);
        try{
            DB::beginTransaction();
            DB::table('z_qa')->where('id', $id)->update(['status'=>0]);
            DB::commit();
            return redirect()->route('get.admin.pages.qa.list')->with(['flash_message'=>'Xóa dữ liệu thành công']);
        }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }
}