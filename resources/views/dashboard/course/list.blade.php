@extends('dashboard.app')
@section('title', 'Dashboard')
@section('content')
<div data-push data-responsive-width="992px" class="mdk-drawer-layout js-mdk-drawer-layout">
    <div class="mdk-drawer-layout__content page ">
        <div class="container-fluid page__container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Home</a></li>
                <li class="breadcrumb-item active">Danh sách Khoá học</li>
            </ol>
            <div class="media mb-headings align-items-center">
                <div class="media-body">
                    <h1 class="h2">Danh sách Khoá học</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">

                            <div class="d-flex flex-column flex-sm-row">
                                <a href="instructor-course-edit.html" class="avatar avatar-lg avatar-4by3 mb-3 w-xs-plus-down-100 mr-sm-3">
                                    <img src="assets/images/vuejs.png" alt="Card image cap" class="avatar-img rounded">
                                </a>
                                <div class="flex" style="min-width: 200px;">
                                    <!-- <h5 class="card-title text-base m-0"><a href="instructor-course-edit.html"><strong>Learn Vue.js</strong></a></h5> -->
                                    <h4 class="card-title mb-1"><a href="instructor-course-edit.html">Learn Vue.js</a></h4>
                                    <p class="text-black-70">Let’s start with a quick tour of Vue’s data binding features.</p>
                                    <div class="d-flex align-items-end">
                                        <div class="d-flex flex flex-column mr-3">
                                            <div class="d-flex align-items-center py-1 border-bottom">
                                                <small class="text-black-70 mr-2">&dollar;1,230/mo</small>
                                                <small class="text-black-50">34 SALES</small>
                                            </div>
                                            <div class="d-flex align-items-center py-1">
                                                <small class="text-muted mr-2">GULP</small>
                                                <small class="text-muted">INTERMEDIATE</small>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <a href="instructor-course-edit.html" class="btn btn-sm btn-white">Học thử</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="card__options dropdown right-0 pr-2">
                            <a href="#" class="dropdown-toggle text-muted" data-caret="false" data-toggle="dropdown">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="instructor-course-edit.html">Edit course</a>
                                <a class="dropdown-item" href="#">Course Insights</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item text-danger" href="#">Delete course</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">

                            <div class="d-flex flex-column flex-sm-row">
                                <a href="instructor-course-edit.html" class="avatar avatar-lg avatar-4by3 mb-3 w-xs-plus-down-100 mr-sm-3">
                                    <img src="assets/images/nodejs.png" alt="Card image cap" class="avatar-img rounded">
                                </a>
                                <div class="flex" style="min-width: 200px;">
                                    <!-- <h5 class="card-title text-base m-0"><a href="instructor-course-edit.html"><strong>Npm &amp; Gulp Advanced Workflow</strong></a></h5> -->
                                    <h4 class="card-title mb-1"><a href="instructor-course-edit.html">Npm &amp; Gulp Advanced Workflow</a></h4>
                                    <p class="text-black-70">Learn the basics of Github and become a power Github developer.</p>
                                    <div class="d-flex align-items-end">
                                        <div class="d-flex flex flex-column mr-3">
                                            <div class="d-flex align-items-center py-1 border-bottom">
                                                <small class="text-black-70 mr-2">&dollar;421/mo</small>
                                                <small class="text-black-50">12 SALES</small>
                                            </div>
                                            <div class="d-flex align-items-center py-1">
                                                <small class="text-muted mr-2">GULP</small>
                                                <small class="text-muted">INTERMEDIATE</small>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <a href="instructor-course-edit.html" class="btn btn-sm btn-white">Học thử</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="card__options dropdown right-0 pr-2">
                            <a href="#" class="dropdown-toggle text-muted" data-caret="false" data-toggle="dropdown">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="instructor-course-edit.html">Edit course</a>
                                <a class="dropdown-item" href="#">Course Insights</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item text-danger" href="#">Delete course</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
