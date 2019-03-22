<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use DB;
use Auth;
use App\Models\User;
use App\Models\Role_User;use App\Models\User_Course;
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
        $data = DB::table('users')->get();
        return view('admin.user.list', compact('data'));
    }

    public function getAddUser(){
        return view('admin.user.add');
    }
    public function postAddUser(Request  $request){
        $validatedData = $request->validate([
                'name' => ['required', 'string', 'max:255'],
                'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
                'password' => ['required', 'string', 'min:6', 'confirmed'],
            ]);

        if($validatedData){
            try{
                DB::beginTransaction();
                $user = new User();
                $user->name = $request->name;
                $user->email = $request->email;
                $user->password = Hash::make($request->password);
                $user->save();
                $user_id = $user->id;
                Role_User::create([
                    'role_id' => 3,
                    'user_id' =>  $user_id 
                ]);
                DB::commit();
            }catch (Exception $e) {
                DB::rollBack();
                return back()->withError($e->getMessage())->withInput();
            }   
        }
        return redirect()->route('get.admin.user.list')->with(['flash_message'=>'Tạo mới thành công']);
    }

    public function getEditUser($idd){
        $id = fdecrypt($idd); 
        $data = User::findOrFail($id);
        return view('admin.user.edit', compact('data', 'id'));
    }

    public function postEditUser(Request  $request, $idd){
        $id = fdecrypt($idd); 
        try{
            DB::beginTransaction();
            $user = User::findOrFail($id);
            $user->name = $request->name;
            $user->status= $request->status;
            if($user->password != ''){
                $user->password = Hash::make($request->password);
            }
            $user->save();

            $update = [
                        'role_id' =>$request->role,
                    ];
                
                DB::table('role_user')->where([
                        ['user_id', $id]
                    ])->update($update);

            DB::commit();
            return redirect()->route('get.admin.user.list')->with(['flash_message'=>'Chỉnh sửa thành công']);
        }catch (Exception $e) {
            DB::rollBack();
            return back()->withError($e->getMessage())->withInput();
        }   
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

    public function getListUserCourse(){
        $data = DB::table('users')
            ->join('user_course', 'users.id', '=', 'user_course.user_id')
            ->select('users.*','user_course.status as blocked', 'user_course.course', 'user_course.begin_date', 'user_course.id as course_id')
            ->orderBy('user_course.begin_date', 'DESC')
            ->get();
        return view('admin.user.user_course', compact('data')); 
    }

    public function getUserAddCourse($idd){
        $user_id = fdecrypt($idd); 
        $data = User::findOrFail($user_id);
        return view('admin.user.add_course', compact('user_id', 'data'));
    }

    public function postUserAddCourse(Request $request, $idd){
        $user_id = fdecrypt($idd); 
        try{
            DB::beginTransaction();
            $data = new User_Course;
            $data->user_id = $user_id;
            $data->course = $request->course;
            $data->begin_date = date("Y/m/d");
            $data->end_date = '9999-01-01';
            $data->user_create = Auth::user()->id;
            $data->status = $request->status;
            $data->save();

            DB::commit();
            return redirect()->route('get.admin.user.list.course')->with(['flash_message'=>'Chỉnh sửa thành công']);
        }catch (Exception $e) {
            DB::rollBack();
            return back()->withError($e->getMessage())->withInput();
        }   
    }

    public function getUserourseDelete($idd){
        $id = fdecrypt($idd); 
        try{
            DB::beginTransaction();
            $data = User_Course::findOrFail($id);
            $data->status = 7;
            $data->save();
            DB::commit();
            return redirect()->route('get.admin.user.list.course')->with(['flash_message'=>'Chỉnh sửa thành công']);
        }catch (Exception $e) {
            DB::rollBack();
            return back()->withError($e->getMessage())->withInput();
        }   
    }

    public function getUserCourseEdit($idd){
        $id = fdecrypt($idd); 
        $data = User_Course::findOrFail($id);
        return  view('admin.user.edit_user_course', compact('id', 'data'));
    }

    public function postUserCourseEdit(Request $request, $idd){
        $id = fdecrypt($idd); 
         try{
            DB::beginTransaction();
            $data = User_Course::findOrFail($id);
            $data->status = $request->status;
            $data->save();

            DB::commit();
            return redirect()->route('get.admin.user.list.course')->with(['flash_message'=>'Chỉnh sửa thành công']);
        }catch (Exception $e) {
            DB::rollBack();
            return back()->withError($e->getMessage())->withInput();
        }   
    }
}
