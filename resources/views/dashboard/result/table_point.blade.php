@extends('dashboard.app')
@section('title', 'Bảng điểm')
@section('content')
	<div data-push data-responsive-width="992px" class="mdk-drawer-layout js-mdk-drawer-layout">
        <div class="mdk-drawer-layout__content page ">

            <div class="container-fluid page__container">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dasboard</a></li>
                    <li class="breadcrumb-item active">Bảng điểm</li>
                </ol>
                @if($course->count() > 0)
                @foreach($course as $c)
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <div class="flex">
                                <h4 class="card-title">{{App\Models\Course::getFullNameCourse($c->course) }}</h4>
                                <p class="card-subtitle">Kết quả luyện thi</p>
                            </div>
                            <a class="#" href="instructor-earnings.html">Điểm</a>
                        </div>
                        <ul class="list-group list-group-fit mb-0">
                            @if($quiz_header->count() > 0)
                                @foreach($quiz_header as $item)
                                    @if($item->course == $c->course)
                                        <?php $point = calcPoint($item->total, $item->kq); ?>
                                        <li class="list-group-item">
                                            <div class="media align-items-center">
                                                <div class="media-body">
                                                    <a href="{{ route('get.dashboard.quiz.take.result.detail', ['id'=>fencrypt($item->id)])}}" class="text-body"><strong>{{ 
                                                        $item->lesson > 0 ? App\Models\Lesson::find($item->lesson)->name : App\Models\Thematic::find($item->thematic)->name
                                                    }}</strong></a>
                                                </div>
                                                <div class="media-right">
                                                    <div class="text-center">
                                                        <span style="font-size: 13px">{{xeploai($point)}}</span>
                                                        <span style="font-size: 17px" class="badge badge-pill badge-primary">{{ number_format($point, 1, '.', '')}}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    @endif
                                @endforeach
                            @endif
                        </ul>
                    </div>
                @endforeach
                @endif
            </div>
        </div>
@endsection
