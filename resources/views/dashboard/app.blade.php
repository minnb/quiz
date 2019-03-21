@include('dashboard.layouts.header')
@include('dashboard.layouts.nav')
<div class="mdk-header-layout__content">
	@yield('content')
	@include('dashboard.layouts.sidebar')
</div>
@include('dashboard.layouts.footer')
