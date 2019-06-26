<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use DB;
use Auth;
use App\Models\XepLoai;
class ConfigController extends Controller
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

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function getXepLoai()
    {
         $data = XepLoai::orderBy('id')->get();
        return view('admin.config.xeploai', compact('data'));
    }

    public function getXepLoaiEdit($idd){
        $id = fdecrypt($idd); 
        $data = XepLoai::find($id)->toArray();
        return view('admin.config.xeploai_edit', compact('data', 'id'));
    }

    public function postXepLoaiEdit(Request $request, $idd){
        $id = fdecrypt($idd);
        $request->validate([
            'name' => 'required|max:191',
        ]);
        try{
            DB::beginTransaction();
            $data = XepLoai::find($id);
            $data->name = trim($request->name);
            $data->description = trim($request->description);
            $data->from_point = $request->from_point;
            $data->to_point = $request->to_point;
            $data->save();
            DB::commit();
            return redirect()->route('get.admin.config.xeploai')->with(['flash_message'=>'Chỉnh sửa thành công']);
        }catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors($e->getMessage())->withInput();
        }
    }
}
