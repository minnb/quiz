<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Học Hiệu Quả | @yield('title')</title>
  <link href="{{ asset('public/home/plugins/jquery-ui/jquery-ui.css') }}" rel="stylesheet">
  <link href="{{ asset('public/home/plugins/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">
  <link href="{{ asset('public/home/plugins/font-awesome/css/font-awesome.min.css') }}" rel="stylesheet">
  <link href="{{ asset('public/home/plugins/rs-plugin/css/settings.css') }}" rel="stylesheet" >
  <link href="{{ asset('public/home/plugins/selectbox/select_option1.css') }}" rel="stylesheet">
  <link href="{{ asset('public/home/plugins/owl-carousel/owl.carousel.css') }}" rel="stylesheet">
  <link href="{{ asset('public/home/plugins/fancybox/jquery.fancybox.min.css') }}" rel="stylesheet">
  <link href="{{ asset('public/home/plugins/isotope/isotope.css') }}" rel="stylesheet">
  <link href="{{ asset('public/home/plugins/animate/animate.css') }}" rel="stylesheet">
  <!-- GOOGLE FONT -->
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Dosis:400,300,600,700' rel='stylesheet' type='text/css'>
  <!-- CUSTOM CSS -->
  <link href="{{ asset('public/home/css/app.css') }}" rel="stylesheet">
  <link rel="stylesheet" href="{{ asset('public/home/css/default.css') }}" id="option_color">
  <!-- Icons -->
  <link rel="shortcut icon" href="{{ asset('public/home/img/favicon.png') }}">
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="body-wrapper">
  <div id="preloader" class="smooth-loader-wrapper">
    <div class="smooth-loader">
      <div class="loader">
        <span class="dot dot-1"></span>
        <span class="dot dot-2"></span>
        <span class="dot dot-3"></span>
        <span class="dot dot-4"></span>
      </div>
    </div>
  </div>
  <div class="main-wrapper">
    <header id="pageTop" class="header-wrapper">
      <div class="container-fluid color-bar top-fixed clearfix">
        <div class="row">
          <div class="col-sm-1 col-xs-2 bg-color-1">fix bar</div>
          <div class="col-sm-1 col-xs-2 bg-color-2">fix bar</div>
          <div class="col-sm-1 col-xs-2 bg-color-3">fix bar</div>
          <div class="col-sm-1 col-xs-2 bg-color-4">fix bar</div>
          <div class="col-sm-1 col-xs-2 bg-color-5">fix bar</div>
          <div class="col-sm-1 col-xs-2 bg-color-6">fix bar</div>
          <div class="col-sm-1 bg-color-1 hidden-xs">fix bar</div>
          <div class="col-sm-1 bg-color-2 hidden-xs">fix bar</div>
          <div class="col-sm-1 bg-color-3 hidden-xs">fix bar</div>
          <div class="col-sm-1 bg-color-4 hidden-xs">fix bar</div>
          <div class="col-sm-1 bg-color-5 hidden-xs">fix bar</div>
          <div class="col-sm-1 bg-color-6 hidden-xs">fix bar</div>
        </div>
      </div>
      <div class="top-info-bar bg-color-7 hidden-xs">
        <div class="container">
          <div class="row">
            <div class="col-sm-7">
              <ul class="list-inline topList">
                <li><i class="fa fa-envelope bg-color-1" aria-hidden="true"></i> <a href="mailto:hotro@hochieuqua.vn">hotro@hochieuqua.vn</a></li>
                <li><i class="fa fa-phone bg-color-2" aria-hidden="true"></i> 0914 718 806</li>
              </ul>
            </div>
            <?php $checkUser = App\Models\User::getInfoUser(); ?>
            <div class="col-sm-5">
              <ul class="list-inline functionList">
                <li style="float:right">                 
                @if(Session::has('hochieuqua_vn'))
                  <i class="fa fa-user bg-color-5" aria-hidden="true"></i> <a href="{{ route('dashboard')}}">{{ $checkUser['name'] }}</a><span>
                    <i class="fa fa-sign-in bg-color-3" aria-hidden="true"></i>
                  </span><a href="{{ route('dashboard.logout') }}" >Thoát</a>
                @else
                  <i class="fa fa-unlock-alt bg-color-5" aria-hidden="true"></i> <a href='#loginModal' data-toggle="modal" > Đăng nhập</a><span>
                    <i class="fa fa-registered bg-color-3" aria-hidden="true"></i>
                  </span><a href='#createAccount' data-toggle="modal">Đăng ký</a>
                @endif
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      @include('home.layouts.nav')