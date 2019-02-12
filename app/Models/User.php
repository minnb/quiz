<?php
namespace App\Models;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Tymon\JWTAuth\Contracts\JWTSubject;
use App\Models\Role;
use App\Models\Role_User;use Session;
class User extends Authenticatable implements JWTSubject
{
    use Notifiable;
    protected $table ="users";
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function roles()
    {
      return $this
        ->belongsToMany('App\Models\Role')
        ->withTimestamps();
    }

    public function authorizeRoles($roles)
    {
      if ($this->hasAnyRole($roles)) {
        return true;
      }
      return false;
    }
    
    public function hasAnyRole($roles)
    {
      if (is_array($roles)) {
        foreach ($roles as $role) {
          if ($this->hasRole($role)) {
            return true;
          }
        }
      } else {
        if ($this->hasRole($roles)) {
          return true;
        }
      }
      return false;
    }

    public function hasRole($role)
    {
      if ($this->roles()->where('name', $role)->first()) {
        return true;
      }
      return false;
    }

    public static function getRoleName($id){
      $role = Role_User::where('user_id', $id)->get();
      $roleName = '';
      if($role->count()>0){
        $roleName = Role::find($role[0]->role_id)->name;
      }
      return $roleName;
    }

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }

    public static function checkRole($email){
      $roleName = '';
      $user = User::where('email', $email)->get();
      if($user->count()>0){
        $user_id = $user[0]->id;
        $roleName = User::getRoleName($user_id);
      }
      return $roleName;
    }

    public static function getInfoUser(){
      $infoUser = '';
      if (Session::has('infoUser')) {
          $infoUser = fdecrypt(Session::get('infoUser'));
      }
      return json_decode($infoUser,true);
    }

}
