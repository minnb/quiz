<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use DB;
use Auth;
use App\Models\User;
class AdminController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
        if($request->user()->authorizeRoles(['manager'])){
            return view('admin.layouts.index');
        }else{
            return redirect('/');
        }
    }

    public function getLogout(){
        Auth::logout();
        return redirect()->route('index');
    }

    public function getListUser(){
        $data = DB::table('users')->where('status', 1)->get();
        return view('admin.user.list', compact('data'));
    }

    public function getAddUser(){

    }
    public function postAddUser(Request  $request){
        
    }
    public function getEditUser($idd){
        $id = fdecrypt($thematic); 
    }
    public function postEditUser(Request  $request, $idd){
        $id = fdecrypt($thematic); 
        
    }
    public function getDeleteUser($idd){
        $id = fdecrypt($idd); 
        $data = User::findOrFail($id);
        if($data->count() > 0){
            $data->status = 0;
            $data->save();
            return redirect()->route('get.admin.user.list')->with(['flash_message'=>'Block thành công']);
        }else{
            return redirect()->route('get.admin.user.list')->with(['flash_message'=>'Có lỗi xảy ra, vui lòng thực hiện lại']);
        }
    }
}
