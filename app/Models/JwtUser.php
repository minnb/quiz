<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;
use App\Models\Course;
use App\Models\User;
use App\Models\Lesson;
class JwtUser extends Model
{
    protected $table ="m_users";
   	protected $fillable = [
        'first_name','last_name','email','full_name', 'email', 'password','avata','slogan','username','_token','phone'
    ];

    
}