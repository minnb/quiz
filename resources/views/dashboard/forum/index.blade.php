@extends('dashboard.app')
@section('title', 'Kết quả')
@section('content')
<div data-push data-responsive-width="992px" class="mdk-drawer-layout js-mdk-drawer-layout">
    <div class="mdk-drawer-layout__content page ">
        <div class="container-fluid page__container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item active">Diễn đàn</li>
            </ol>
            <div class="row">
                <div class="col-md-8">
                    <div class="d-flex align-items-center mb-4">
                        <h1 class="h2 flex mr-3 mb-0">Diễn đàn</h1>
                        <a href="#" class="btn btn-success">Create New Post</a>
                    </div>
                    <!-- Search -->
                    <div class="flex search-form form-control-rounded search-form--light mb-2" style="min-width: 200px;">
                        <input type="text" class="form-control" placeholder="Tìm kiếm" id="searchSample02">
                        <button class="btn pr-3" type="button" role="button"><i class="material-icons">search</i></button>
                    </div>
                    <div class="mb-4 d-flex align-items-center">
                        <small class="text-black-70 text-uppercase mr-3">Hiển thị 10 của 5,234 chủ đề</small>
                    </div>
                    @foreach($courses as $course)
                    <div class="card">
                        <div class="card-header">
                            <div class="media align-items-center">
                                <div class="media-body">
                                    <h4 class="card-title">{{App\Models\Course::getFullNameCourse($course->code)}}</h4>
                                    <p class="card-subtitle">Bài viết mới nhất</p>
                                </div>
                                <div class="media-right">
                                    <a href="#" class="btn btn-white btn-sm"><i class="material-icons">add</i></a>
                                </div>
                            </div>
                        </div>
                        <ul class="list-group list-group-fit">
                            <li class="list-group-item forum-thread">
                                <div class="media align-items-center">
                                    <div class="media-left">
                                        <div class="forum-icon-wrapper">
                                            <a href="instructor-forum-thread.html" class="forum-thread-icon">
                                                <i class="material-icons">description</i>
                                            </a>
                                            <a href="instructor-profile.html" class="forum-thread-user">
                                                <img src="assets/images/people/50/guy-1.jpg" alt="" width="20" class="rounded-circle">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        <div class="d-flex align-items-center">
                                            <a href="instructor-profile.html" class="text-body"><strong>Luci Bryant</strong></a>
                                            <small class="ml-auto text-muted">5 min ago</small>
                                        </div>
                                        <a class="text-black-70" href="instructor-forum-thread.html">Am I learning the right way?</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    @endforeach  
                </div>
            <div class="col-md-4">
                <h4>Thành viên tích cực</h4>
                <p class="text-black-70">Tham gia thường xuyên diên đàn, tích cực trao đổi và giúp đỡ các thành viên khác.</p>
                <div class="mb-4">
                    <div class="d-flex align-items-center mb-2">
                        <a href="instructor-profile.html" class="avatar avatar-sm mr-3">
                            <img src="{{ asset('public/dashboard/images/people/50/guy-1.jpg') }}" alt="course" class="avatar-img rounded-circle">
                        </a>
                        <a href="instructor-profile.html" class="flex mr-2 text-body"><strong>Luci Bryant</strong></a>
                        <span class="text-black-70 mr-2">1,233</span>
                        <i class="text-muted material-icons font-size-16pt">opacity</i>
                    </div>

                    <div class="d-flex align-items-center mb-2">
                        <a href="instructor-profile.html" class="avatar avatar-sm mr-3">
                            <img src="{{ asset('public/dashboard/images/people/50/guy-2.jpg') }}" alt="course" class="avatar-img rounded-circle">
                        </a>
                        <a href="instructor-profile.html" class="flex mr-2 text-body"><strong>Magnus Goldsmith</strong></a>
                        <span class="text-black-70 mr-2">1,230</span>
                        <i class="text-muted material-icons font-size-16pt">opacity</i>
                    </div>

                    <div class="d-flex align-items-center mb-2">
                        <a href="instructor-profile.html" class="avatar avatar-sm mr-3">
                            <img src="{{ asset('public/dashboard/images/people/50/woman-1.jpg') }}" alt="course" class="avatar-img rounded-circle">
                        </a>
                        <a href="instructor-profile.html" class="flex mr-2 text-body"><strong>Katelyn Rankin</strong></a>
                        <span class="text-black-70 mr-2">1,119</span>
                        <i class="text-muted material-icons font-size-16pt">opacity</i>
                    </div>

                    <div class="d-flex align-items-center mb-2">
                        <a href="instructor-profile.html" class="avatar avatar-sm mr-3">
                            <img src="{{ asset('public/dashboard/images/256_rsz_nicolas-horn-689011-unsplash.jpg') }}" alt="course" class="avatar-img rounded-circle">
                        </a>
                        <a href="instructor-profile.html" class="flex mr-2 text-body"><strong>Jenell D. Matney</strong></a>
                        <span class="text-black-70 mr-2">998</span>
                        <i class="text-muted material-icons font-size-16pt">opacity</i>
                    </div>

                    <div class="d-flex align-items-center mb-2">
                        <a href="instructor-profile.html" class="avatar avatar-sm mr-3">
                            <img src="{{ asset('public/dashboard/images/256_rsz_sharina-mae-agellon-377466-unsplash.jpg') }}" alt="course" class="avatar-img rounded-circle">
                        </a>
                        <a href="instructor-profile.html" class="flex mr-2 text-body"><strong>Sherri J. Cardenas</strong></a>
                        <span class="text-black-70 mr-2">950</span>
                        <i class="text-muted material-icons font-size-16pt">opacity</i>
                    </div>

                    <div class="d-flex align-items-center mb-2">
                        <a href="instructor-profile.html" class="avatar avatar-sm mr-3">
                            <img src="{{ asset('public/dashboard/images/256_rsz_karl-s-973833-unsplash.jpg') }}" alt="course" class="avatar-img rounded-circle">
                        </a>
                        <a href="instructor-profile.html" class="flex mr-2 text-body"><strong>Joseph S. Ferland</strong></a>
                        <span class="text-black-70 mr-2">652</span>
                        <i class="text-muted material-icons font-size-16pt">opacity</i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
@endsection
