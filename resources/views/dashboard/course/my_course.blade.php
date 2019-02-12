@extends('dashboard.app')
@section('title', 'Dashboard')
@section('content')
<div data-push data-responsive-width="992px" class="mdk-drawer-layout js-mdk-drawer-layout">
    <div class="mdk-drawer-layout__content page ">
        <div class="container-fluid page__container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Home</a></li>
                <li class="breadcrumb-item active">Khoá học của tôi</li>
            </ol>
            <div class="media mb-headings align-items-center">
                <div class="media-body">
                    <h1 class="h2">Khoá học của tôi</h1>
                </div>
            </div>
            <div class="card-columns">
                <div class="card">
                    <div class="card-header">
                        <div class="media">
                            <div class="media-left">
                                <a href="{{ route('get.dashboard.course.detail',['id'=>fencrypt(6)])}}">
                                    <img src="{{ asset('public/dashboard/images/vuejs.png') }}" alt="Card image cap" width="100" class="rounded">
                                </a>
                            </div>
                            <div class="media-body">
                                <h4 class="card-title m-0"><a href="{{ route('get.dashboard.course.detail',['id'=>fencrypt(6)])}}">Learn VueJs the easy way!</a></h4>
                                <small class="text-muted">Lessons: 3 of 7</small>
                            </div>
                        </div>
                    </div>
                    <div class="progress rounded-0">
                        <div class="progress-bar progress-bar-striped bg-primary" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="card-footer bg-white">
                        <a href="{{ route('get.dashboard.course.detail',['id'=>fencrypt(6)])}}" class="btn btn-primary btn-sm">Tiếp tục <i class="material-icons btn__icon--right">play_circle_outline</i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
