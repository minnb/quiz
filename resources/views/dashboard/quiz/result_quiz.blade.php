@extends('dashboard.app')
@section('title', 'Kết quả')
@section('stylesheet')
    <link href="{{ asset('public/dashboard/quiz/css/quiz.css') }}" rel="stylesheet" type="text/css" />
        <meta name="csrf-token" content="<?= csrf_token() ?>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="{{ asset('public/dashboard/quiz/js/TemplateQuestion.js') }}"></script>
    <script src="{{ asset('public/dashboard/quiz/js/ServiceQuestion.js') }}"></script>
    <script src="{{ asset('public/dashboard/quiz/js/ServiceCommon.js') }}"></script>
    <script src="{{ asset('public/dashboard/quiz/js/Http.js') }}"></script>
    <script src="{{ asset('public/dashboard/quiz/js/test_question.js') }}"></script>
    <link rel="stylesheet" href="{{ asset('public/dashboard/quiz/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('public/dashboard/css/sweetalert.css') }}">
    <style type="text/css">
        [dir=ltr] .modal-backdrop{
            display: none;
        }
    </style>
@endsection
@section('content')
	<div data-push data-responsive-width="992px" class="mdk-drawer-layout js-mdk-drawer-layout">
        <div class="mdk-drawer-layout__content page ">

            <div class="container-fluid page__container">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dasboard</a></li>
                    <li class="breadcrumb-item active">Kết quả luyện tập</li>
                </ol>
                <div class="card">
                    <div class="card-header">
                        <h2 style="font-family: Arial">Kết quả</h2>
                        <p class="text-muted">Khóa học: {{ App\Models\Course::getFullNameCourse($data_result['course'])}}</p>
                        <p class="text-muted">Chuyên đề: {{ App\Models\Thematic::find($data_result['thematic'])->name}}</p>
                    </div>
                    <div class="card-body media align-items-center">
                        <div class="media-body">
                            <h4 class="mb-0"><span style="color:blue; font-size:180%;">{{ number_format($point, 1, '.', '') }}</span> điểm</h4>
                            <span class="text-muted-light">{{ App\Models\XepLoai::getXepLoai($point) }}</span>
                        </div>
                        <div class="media-right">
                            <?php 
                                $test_id = $quiz_id;
                            ?>
                            <button class="btn btn-primary" onclick='test_again(<?php echo json_encode($test_id); ?>)'>
                                Luyệt tập Quiz <i class="material-icons btn__icon--right">refresh</i>
                            </button>
                            <!--
                            <a href="{{ route('get.dashboard.take.again', ['quiz_id'=>fencrypt($quiz_id)])}}" class="btn btn-primary">Luyện tập lại <i class="material-icons btn__icon--right">refresh</i></a>
                            -->
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Câu hỏi</h4>
                    </div>
                    <ul class="list-group list-group-fit mb-0">
                        @foreach($answer_result as $key=>$item)
                        <li class="list-group-item">
                            <div class="media">
                                <div class="media-left">
                                    <div class="text-muted-light">{{$key+1}}.</div>
                                </div>
                                <div class="media-body">{!! App\Models\Quesstion::find($item->question_id)->name !!}</div>
                                <div class="media-right">
                                    @if($item->result == 1)
                                        <span class="badge badge-success ">Đúng </span>
                                    @ELSE
                                        <span class="badge badge-danger  ">Sai </span>
                                    @endif
                                </div>
                            </div>
                        </li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>

        @include('dashboard.layouts.form_quiz')
@endsection
@section('javascript')
<script type="text/javascript" src="{{ asset('public/dashboard/quiz/js/math.js')}}"></script>
<script type="text/javascript" src="{{ asset('public/dashboard/vendor/sweetalert.min.js')}}"></script>
<script type="text/javascript" src="{{ asset('public/dashboard/js/sweetalert.js')}}"></script>
@endsection