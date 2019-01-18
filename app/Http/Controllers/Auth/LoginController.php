<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/admin';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function postLogin(Request $request){
        $request->validate([
            'email' => 'required|string|email|max:191',
            'password'=> 'required'
        ]);
        $credentials = $request->only('email', 'password');
        if(User::checkRole(trim($request->email)) == 'guest' || User::checkRole(trim($request->email)) == ''){
            return redirect()->route('home.login')->withErrors(['errors'=>'Vui lòng đăng nhập lại']);
        }else{
            if (Auth::attempt($credentials)) {
                // Authentication passed...
                return redirect()->intended('admin');
            }else{
                return back()->withErrors(['errors'=>'Địa chỉ email hoặc mật khẩu không đúng'])->withInput();
            }
        }
        
    }
    public function getLogout(){
        Auth::logout();
        return view('auth.login');
    }
}
