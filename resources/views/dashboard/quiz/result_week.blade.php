@extends('dashboard.app')
@section('title', 'Kết quả')
@section('content')
	<div data-push data-responsive-width="992px" class="mdk-drawer-layout js-mdk-drawer-layout">
        <div class="mdk-drawer-layout__content page ">

            <div class="container-fluid page__container">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dasboard</a></li>
                    <li class="breadcrumb-item active">Kết quả luyên thi tuần</li>
                </ol>
                <div class="card">
                    <div class="card-header">
                        <h2 style="font-family: Arial">Kết quả</h2>
                        <p class="text-muted">Môn học: {{ App\Models\Subject::find($data_result['subject'])->name}}</p>
                        <p class="text-muted">Bài luyện thi - Tuần {{ $data_result['week'] }}</p>
                    </div>
                    <div class="card-body media align-items-center">
                        <div class="media-body">
                            <h4 class="mb-0"><span style="color:blue; font-size:180%;">{{ number_format($point, 1, '.', '') }}</span> điểm</h4>
                            <span class="text-muted-light">{{ xeploai($point) }}</span>
                        </div>
                        <div class="media-right">
                            <a href="{{ route('get.dashboard.take.again', ['quiz_id'=>fencrypt($quiz_id)])}}" class="btn btn-danger"><i class="material-icons btn__icon--right">refresh</i>&nbsp; Luyện thi lại</a>
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
                                    @if($item->answer == $item->result)
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
@endsection
