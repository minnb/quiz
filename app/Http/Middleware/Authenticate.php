<?php
namespace App\Http\Middleware;
use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Closure;
use Auth;
use App\Models\User; 
class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return string
     */
    protected function redirectTo($request)
    {
        /*
        if (Auth::check()) {
            return $next($request);
        }
        return route('home.login');
        */
        if (! $request->expectsJson()) {
            return route('home.login');
        }
        
    }
}
