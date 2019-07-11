<?php
namespace App\Http\Middleware;
use Closure;
use Auth;
use App\Models\User; 
use App\Models\Course; 
class RedirectIfMemberNotMember
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
        if (Auth::check()) {
            if(Course::checkMemberDashboard()){
                return redirect('dashboard');
            }else{
                return redirect('/');
            }
        }
        return $next($request);
    }
}
