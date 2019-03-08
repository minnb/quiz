@extends('dashboard.app')
@section('title', 'Kết quả')
@section('content')
	<div data-push data-responsive-width="992px" class="mdk-drawer-layout js-mdk-drawer-layout">
                <div class="mdk-drawer-layout__content page ">

                    <div class="container-fluid page__container">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                            <li class="breadcrumb-item active">Luyện tập</li>
                        </ol>
                        <div class="media mb-headings align-items-center">
                            <div class="media-body">
                                <h1 class="h2">Luyện tập đề thi</h1>
                            </div>
                        </div>
                        <div class="card-columns">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <div class="flex">
                                        <h4 class="card-title">Thi theo chuyên đề</h4>
                                        <div class="card-subtitle">{{App\Models\Course::getFullNameCourse($course_code)}}</div>
                                    </div>
                                    <i class="material-icons text-muted-light">info_outline</i>
                                </div>
                                @if(isset($lessonOfUser))
                                <ul class="list-group list-group-fit">
                                    @foreach($lessonOfUser as $key=>$item)
                                    <li class="list-group-item">
                                        <a href="{{ route('get.dashboard.quiz.take',['type'=>fencrypt('CHUYENDE'),'course'=>fencrypt($course_code),'thematic'=>fencrypt($item->id), 'id'=>fencrypt(0)]) }}"><i class="material-icons float-right text-muted-light">trending_flat</i>{{ $key+1 }}. {{ $item->name }}</a>
                                    </li>
                                    @endforeach
                                </ul>
                                @endif
                            </div>

                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <div class="flex">
                                        <h4 class="card-title">Thi tháng</h4>
                                        <div class="card-subtitle">{{App\Models\Course::getFullNameCourse($course_code)}}</div>
                                    </div>
                                    <i class="material-icons text-muted-light">info_outline</i>
                                </div>
                                <ul class="list-group list-group-fit">
                                    <li class="list-group-item">
                                        <a href="#"><i class="material-icons float-right text-muted-light">trending_flat</i> Tháng 1</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <div class="flex">
                                        <h4 class="card-title">Thi học kỳ</h4>
                                        <div class="card-subtitle">{{App\Models\Course::getFullNameCourse($course_code)}}</div>
                                    </div>
                                    <i class="material-icons text-muted-light">info_outline</i>
                                </div>
                                <ul class="list-group list-group-fit">
                                    <li class="list-group-item">
                                        <a href="">
                                            <i class="material-icons float-right text-muted-light">trending_flat</i>
                                            Học kỳ 1
                                        </a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href=""><i class="material-icons float-right text-muted-light">trending_flat</i> Học kỳ 2</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>

@endsection
