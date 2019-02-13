@extends('dashboard.app')
@section('title', 'Khóa học')
@section('content')
<div data-push data-responsive-width="992px" class="mdk-drawer-layout js-mdk-drawer-layout">
    <div class="mdk-drawer-layout__content page ">
        <div class="container-fluid page__container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="{{ route('get.dashboard.course.mycourse') }}">Khóa học</a></li>
                <li class="breadcrumb-item active">{{ App\Models\Course::getFullNameCourse($course_id) }}</li>
            </ol>
            <h1 class="h2">{{ $lesson_detail['name'] }}</h1>
            <div class="row">
                <div class="col-md-8">
                    <div class="card">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="{!! $lesson_data[0]->link_video !!}" allowfullscreen=""></iframe>
                        </div>
                        <div class="card-body">
                           {!! $lesson_detail['description'] !!}
                           <a href="{{ route('get.dashboard.quiz.take',['type'=>fencrypt('CHUYENDE'), 'course'=>fencrypt($lesson_detail['course']),'thematic'=>fencrypt($lesson_detail['thematic']), 'id'=>fencrypt($lesson_detail['id'])])}}" class="btn btn-sm btn-danger">Luyệt tập Quiz</a>
                           <a href="#" class="btn btn-sm btn-success">Hoàn thành bài học</a>
                        </div>
                    </div>
                    <!-- Lessons -->
                    <ul class="card list-group list-group-fit">
                        @foreach($lesson_data as $key=>$item)
                            @if($item->id == $lesson_id)
                                <li class="list-group-item active">
                            @else
                                <li class="list-group-item">
                            @endif
                                <div class="media">
                                    <div class="media-left">
                                        <div class="text-muted">{{ $key + 1}}.</div>
                                    </div>
                                    <div class="media-body">
                                         @if($item->id == $lesson_id)
                                            <a href="{{ route('get.dashboard.course.detail.lesson',['course'=>fencrypt($item->course), 'lesson'=>fencrypt($item->id)])}}" class="text-white">{{ $item->name }}</a>
                                        @else
                                            <a href="{{ route('get.dashboard.course.detail.lesson',['course'=>fencrypt($item->course), 'lesson'=>fencrypt($item->id) ])}}">{{ $item->name }}</a>
                                        @endif
                                    </div>
                                    <div class="media-right">
                                        <small class="text-muted-light">2:03</small>
                                    </div>
                                </div>
                            </li>
                        @endforeach
                    </ul>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <a href="#" class="btn btn-white btn-block flex-column">Khoá học
                                <strong>{{ App\Models\Course::getFullNameCourse($lesson_detail['course']) }}</strong>
                            </a>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <img src="{{ asset('public/dashboard/images/people/110/guy-6.jpg') }}" alt="About Adrian" width="50" class="rounded-circle">
                                </div>
                                <div class="media-body">
                                    <h4 class="card-title"><a href="student-profile.html">Đặng Văn Hiếu</a></h4>
                                    <p class="card-subtitle">Giảng viên</p>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <p>Người truyền cảm hứng toán học cho hàng nghìn học sinh trên cả nước, giúp trên 2000 học sinh trên cả nước luyện thi và đỗ vào các trường chuyên chất lượng cao trong các kì thi tuyển sinh Trung học cơ sở và Trung học phổ thông.</p>
                            <a href="" class="btn btn-light"><i class="fab fa-facebook"></i></a>
                        </div>
                    </div>
                    <div class="card">
                        <ul class="list-group list-group-fit">
                            <li class="list-group-item">
                                <div class="media align-items-center">
                                    <div class="media-left">
                                        <i class="material-icons text-muted-light">assessment</i>
                                    </div>
                                    <div class="media-body">
                                        Beginner
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="media align-items-center">
                                    <div class="media-left">
                                        <i class="material-icons text-muted-light">schedule</i>
                                    </div>
                                    <div class="media-body">
                                        2 <small class="text-muted">hrs</small> &nbsp; 26 <small class="text-muted">min</small>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Ratings</h4>
                        </div>
                        <div class="card-body">
                            <div class="rating">
                                <i class="material-icons">star</i>
                                <i class="material-icons">star</i>
                                <i class="material-icons">star</i>
                                <i class="material-icons">star</i>
                                <i class="material-icons">star_border</i>
                            </div>
                            <small class="text-muted">20 ratings</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
