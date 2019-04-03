@extends('dashboard.app')
@section('title', 'Thú vị, hữu ích và hiệu quả')
@section('content')
<div data-push data-responsive-width="992px" class="mdk-drawer-layout js-mdk-drawer-layout">
    <div class="mdk-drawer-layout__content page ">

        <div class="container-fluid page__container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">HỌC HIỆU QUẢ</a></li>
                <li class="breadcrumb-item active">Dashboard</li>
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
                                            <img src="{{ asset(getImage($item->image)) }}" alt="{{ App\Models\Course::getFullNameCourse($item->code) }}" class="avatar-img rounded">
                                        </a>
                                        <div class="flex" style="min-width: 200px;">
                                            <!-- <h5 class="card-title text-base m-0"><a href="instructor-course-edit.html"><strong>Learn Vue.js</strong></a></h5> -->
                                            <h4 class="card-title mb-1"><a href="{{ route('home.register.course.try', ['course'=>fencrypt($item->code)]) }}">
                                                {{ App\Models\Course::getFullNameCourse($item->code) }}
                                            </a></h4>
                                            <p class="text-black-70"></p>
                                            <div class="d-flex align-items-end">
                                                <div class="d-flex flex flex-column mr-3">
                                                    <div class="d-flex align-items-center py-1 border-bottom">
                                                        <small class="text-black-70 mr-2">Bài giảng: {{ App\Models\Lesson::countLessonByCourse($item->code) }}</small>
                                                        <small class="text-black-50"> Học viên: {{App\Models\User_Course::where('course', $item->code)->count() }} </small>
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
                                        <a class="dropdown-item text-danger" href="{{ route('home.register.course.try', ['course'=>fencrypt($item->course)]) }}">Học thử</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @endif
            </div>
            <div class="row">
                <div class="col-lg-7">
                    <div class="card">
                        <div class="card-header">
                            <div class="media align-items-center">
                                <div class="media-body">
                                    <h4 class="card-title">Bài giảng</h4>
                                    <p class="card-subtitle">Bài giảng gần đây</p>
                                </div>
                                <div class="media-right">
                                    <a class="btn btn-sm btn-primary" href="{{ route('get.dashboard.course.mycourse') }}">Khoá học của tôi</a>
                                </div>
                            </div>
                        </div>
                        @if(isset($lesson_recent))
                        <ul class="list-group list-group-fit mb-0" style="z-index: initial;">
                            @foreach($lesson_recent as $key=>$item)
                                <li class="list-group-item" style="z-index: initial;">
                                    <div class="d-flex align-items-center">
                                        <a href="{{ route('get.dashboard.course.detail.lesson',['course'=>fencrypt($item->course), 'lesson'=>fencrypt($item->id)])}}" class="avatar avatar-4by3 avatar-sm mr-3">
                                            <img src="{{ asset(getImage($item->image)) }}" alt="course" class="avatar-img rounded">
                                        </a>
                                        <div class="flex">
                                            <a href="{{ route('get.dashboard.course.detail.lesson',['course'=>fencrypt($item->course), 'lesson'=>fencrypt($item->id)])}}" class="text-body"><strong>{{ $item->name }}</strong></a>
                                            <div class="d-flex align-items-center">
                                                <div class="progress" style="width: 100px;">
                                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                                <small class="text-muted ml-2">25%</small>
                                            </div>
                                        </div>
                                        <div class="dropdown ml-3">
                                            <a href="#" class="dropdown-toggle text-muted" data-caret="false" data-toggle="dropdown">
                                                <i class="material-icons">more_vert</i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="{{ route('get.dashboard.course.detail.lesson',['course'=>fencrypt($item->course), 'lesson'=>fencrypt($item->id)])}}">Tiếp tục</a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            @endforeach
                        </ul>
                        @endif
                    </div>

                    <div class="card">
                        <div class="card-header">
                            <div class="media align-items-center">
                                <div class="media-body">
                                    <h4 class="card-title">Luyện thi</h4>
                                    <p class="card-subtitle">Thống kê gần đây</p>
                                </div>
                                <div class="media-right">
                                    <a class="btn btn-sm btn-primary" href="{{ route('get.dashboard.result.table.point', ['user_id'=>fencrypt(App\Models\User::getInfoUser()['id'])])}}">Sổ điểm của tôi</a>
                                </div>
                            </div>
                        </div>
                        <?php $lstQuiz = App\Models\HeaderQuiz::getListQuiz(5); ?>
                        <ul class="list-group list-group-fit mb-0">
                            @if($lstQuiz->count()>0)
                                @foreach($lstQuiz as $key=>$item)
                                    <li class="list-group-item">
                                        <div class="media align-items-center">
                                            <div class="media-body">
                                                <a class="text-body" href="{{ route('get.dashboard.quiz.take.result.detail', ['quiz_id'=>fencrypt($item->id)])}}"><strong>
                                                    @if($item->lesson != '' || $item->lesson != '0')
                                                        Quiz: {{ App\Models\Lesson::find($item->lesson)->name }}
                                                    @else
                                                        Luyện thi: Môn {{ App\Models\Subject::find($item->subject)->name }} - <small>Tuần {{$item->week}}</small>
                                                    @endif
                                                </strong></a><br>
                                                <div class="d-flex align-items-center">
                                                    <small class="text-black-50 text-uppercase mr-2">Khóa học</small>
                                                    <a href="{{ route('get.dashboard.course.mycourse')}}">{{ App\Models\Course::getFullNameCourse($item->course) }}</a>
                                                </div>
                                            </div>
                                            <div class="media-right text-center d-flex align-items-center">
                                                <span class="text-black-50 mr-3">{{ xeploai(calcPoint($item->total, $item->kq)) }}</span>
                                                <h4 class="mb-0">{{ calcPoint($item->total, $item->kq) }}</h4>
                                            </div>
                                        </div>
                                    </li>
                                @endforeach
                            @else
                                <li class="list-group-item">
                                    <div class="media align-items-center">
                                        <div class="media-body">
                                            <a class="text-body" href="student-quiz-results.html"><strong>Chưa có bài thi nào</strong></a><br>
                                            <div class="d-flex align-items-center">
                                                <small class="text-black-50 text-uppercase mr-2"></small>
                                                <a href="student-take-course.html"></a>
                                            </div>
                                        </div>
                                        <div class="media-right text-center d-flex align-items-center">
                                            <span class="text-black-50 mr-3"></span>
                                            <h4 class="mb-0"></h4>
                                        </div>
                                    </div>
                                </li>
                            @endif

                        </ul>
                    </div>
                </div>
                <div class="col-lg-5">

                    <div class="card">
                        <div class="card-header">
                            <div class="media align-items-center">
                                <div class="media-body">
                                    <h4 class="card-title">Diễn đàn</h4>
                                    <p class="card-subtitle">Bài viết mới</p>
                                </div>
                                <div class="media-right">
                                    <a class="btn btn-sm btn-primary" href="{{route('get.forum.index')}}"> <i class="material-icons">keyboard_arrow_right</i></a>
                                </div>
                            </div>
                        </div>
                       <ul class="list-group list-group-fit">
                            <li class="list-group-item forum-thread">
                                <div class="media align-items-center">
                                    <div class="media-left">
                                        <div class="forum-icon-wrapper">
                                            <a href="student-forum-thread.html" class="forum-thread-icon">
                                                <i class="material-icons">description</i>
                                            </a>
                                            <a href="#" class="forum-thread-user">
                                                <img src="assets/images/people/50/guy-1.jpg" alt="" width="20" class="rounded-circle">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        <div class="d-flex align-items-center">
                                            <a href="" class="text-body"><strong>Luci Bryant</strong></a>
                                            <small class="ml-auto text-muted">5 min ago</small>
                                        </div>
                                        <a class="text-black-70" href="student-forum-thread.html">Am I learning the right way?</a>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item forum-thread">
                                <div class="media align-items-center">
                                    <div class="media-left">
                                        <div class="forum-icon-wrapper">
                                            <a href="#" class="forum-thread-icon">
                                                <i class="material-icons">description</i>
                                            </a>
                                            <a href="student-profile.html" class="forum-thread-user">
                                                <img src="assets/images/people/50/guy-2.jpg" alt="" width="20" class="rounded-circle">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        <div class="d-flex align-items-center">
                                            <a href="#" class="text-body"><strong>Magnus Goldsmith</strong></a>
                                            <small class="ml-auto text-muted">7 min ago</small>
                                        </div>
                                        <a class="text-black-70" href="student-forum-thread.html">Can someone help me with the basic Setup?</a>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item forum-thread">
                                <div class="media align-items-center">
                                    <div class="media-left">
                                        <div class="forum-icon-wrapper">
                                            <a href="#" class="forum-thread-icon">
                                                <i class="material-icons">description</i>
                                            </a>
                                            <a href="student-profile.html" class="forum-thread-user">
                                                <img src="assets/images/people/50/woman-1.jpg" alt="" width="20" class="rounded-circle">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        <div class="d-flex align-items-center">
                                            <a href="#" class="text-body"><strong>Katelyn Rankin</strong></a>
                                            <small class="ml-auto text-muted">12 min ago</small>
                                        </div>
                                        <a class="text-black-70" href="student-forum-thread.html">I think this is the right way?</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>

    </div>
@endsection
