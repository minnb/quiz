<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use App\Http\Requests\RegisterFormRequest;
use Illuminate\Http\Response;
use App\Models\User;
use App\Models\Role_User;
use JWTAuth;
use Validator;
use JWTFactory;
use DB; 
class UserController extends Controller
{

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:255|unique:users',
            'name' => 'required',
            'password'=> 'required'
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors());
        }
        try{
            DB::beginTransaction();
            User::create([
                'name' => $request->get('name'),
                'email' => $request->get('email'),
                'password' => bcrypt($request->get('password')),
            ]);

            $user = User::first();
            $user_id = $user->id;
            Role_User::create([
                'user_id' => $user_id,
                'role_id' => 3
            ]);

            DB::commit();

            $token = JWTAuth::fromUser($user);
            return response()->json(compact('token'));
            
        }catch (Exception $e) {
            DB::rollBack();
            return response(['token'=>'@@@@@@500'])->header('Content-Type', 'text/plain');
        }
       
    }
    
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');
        try {
            if (! $token = JWTAuth::attempt($credentials)) 
            {
                return response(['token'=>'@@@@@@401'])->header('Content-Type', 'text/plain');
            }else{

            }
        } catch (JWTException $e) {
            return response(['token'=>'@@@@@@500'])->header('Content-Type', 'text/plain');
        }
        $user = JWTAuth::user();
        return response()->json(compact('token','user'));
    }

    public function user(Request $request)
    {
        $user = Auth::user();

        if ($user) {
            return response($user, Response::HTTP_OK);
        }

        return response(null, Response::HTTP_BAD_REQUEST);
    }

    /**
     * Log out
     * Invalidate the token, so user cannot use it anymore
     * They have to relogin to get a new token
     *
     * @param Request $request
     */
    public function logout(Request $request) {
        $this->validate($request, ['token' => 'required']);
        
        try {
            JWTAuth::invalidate($request->input('token'));
            return response()->json('You have successfully logged out.', Response::HTTP_OK);
        } catch (JWTException $e) {
            return response()->json('Failed to logout, please try again.', Response::HTTP_BAD_REQUEST);
        }
    }

    public function refresh()
    {
        return response(JWTAuth::getToken(), Response::HTTP_OK);
    }

    public function getUserInfo(Request $request){
        $user = JWTAuth::toUser($request->token);
        return response()->json(['result' => $user]);
    }
}