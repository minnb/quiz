<!DOCTYPE html>
<html lang="vi" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Học hiệu quả | Đăng nhập</title>
    <meta name="robots" content="noindex">
    <link type="text/css" href="{{ asset('public/dashboard/vendor/perfect-scrollbar.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('public/dashboard/css/material-icons.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('public/dashboard/css/material-icons.rtl.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('public/dashboard/css/fontawesome.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('public/dashboard/css/fontawesome.rtl.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('public/dashboard/css/app.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('public/dashboard/css/app.rtl.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('public/dashboard/css/style.css') }}" rel="stylesheet">
</head>
<body class="login">
    <div class="d-flex align-items-center" style="min-height: 100vh">
        <div class="col-sm-8 col-md-6 col-lg-4 mx-auto" style="min-width: 300px;">
            <div class="text-center mt-5 mb-1">
                <div class="avatar avatar-lg">
                    <img src="{{ asset('public/dashboard/images/logo/primary.svg') }}" class="avatar-img rounded-circle" alt="Học hiệu quả" />
                </div>
            </div>
            <div class="d-flex justify-content-center mb-5 navbar-light">
                <a href="{{ url('/') }}" class="navbar-brand m-0">HỌC HIỆU QUẢ</a>
            </div>
            <div class="card navbar-shadow">
                <div class="card-header text-center">
                    <h4 class="card-title">Đăng nhập</h4>
                    <p class="card-subtitle"></p>
                </div>
                <div class="card-body">
                    <a href="{{ URL::to('auth/google') }}" class="btn btn-light btn-block">
                        <span class="fab fa-google mr-2"></span>
                        Đăng nhập với Google
                    </a>
                    <div class="page-separator">
                        <div class="page-separator__text">or</div>
                    </div>
                    @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul class="message-errors">
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif
                    <form action="{{ route('home.login.post') }}" novalidate method="post">
                        @csrf
                        <div class="form-group">
                            <label class="form-label" for="email">Địa chỉ email:</label>
                            <div class="input-group input-group-merge">
                                <input id="email" type="email" class="form-control form-control-prepended" placeholder="Địa chỉ email" name="email" required="" value="{{ old('email') }}">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <span class="far fa-envelope"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="password">Mật khẩu:</label>
                            <div class="input-group input-group-merge">
                                <input id="password" type="password" class="form-control form-control-prepended" placeholder="Mật khẩu" name="password" required="">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <span class="far fa-key"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group ">
                            <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
                        </div>
                        <div class="text-center">
                            <a href="#" class="text-black-70" style="text-decoration: underline;">Quên mật khẩu?</a>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center text-black-50">
                    Bạn chưa có tài khoản? <a href="#">Đăng ký</a>
                </div>
            </div>
        </div>
    </div>
   <script src="{{ asset('public/dashboard/vendor/jquery.min.js') }}"></script>
    <script src="{{ asset('public/dashboard/vendor/popper.min.js') }}"></script>
    <script src="{{ asset('public/dashboard/vendor/bootstrap.min.js') }}"></script>
    <script src="{{ asset('public/dashboard/vendor/perfect-scrollbar.min.js') }}"></script>
    <script src="{{ asset('public/dashboard/vendor/dom-factory.js') }}"></script>
    <script src="{{ asset('public/dashboard/vendor/material-design-kit.js') }}"></script>
    <script src="{{ asset('public/dashboard/js/app.js') }}"></script>
    <script src="{{ asset('public/dashboard/js/hljs.js') }}"></script>
    <script src="{{ asset('public/dashboard/js/app-settings.js') }}"></script>
</body>
</html>