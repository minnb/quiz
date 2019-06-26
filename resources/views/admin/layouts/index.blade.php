@extends('admin.app')
@section('title', 'Dashboard')
@section('stylesheet')
	<link href="{{ asset('public/dashboard/quiz/css/quiz.css') }}" rel="stylesheet" type="text/css" />
@endsection
@section('content')
<div class="row">
	<div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
		<div class="card-box noradius noborder bg-default">
			<i class="fa fa-file-text-o float-right text-white"></i>
			<h6 class="text-white text-uppercase m-b-20">Bài giảng</h6>
			<h1 class="m-b-20 text-white counter">{{ number_format(App\Models\Lesson::where('status', 1)->count())}}</h1>
			<span class="text-white">{{ number_format(App\Models\Thematic::where('status', 1)->count())}} Chuyển đề</span>
		</div>
	</div>
	<div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
		<div class="card-box noradius noborder bg-warning">
			<i class="fa fa-bar-chart float-right text-white"></i>
			<h6 class="text-white text-uppercase m-b-20">Visitors</h6>
			<h1 class="m-b-20 text-white counter">250</h1>
			<span class="text-white">Bounce rate: 25%</span>
		</div>
	</div>
	<div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
		<div class="card-box noradius noborder bg-info">
			<i class="fa fa-user-o float-right text-white"></i>
			<h6 class="text-white text-uppercase m-b-20">Học viên </h6>
			<h1 class="m-b-20 text-white counter">{{ number_format(App\Models\User_Course::groupBy('user_id')->count())}}</h1>
			<span class="text-white">{{ number_format(App\Models\User_Course::groupBy('course')->count())}} khóa học được đăng ký</span>
		</div>
	</div>
	<div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
		<div class="card-box noradius noborder bg-danger">
			<i class="fa fa-bell-o float-right text-white"></i>
			<h6 class="text-white text-uppercase m-b-20">Alerts</h6>
			<h1 class="m-b-20 text-white counter">58</h1>
			<span class="text-white">5 New Alerts</span>
		</div>
	</div>
</div>
<div class="row">
	{{ App\Models\User::checkRole(App\Models\User::find(Auth::id())->email)  }}
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-6">						
		<div class="card mb-3">
			<div class="card-header">
				<h3><i class="fa fa-users"></i> Bảng ký tự đặc biệt</h3>
			</div>
			<div class="card-body">
				<table id="example1" class="table table-bordered table-responsive-xl table-hover display">
					<thead>
						<tr>
							<th>#</th>
							<th>Tên thẻ</th>
							<th>Thẻ html</th>
							<th>Hiển thị</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>Phân số</td>
							<td>{{ '<span class="fraction">48/100</span>' }}</td>
							<td style="text-align: center;">{!! '<span class="fraction">48/100</span>' !!}</td>
						</tr>
						<tr>
							<td>2</td>
							<td>Hỗn số</td>
							<td>{{ '3<span class="fraction">4/5</span>' }}</td>
							<td style="text-align: center;">{!! '3<span class="fraction">4/5</span>' !!}</td>
						</tr>
						<tr>
							<td>3</td>
							<td>Bình phương, mét vuông, mét khối</td>
							<td>{{ 'x<sup>2</sup>' }} || <span style="color:red">  {{ 'm<sup>3</sup>' }}</span></td>
							<td style="text-align: center;">{!! 'x<sup>2</sup>' !!} || <span style="color:red"> {!! 'm<sup>3</sup>' !!} </span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div>
			<?php $quiz_id = App\Models\HeaderQuiz::get(); ?>
			@foreach($quiz_id as $item)
				<span>{{$item->id }}</span><span>|</span>
			@endforeach
		</div>
	</div>
</div>
@endsection
@section('javascript')
	<script type="text/javascript" src="{{ asset('public/dashboard/quiz/js/math.js')}}"></script>
@endsection