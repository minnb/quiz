<?php
namespace App\Http\Middleware;
use Closure;
use Session;
class RedirectIfMemberNotLogin
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
        if (Session::has('hochieuqua_vn')) {
            return redirect('/dashboard');
        }
        return $next($request);
    }
}
