@extends('dashboard.app')
@section('title', 'Khoá học của tôi')
@section('content')
<div data-push data-responsive-width="992px" class="mdk-drawer-layout js-mdk-drawer-layout">
    <div class="mdk-drawer-layout__content page ">
        <div class="container-fluid page__container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item active">Khoá học của tôi</li>
            </ol>
            <div class="media mb-headings align-items-center">
                <div class="media-body">
                    <h1 class="h2">Khoá học của tôi</h1>
                </div>
            </div>
            <div class="card-columns">
                @if($user_course->count() > 0)
                    @foreach($user_course as $item)
                        <?php $course_name = App\Models\Course::getFullNameCourse($item->course); ?>
                        <div class="card">
                            <div class="card-header">
                                <div class="media">
                                    <div class="media-left">
                                        <a href="{{ route('get.dashboard.course.detail',['id'=>fencrypt($item->course)])}}">
                                            <img src="{{ asset('public/dashboard/images/vuejs.png') }}" alt="{{ $course_name }}" width="100" class="rounded">
                                        </a>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="card-title m-0"><a href="{{ route('get.dashboard.course.detail',['id'=>fencrypt($item->course)])}}">
                                            {{ $course_name }}</a></h4>
                                        <small class="text-muted">Bài giảng: {{ App\Models\Lesson::countLessonByCourse($item->course) }}</small>
                                    </div>
                                </div>
                            </div>
                            <div class="progress rounded-0">
                                <div class="progress-bar progress-bar-striped bg-primary" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <div class="card-footer bg-white">
                                <a href="{{ route('get.dashboard.course.detail',['id'=>fencrypt($item->course)])}}" class="btn btn-primary btn-sm">Tiếp tục <i class="material-icons btn__icon--right">play_circle_outline</i></a>
                            </div>
                        </div>
                    @endforeach
                @else
                    <div class="card">
                        <div class="card-header">
                            <div class="media-body">
                                <p class="card-title m-0">Bạn chưa đăng ký khoá học nào</p>
                            </div>
                        </div>
                    </div>
                @endif
            </div>
        </div>
    </div>
@endsection
