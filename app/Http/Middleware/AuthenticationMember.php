<?php
namespace App\Http\Middleware;
use Closure;
use Illuminate\Auth\Middleware\Authenticate as Middleware;
use App\Models\User;
use Auth;
class AuthenticationMember 
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (Auth::check() && User::checkRole(Auth::user()->email) == 'manager') {
            return $next($request);
        }
        return redirect('/');
    }

}
