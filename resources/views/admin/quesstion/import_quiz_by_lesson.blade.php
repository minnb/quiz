@extends('admin.app')
@section('title', 'Import câu hỏi quiz theo bài giảng')
@section('stylesheet')
	<link href="{{ asset('public/assets/plugins/jquery.filer/css/jquery.filer.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{  asset('public/assets/plugins/jquery.filer/css/themes/jquery.filer-dragdropbox-theme.css') }}" rel="stylesheet" type="text/css" />
@endsection
@section('content')
@include('admin.layouts.flash_message')
@include('admin.layouts.alert')
<div class="container-fluid card">
	<div class="col-lg-12">
		<form name="create-question" action="{{ route('post.admin.import.quiz.lesson',['lesson'=>fencrypt($lesson_id)])}}" method="POST" enctype="multipart/form-data" style="padding:10px">
			<input type="hidden" name="_token" value="<?php echo csrf_token() ?>">
			<h5>Bài giảng: <strong> {{ App\Models\Lesson::find($lesson_id)->name }}</strong></h5>
			<hr>
			<div class="col-lg-5">
				<div class="form-group">
					<input type="file" class="form-control" name="fileExcel" value="{{ old('fileExcel') }}" required="">
				</div>
			</div>
			<div class="col-lg-3">
				<button type="submit" class="btn btn-danger"><i class="fa fa-cloud-upload bigfonts" aria-hidden="true"></i> Upload file</button>
			</div>
		</form>
	</div>
</div>
<br>
<div class="container-fluid card" style="padding:10px">
	<div>
		<form method="POST" action="{{ route('post.admin.import.quiz.lesson.data', ['id'=>fencrypt($lesson_id)])}}">
			<input type="hidden" name="_token" value="<?php echo csrf_token() ?>">
			<input type="hidden" name="lesson" value="{{ $lesson_id }}">
			<button type="submit" class="btn btn-info" style="margin:10px"><i class="fa fa-save bigfonts" aria-hidden="true"></i> Lưu dữ liệu</button>
			<a class="btn btn-success" href="{{ route('get.admin.import.quiz.lesson.undo', ['id'=>fencrypt($lesson_id)]) }}" style="margin:10px"><i class="fa fa-undo bigfonts" aria-hidden="true"></i> Làm lại</a>
		</form>
	</div>
	<hr>
	<div class="table-responsive">
		<table id="data_table" class="table table-bordered table-hover display">
			<thead>
				<tr>
					<th>Loại</th>
					<th>Level</th>
					<th>Bài giảng</th>
					<th>#id</th>
					<th>Câu hỏi</th>
					<th>STT</th>
					<th>Câu trả lời</th>
					<th>Đáp án</th>
				</tr>
			</thead>										
			<tbody>
			@if($data->count() > 0)
				@foreach($data as $key=>$item)
					<tr>
						<td>
							@if($item->used == 0)
								<span>Quiz</span>
							@else
								<span>Practice</span>
							@endif
						</td>
						<td>{{ $item->level }}</td>
						<td>
							{{ App\Models\Lesson::find($lesson_id)->name }}
						</td>
						<td>{{ $item->question_id }}</td>
						<td>{{$item->question}}</td>
						<td>{{$item->stt}}</td>
						<td>{{$item->answer}}</td>
						@if($item->result > 0)
							<td style="color:red">
						@else
							<td>
						@endif {{$item->result}}</td>
					</tr>
				@endforeach
			@endif
			</tbody>
		</table>
	</div>
</div>
@endsection
@section('javascript')
<script src="<?php echo asset('public/assets/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js'); ?>"></script>
<script src="<?php echo asset('public/assets/plugins/waypoints/lib/jquery.waypoints.min.js') ; ?>"></script>
<script src="<?php echo asset('public/assets/plugins/counterup/jquery.counterup.min.js') ; ?>"></script>	
<script src="<?php echo asset('public/assets/plugins/jquery.filer/js/jquery.filer.min.js') ; ?>"></script>
<script src="{{ asset('public/assets/plugins/datatables/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('public/assets/plugins/datatables/dataTables.bootstrap4.min.js') }}"></script>
<script type="text/javascript">
	$(document).ready(function(){
	'use-strict';
	    $('#filer_example2').filer({
	        limit: 3,
	        maxSize: 3,
	        extensions: ['jpg', 'jpeg', 'png', 'gif', 'psd'],
	        changeInput: true,
	        showThumbs: true,
	        addMore: true
	    });
	});

	$(function() {
		$('#data_table').DataTable();
	});

</script>
@endsection