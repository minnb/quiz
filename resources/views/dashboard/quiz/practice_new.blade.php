@extends('dashboard.app')
@section('title', 'Kết quả')
@section('content')
<div data-push data-responsive-width="992px" class="mdk-drawer-layout js-mdk-drawer-layout">
    <div class="mdk-drawer-layout__content page ">

        <div class="container-fluid page__container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item active">Luyện thi</li>
            </ol>
            @foreach($course as $value)
            <?php   
                $thematic = App\Models\Thematic::where('course',$value->course)->orderBy('sort')->get(); 
                $hk = App\Models\Exam::where('type','like','HK%')->orderBy('type')->get(); 
            ?>
            <div class="card-columns">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <div class="flex">
                            <h4 class="card-title">{{App\Models\Course::getFullNameCourse($value->course)}}</h4>
                            <div class="card-subtitle">Luyện thi học kỳ</div>
                        </div>
                        <i class="material-icons text-muted-light">info_outline</i>
                    </div>
                    <ul class="list-group list-group-fit">
                        @foreach($hk as $key=>$item)
                        <li class="list-group-item">
                            <a href="{{ route('get.dashboard.period.take', ['type'=>fencrypt($item->type), 'course'=>fencrypt($value->course), 'token'=>getToken(20)])}}"><i class="material-icons float-right text-muted-light">trending_flat</i><span class="text-muted">{{ $key+1 }}</span>. {{ $item->name }}</a>
                        </li>
                        @endforeach
                    </ul>
                </div>
            </div>
            <div class="card-columns">
                @if($thematic->count() > 0)
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <div class="flex">
                            <h4 class="card-title">{{App\Models\Course::getFullNameCourse($value->course)}}</h4>
                            <div class="card-subtitle">Luyện thi theo chuyên đề</div>
                        </div>
                        <i class="material-icons text-muted-light">info_outline</i>
                    </div>
                    <ul class="list-group list-group-fit">
                        @foreach($thematic as $key=>$item)
                        <li class="list-group-item">
                            <a href="{{ route('get.dashboard.quiz.thematic',['type'=>fencrypt('CHUYENDE'),'course'=>fencrypt($item->course),'thematic'=>fencrypt($item->id),'token'=>getToken(20)]) }}"><i class="material-icons float-right text-muted-light">trending_flat</i><span class="text-muted">{{ $key+1 }}</span>. {{ $item->name }}</a>
                        </li>
                        @endforeach
                    </ul>
                </div>
                @endif
            </div>
            @endforeach
        </div>
    </div>

@endsection
