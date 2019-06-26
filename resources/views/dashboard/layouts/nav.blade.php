<div id="header" data-fixed class="mdk-header js-mdk-header mb-0">
    <div class="mdk-header__content">
        <nav id="default-navbar" class="navbar navbar-expand navbar-dark bg-primary m-0">
            <div class="container-fluid">
                <!-- Toggle sidebar -->
                <button class="navbar-toggler d-block" data-toggle="sidebar" type="button">
                    <span class="material-icons">menu</span>
                </button>
                <!-- Brand -->
                <a href="{{ route('dashboard')}}" class="navbar-brand">
                    <img src="{{ asset('public/dashboard/images/logo/white.svg') }}" class="mr-2" alt="Học Hiệu Quả" />
                    <span class="d-none d-xs-md-block">HỌC HIỆU QUẢ</span>
                </a>
                <div class="flex"></div>
                <!-- Menu -->
                <ul class="nav navbar-nav flex-nowrap d-none d-lg-flex">
                    <li class="nav-item">
                        <a class="nav-link" href="{{route('get.forum.index')}}">Diễn đàn</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Trợ giúp</a>
                    </li>
                </ul>
                <!-- Menu -->
                <ul class="nav navbar-nav flex-nowrap">
                    <li class="nav-item dropdown ml-1 ml-md-3">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"><img src="{{ asset('public/dashboard/images/people/50/guy-6.jpg')}}" alt="Avatar" class="rounded-circle" width="40"></a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#" style="color:blue">
                                <i class="material-icons">person</i>
                                {{ Auth::user()->name  }}
                            </a>
                            <a class="dropdown-item" href="#">
                                <i class="material-icons">edit</i> Thay đổi thông tin
                            </a>
                            <a class="dropdown-item" href="#">
                                <i class="material-icons">person</i> Thông tin cá nhân
                            </a>
                            <a class="dropdown-item" href="{{ route('dashboard.logout') }}">
                                <i class="material-icons">lock</i> Thoát
                            </a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>
