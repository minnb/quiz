@include('admin.layouts.header')
@include('admin.layouts.sidebar')
<div class="content-page">
    <div class="content">
		<div class="container-fluid">
            <div class="row">
                <div class="col-xl-12">
                    <div class="breadcrumb-holder">
                        <h1 class="main-title float-left">@yield('title')</h1>
                        <ol class="breadcrumb float-right">
                            <li class="breadcrumb-item">Home</li>
                            <li class="breadcrumb-item active">@yield('title')</li>
                        </ol>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
			@yield('content')
        </div>
	</div>
</div>
@include('admin.layouts.footer')
