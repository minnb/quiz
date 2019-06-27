<?php
namespace App\Http\Controllers\Home;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\Http\Requests\RegisterFormRequest;
use Illuminate\Http\Response;
use App\Models\User;
use App\Models\JwtUser;
use App\Models\Role_User;
use JWTAuth; 
use Session;
use Validator;
use JWTFactory;
use DB; 
use Socialite;
class LoginController extends Controller
{
	protected $redirectTo = '/dashboard';
	public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function redirectToProvider($provider)
    {
        return Socialite::driver($provider)->redirect();
    }

	public function handleProviderCallback($provider)
    {
	   
	    try{
	    	$user = Socialite::driver($provider)->user();
	    	$authUser = $this->findOrCreateUser($user);
	    	if($authUser){
	    		Auth::login($authUser);
		    	$u_id = User::where('email',$authUser->email)->get()[0]->id;
		    	Role_User::insertRoleUser($u_id);
		    	//Session::put('hochieuqua_vn', $authUser->email);
				//Session::put('infoUser', fencrypt(json_encode($authUser)));
				//Session::save();
                //return redirect()->route('dashboard')->with(['flash_message'=>'Đăng nhập thành công']);
                if(User::checkRole(trim($authUser->email)) == 'guest'){
                    return redirect()->route('dashboard')->with(['flash_message'=>'Đăng nhập thành công']);
                }elseif(User::checkRole(trim($authUser->email)) == 'employee' || User::checkRole(trim($authUser->email)) == 'manager'){
                    return redirect()->route('admin')->with(['flash_message'=>'Đăng nhập thành công']);
                }
	    	}else{
	    		return back()->withErrors(['errors'=>'Lỗi đăng nhập'])->withInput()->with(['flash_message'=>'Vui lòng đăng nhập lại']);
	    	}
	    }catch (\Exception $e) {
            return back()->withErrors($e->getMessage())->withInput();
        }
    }

    public function findOrCreateUser($user)
    {
        $authUser = User::where('email', $user->email)->first();
        if($authUser){
            return $authUser;
        }else{
        	return User::create([
                'name' => $user->name,
                'email' => $user->email,
                'password' => bcrypt('hochieuqua@2019'),
            ]);
        }
    }

    public function getLogin(){  	
    	$value='';
    	if (Session::has('hochieuqua_vn')) {
            $value =Session::get('hochieuqua_vn') ;
        }
    	return view('dashboard.auth.login', compact('value'));
    }

	public function postLogin(Request $request)
	{
		$request->validate([
            'email' => 'required|string|email|max:191',
            'password'=> 'required'
        ]);
        $credentials = $request->only('email', 'password');
        if(User::checkRole(trim($request->email)) == 'guest' || User::checkRole(trim($request->email)) == ''){
             if (Auth::attempt($credentials)){
                return redirect()->route('dashboard')->with(['flash_message'=>'Đăng nhập thành công']);
             }else{
                return back()->withErrors(['errors'=>'Địa chỉ email hoặc mật khẩu không đúng'])->withInput();
             }
            //return redirect()->route('home.login')->withErrors(['errors'=>'Vui lòng đăng nhập lại']);
        }else{
            if (Auth::attempt($credentials) && User::checkRole(trim($request->email)) == 'manager') {
                // Authentication passed...
                return redirect()->intended('admin');
            }else{
                return back()->withErrors(['errors'=>'Địa chỉ email hoặc mật khẩu không đúng'])->withInput();
            }
        }
	}    
}
