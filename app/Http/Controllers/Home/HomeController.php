<?php
namespace App\Http\Controllers\Home;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Http\Requests\RegisterFormRequest;
use Illuminate\Http\Response;
use App\Models\User;
use JWTAuth; use Session;
use Validator;
use JWTFactory;
use DB; 
class HomeController extends Controller
{
    
    public function index()
    {
        return view('home.layouts.index');
    }

    
}
