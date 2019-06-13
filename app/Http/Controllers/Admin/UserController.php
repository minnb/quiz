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

}