<!DOCTYPE html>
<html lang="en" ng-app="app-quiz">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>@yield('title') | Học hiệu quả | Dashboard</title>
	<meta name="description" content="Học hiệu quả | Dashboard">
	<meta name="author" content="Học hiệu quả">
	<link rel="shortcut icon" href="{{ asset('public/assets/images/favicon.ico') }}">
	<link href="{{ asset('public/assets/css/bootstrap.min.css') }}" rel="stylesheet" type="text/css" />
	<link href="{{ asset('public/assets/font-awesome/css/font-awesome.min.css') }}" rel="stylesheet" type="text/css" />
	<link href="{{ asset('public/assets/css/style.css') }}" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
    @yield('stylesheet')
    <script type="text/javascript">
        var baseURL = "{!! url('/') !!}";
        window.setTimeout(function() {
            $("#flash-message").fadeTo(500, 0).slideUp(500, function(){
            $(this).remove();
            });
        }, 5000);
    </script>
</head>
<body class="adminbody">
<div id="main">
	<div class="headerbar">
        <div class="headerbar-left">
			<a href="{{ route('admin') }}" class="logo"><img alt="Logo" src="{{ asset('public/assets/images/logo.png') }}" /> <span>Admin</span></a>
        </div>
        <nav class="navbar-custom">
            <ul class="list-inline float-right mb-0">
                <li class="list-inline-item dropdown notif">
                    <a class="nav-link dropdown-toggle nav-user" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                        <img src="{{ asset('public/assets/images/avatars/admin.png') }}" alt="Profile image" class="avatar-rounded">
                    </a>
                    <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                        <div class="dropdown-item noti-title">
                            <h5 class="text-overflow"><small>{{ Auth::user()->name }}</small> </h5>
                        </div>
                        <a href="{{ route('admin.logout') }}"" class="dropdown-item notify-item">
                            <i class="fa fa-power-off"></i> <span>Logout</span>
                        </a>
                    </div>
                </li>
            </ul>
            <ul class="list-inline menu-left mb-0">
                <li class="float-left">
                    <button class="button-menu-mobile open-left">
						<i class="fa fa-fw fa-bars"></i>
                    </button>
                </li>                        
            </ul>
        </nav>
	</div>