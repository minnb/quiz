<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use DB; use Auth;
use App\Models\News;
class NewController  extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('admin');
    }

    public function getList(){
    	$data = News::where('status', 1)->orderBy('id', 'DESC')->get();
    	return view('admin.news.list', compact('data'));
    }
    public function getAdd(){
    	return view('admin.news.add');
    }
    public function postAdd(Request $request){
    	$request->validate([
            'name' => 'required|max:191',
        ]);
    	try{
            DB::beginTransaction();
            $data = new News();
            $data->name = trim($request->name);
            $data->alias = makeUnicode(trim($request->name));
            $data->cate_id = $request->cate_id;
            $data->description = $request->description;
            $data->content = $request->content;
            $data->status = 1;
            $data->tags = $request->tags;
            $data->user_id = Auth::user()->id;
            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = checkFolderImage();
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $data->image = $destinationPath.'/'.$file_name;
                        $file->move($destinationPath, $file_name);
                    }
                }
            }
            $data->save();
            DB::commit();
            return redirect()->route('get.admin.news.list')->with(['flash_message'=>'Tạo mới thành công']);
        }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }
    public function getEdit($idd){
    	$id = fdecrypt($idd); 
    	try{
    		$data = News::find($id)->toArray();
        	return view('admin.news.edit', compact('data', 'id'));
    	}catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }
    public function postEdit(Request $request, $idd){
    	$id = fdecrypt($idd); 
    	$request->validate([
            'name' => 'required|max:191',
        ]);
    	try{
            DB::beginTransaction();
            $data = News::find($id);
            $image_old = $data->image;
            $data->name = trim($request->name);
            $data->alias = makeUnicode(trim($request->name));
            $data->cate_id = $request->cate_id;
            $data->description = $request->description;
            $data->content = $request->content;
            $data->status = $request->status;
            $data->tags = $request->tags;
            $data->user_id = Auth::user()->id;
            if($request->file('fileImage')){
                foreach(Input::file('fileImage') as $file ){
                    $destinationPath = checkFolderImage();
                    if(isset($file)){
                        $file_name = randomString().'.'.$file->getClientOriginalExtension();
                        $data->image = $destinationPath.'/'.$file_name;
                        $file->move($destinationPath, $file_name);
                        delete_image_no_path($image_old);
                    }
                }
            }
            $data->save();
            DB::commit();
            return redirect()->route('get.admin.news.list')->with(['flash_message'=>'Tạo mới thành công']);
        }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }
    public function getDelete($idd){
    	$id = fdecrypt($idd); 
        try{
            $data = News::findOrFail($id);
            if($data->image != ''){
            	delete_image_no_path($data->image);
            }
            $data->delete();
            return back()->with(['flash_message'=>'Xoá thành thành công']);
        }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }
}