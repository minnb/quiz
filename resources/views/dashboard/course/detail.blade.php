@extends('dashboard.app')
@section('title', 'Khóa học')
@section('stylesheet')
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="{{ asset('public/dashboard/quiz/js/TemplateQuestion.js') }}"></script>
    <script src="{{ asset('public/dashboard/quiz/js/ServiceQuestion.js') }}"></script>
    <script src="{{ asset('public/dashboard/quiz/js/ServiceCommon.js') }}"></script>
    <script src="{{ asset('public/dashboard/quiz/js/Http.js') }}"></script>
    <script src="{{ asset('public/dashboard/quiz/js/test_question.js') }}"></script>
    <link rel="stylesheet" href="{{ asset('public/dashboard/quiz/css/style.css') }}">
    <style type="text/css">
        [dir=ltr] .modal-backdrop{
            display: none;
        }
    </style>
@endsection
@section('content')
<div data-push data-responsive-width="992px" class="mdk-drawer-layout js-mdk-drawer-layout" id="test_question">
    <div class="mdk-drawer-layout__content page ">
        <div class="container-fluid page__container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="{{ route('get.dashboard.course.mycourse') }}">Khóa học</a></li>
                <li class="breadcrumb-item active">{{ App\Models\Course::getFullNameCourse($course_id) }}</li>
            </ol>
            <h1 class="h2">{{ $lesson_data[0]->name }}</h1>
            <div class="row">
                <div class="col-md-8">
                    <div class="card">
                        <div class="embed-responsive embed-responsive-16by9">
                             <iframe class="embed-responsive-item" src="{!! $lesson_data[0]->link_video !!}" allowfullscreen=""></iframe>
                        </div>

                        <div class="card-body">
                           {!! $lesson_data[0]->description !!}
                           <!--
                           <a href="{{ route('get.dashboard.quiz.take',['type'=>fencrypt('QUIZ'),'course'=>fencrypt($lesson_data[0]->course),'thematic'=>fencrypt($lesson_data[0]->thematic), 'lesson'=>fencrypt($lesson_data[0]->id), 'token'=>getToken(20)])}}" class="btn btn-sm btn-danger" onclick='start_test()'>Luyệt tập Quiz</a>
                       -->
<?php 
        $type = 'QUIZ';
        $course = $lesson_data[0]->course;
        $thematic = $lesson_data[0]->thematic;
        $lesson = $lesson_data[0]->id;
        $token = getToken(20);
?>
    <button class="btn btn-sm btn-danger" onclick='start_test(<?php echo json_encode($type); ?>, <?php echo json_encode($course); ?>, <?php echo json_encode($thematic); ?>, <?php echo json_encode($lesson); ?>, <?php echo json_encode($token); ?>)'>
    Luyệt tập Quiz</button>
                        </div>
                    </div>
                    <ul class="card list-group list-group-fit">
                        @foreach($lesson_data as $key=>$item)
                            @if($key == 0)
                                <li class="list-group-item active">
                            @else
                                <li class="list-group-item">
                            @endif
                                <div class="media">
                                    <div class="media-left">
                                        <div class="text-muted">{{ $key + 1}}.</div>
                                    </div>
                                    <div class="media-body">
                                        @if($user_status == 0)
                                            @if($item->trial == 1)
                                                @if($key == 0)
                                                    <a href="{{ route('get.dashboard.course.detail.lesson',['course'=>fencrypt($item->course), 'lesson'=>fencrypt($item->id)])}}" class="text-white">
                                                @else
                                                        <a href="{{ route('get.dashboard.course.detail.lesson',['course'=>fencrypt($item->course), 'lesson'=>fencrypt($item->id)])}}">
                                                @endif
                                                {{ $item->name }}</a>
                                            @else
                                                {{ $item->name }}
                                            @endif
                                        @else
                                            @if($key == 0)
                                                <a href="{{ route('get.dashboard.course.detail.lesson',['course'=>fencrypt($item->course), 'lesson'=>fencrypt($item->id)])}}" class="text-white">
                                            @else
                                                <a href="{{ route('get.dashboard.course.detail.lesson',['course'=>fencrypt($item->course), 'lesson'=>fencrypt($item->id)])}}">
                                            @endif
                                            {{ $item->name }}</a>
                                        @endif

                                    </div>
                                    <div class="media-right">
                                        <small class="text-muted-light">
                                            @if($user_status == 0)
                                                @if($item->trial == 0) 
                                                    <span>PRO</span> 
                                                @else
                                                    <span>Free</span>
                                                @endif
                                            @endif    
                                        </small>
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
                                <strong>{{ App\Models\Course::getFullNameCourse($lesson_data[0]->course) }}</strong>
                            </a>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <?php $teacher = App\Models\Teacher::find($lesson_data[0]->teacher); ?>
                                    <img src="{{ asset($teacher->avata) }}" alt="" width="50" class="rounded-circle">
                                </div>
                                <div class="media-body">
                                    <h4 class="card-title"><a href="student-profile.html">{{ $teacher->name }}</a></h4>
                                    <p class="card-subtitle">Giảng viên</p>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <p>{!! $teacher->description !!}</p>
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

<div id="unit_test" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="titleUnitTest">Bài tập trắc nghiệm </h4>
                    </div>
                    <div class="modal-body">
                        <div id="templateQuestion">

                        </div>
                    </div>
                    <div class="modal-footer buttons">
                        <button type="button " onclick="previewAnswer()" class="btn btn-success preview"><i
                                class="fa fa-angle-double-left" aria-hidden="true"></i> Preview </button>
                        <button type="button" onclick="markTest()" class="btn btn-success finish">Nộp bài</button>
                        <button type="button " onclick="nextAnswer()" class="btn btn-success next">Next <i
                                class="fa fa-angle-double-right" aria-hidden="true"></i> </i></button>

                    </div>
                </div>

            </div>
        </div>

    <div class="container disappear" id="answer_question">
        <div class="title">Đáp án câu trả lời</div>
        <div class="content">
        </div>
    </div>
@endsection
@section('javascript')
@endsection

