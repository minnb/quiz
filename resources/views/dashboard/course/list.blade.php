@extends('dashboard.app')
@section('title', 'Danh sách Khoá học')
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
                @if(isset($course_data))
                    @foreach($course_data as $key=>$item)
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex flex-column flex-sm-row">
                                        <a href="{{ route('get.dashboard.course.detail',['id'=>fencrypt($item->code)])}}" class="avatar avatar-lg avatar-4by3 mb-3 w-xs-plus-down-100 mr-sm-3">
                                            <img src="{{ asset(getImage($item->image)) }}" alt="{{$item->name}}" class="avatar-img rounded">
                                        </a>
                                        <div class="flex" style="min-width: 200px;">
                                            <!-- <h5 class="card-title text-base m-0"><a href="instructor-course-edit.html"><strong>Learn Vue.js</strong></a></h5> -->
                                            <h4 class="card-title mb-1"><a href="{{ route('get.dashboard.course.detail',['id'=>fencrypt($item->code)])}}">
                                                {{ App\Models\Course::getFullNameCourse($item->code) }}
                                            </a></h4>
                                            <div class="d-flex align-items-end">
                                                <div class="d-flex flex flex-column mr-3">
                                                    <div class="d-flex align-items-center py-1 border-bottom">
                                                        <small class="text-black-70 mr-2">Bài giảng: {{ App\Models\Lesson::countLessonByCourse($item->code) }}</small>
                                                        <small class="text-black-50"> Học viên: 34 </small>
                                                    </div>
                                                    <div class="d-flex align-items-center py-1">
                                                        <p class="text-muted">Học phí: {{ number_format($item->unit_price) }} <ins>đ</ins></p>
                                                    </div>
                                                </div>
                                                <div class="text-center">
                                                    <a href="{{ route('home.register.course.try', ['course'=>fencrypt($item->code)]) }}" class="btn btn-sm btn-white">Đăng ký học thử</a>
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
                                        <a class="dropdown-item" href="#">Chọn mua khóa học</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item text-danger" href="{{ route('home.register.course.try', ['course'=>fencrypt($item->code)]) }}">Đăng ký học thử</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @endif
            </div>
        </div>
    </div>
@endsection
