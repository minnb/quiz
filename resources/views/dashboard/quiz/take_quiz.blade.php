@extends('dashboard.app')
@section('title', 'Làm bài kiểm tra')
@section('content')
<div data-push data-responsive-width="992px" class="mdk-drawer-layout js-mdk-drawer-layout">
    <div class="mdk-drawer-layout__content page ">
        <div class="container-fluid page__container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard')}}">Dashboard</a></li>
                <li class="breadcrumb-item active">Làm bài kiểm tra</li>
            </ol>
            <div class="card">
                <div class="card-header">
                    <div class="media align-items-center">
                        <div class="media-left">
                            <h4 class="mb-0"><strong>#9</strong> > </h4>
                        </div>
                        <div class="media-body">
                            <h4 class="card-title">
                                Github command to deploy comits?
                            </h4>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-group">
                <div class="card">
                    <div class="card-body text-center">
                        <h4 class="mb-0"><strong>25</strong></h4>
                        <small class="text-muted-light">Tổng</small>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body text-center">
                        <h4 class="text-success mb-0"><strong>3</strong></h4>
                        <small class="text-muted-light">Đúng</small>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body text-center">
                        <h4 class="text-danger mb-0"><strong>5</strong></h4>
                        <small class="text-muted-light">Sai</small>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body text-center">
                        <h4 class="text-primary mb-0"><strong>17</strong></h4>
                        <small class="text-muted-light">Còn lại</small>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <div class="media align-items-center">
                        <div class="media-left">
                            <h4 class="mb-0"><strong>#9</strong></h4>
                        </div>
                        <div class="media-body">
                            <h5 class="card-title">
                                Github command to deploy comits?
                            </h5>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <div class="custom-control custom-checkbox">
                            <input id="customCheck01" type="checkbox" class="custom-control-input">
                            <label for="customCheck01" class="custom-control-label">git push</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="custom-control custom-checkbox">
                            <input id="customCheck02" type="checkbox" class="custom-control-input">
                            <label for="customCheck02" class="custom-control-label">git commit -m "message"</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="custom-control custom-checkbox">
                            <input id="customCheck03" type="checkbox" class="custom-control-input">
                            <label for="customCheck03" class="custom-control-label">git pull</label>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <button class="btn btn-white">Bỏ qua</button>
                    <button type="submit" class="btn btn-success float-right">Xác nhận <i class="material-icons btn__icon--right">send</i></button>
                </div>
            </div>
        </div>
    </div>

    <div class="mdk-drawer js-mdk-drawer" data-align="end">
        <div class="mdk-drawer__content ">
            <div class="sidebar sidebar-right sidebar-light bg-white o-hidden" data-perfect-scrollbar>
                <div class="sidebar-p-y">
                    <div class="sidebar-heading">Thời gian</div>
                    <div class="countdown sidebar-p-x" data-value="4" data-unit="hour"></div>
                    <div class="sidebar-heading">Còn lại</div>

                    <ul class="list-group list-group-fit">
                        <li class="list-group-item active">
                            <a href="#">
                                <span class="media align-items-center">
                                    <span class="media-left">
                                        <span class="btn btn-white btn-circle">#9</span>
                                    </span>
                                    <span class="media-body">
                                        Github command to deploy comits?
                                    </span>
                                </span>
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <span class="media align-items-center">
                                    <span class="media-left">
                                        <span class="btn btn-white btn-circle">#10</span>
                                    </span>
                                    <span class="media-body">
                                        What's the difference between private and public repos?
                                    </span>
                                </span>
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <span class="media align-items-center">
                                    <span class="media-left">
                                        <span class="btn btn-white btn-circle">#11</span>
                                    </span>
                                    <span class="media-body">
                                        What is the purpose of a branch?
                                    </span>
                                </span>
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <span class="media align-items-center">
                                    <span class="media-left">
                                        <span class="btn btn-white btn-circle">#12</span>
                                    </span>
                                    <span class="media-body">
                                        Final Question?
                                    </span>
                                </span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</div>
@endsection
@section('javascript')
	<script src="{{ asset('public/dashboard/vendor/jquery.countdown.min.js') }}"></script>
	<script src="{{ asset('public/dashboard/js/countdown.js') }}"></script>
@endsection