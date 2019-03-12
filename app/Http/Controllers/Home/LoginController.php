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
use App\Models\Role_User;
use JWTAuth; use Session;
use Validator;
use JWTFactory;
use DB; 
use Socialite;
class LoginController extends Controller
{
	protected $redirectTo = '/dashboard';
	public function __construct()
    {
        $this->middleware('checkLogin')->except('logout');
    }

    public function redirectToProvider($provider)
    {
        return Socialite::driver($provider)->redirect();
    }

	public function handleProviderCallback($provider)
    {
    	$url = env('APP_API').'auth/jwt/login';
    	$user = Socialite::driver($provider)->user();
	    $authUser = $this->findOrCreateUser($user, $provider);
	    $data = ['email'=>$user->email, 'password'=>'hochieuqua@2019'];

		$client = new \GuzzleHttp\Client();
	    try {
		 	$response = $client->request('POST', $url, ['form_params' => $data]);
	        if($response->getReasonPhrase() == "OK"){
	        	$result = collect(json_decode($response->getBody()->getContents(),true));
	        	if(substr($result['token'],0,5) == '@@@@@'){
	        		return back()->withErrors(['errors'=>'Địa chỉ email hoặc mật khẩu không đúng'])->withInput();
	        	}else{
	        		$u_id = User::where('email',$user->email)->get()[0]->id;
	        		Role_User::insertRoleUser($u_id);
			        Session::put('hochieuqua_vn', $result['token']);
					Session::put('infoUser', fencrypt(json_encode($result['user'])));
	        		return redirect()->route('dashboard')->with(['flash_message'=>'Đăng nhập thành công']);
	        	}
	        	
	        }else{
	        	return redirect()->route('home.login')->with(['errors'=>'Lỗi đăng nhập, vui lòng thử lại'])->withInput();
	        }
		 }catch (Exception $e) {
            return back()->withError($e->getMessage())->withInput();
        }
    }

    public function findOrCreateUser($user, $provider)
    {
        $authUser = User::where('email', $user->email)->first();
        if ($authUser) {
            return $authUser;
        }
	    return User::create([
	            'name'     => $user->name,
	            'email'    => $user->email,
	            'provider' => $provider,
	            'provider_id' => $user->id,
	            'password' => Hash::make('hochieuqua@2019')
	        ]);
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
		$url = env('APP_API').'auth/jwt/login';

		$request->validate([
    		'email' => 'required|string|email|max:191',
            'password'=> 'required'
		]);
		
		$data = ['email'=>$request->email, 'password'=>$request->password];

		$client = new \GuzzleHttp\Client();
		 try {
		 	$response = $client->request('POST', $url, ['form_params' => $data]);

	        if($response->getReasonPhrase() == "OK"){
	        	$result = collect(json_decode($response->getBody()->getContents(),true));
	        	if(substr($result['token'],0,5) == '@@@@@'){
	        		return back()->withErrors(['errors'=>'Địa chỉ email hoặc mật khẩu không đúng'])->withInput();
	        	}else{
			        Session::put('hochieuqua_vn', $result['token']);
					Session::put('infoUser', fencrypt(json_encode($result['user'])));
	        		return redirect()->route('dashboard')->with(['flash_message'=>'Đăng nhập thành công']);
	        	}
	        	
	        }else{
	        	return redirect()->route('home.login')->with(['errors'=>'Lỗi đăng nhập, vui lòng thử lại'])->withInput();
	        }
		 }catch (Exception $e) {
            return back()->withError($e->getMessage())->withInput();
        }
       
	}    
}
