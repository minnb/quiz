@extends('admin.app')
@section('title', 'Import excel câu hỏi')
@section('stylesheet')
	<link href="{{ asset('public/assets/plugins/jquery.filer/css/jquery.filer.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{  asset('public/assets/plugins/jquery.filer/css/themes/jquery.filer-dragdropbox-theme.css') }}" rel="stylesheet" type="text/css" />
@endsection
@section('content')
@include('admin.layouts.flash_message')
@include('admin.layouts.alert')
<div class="container-fluid card">
	<div class="col-lg-12">
		<form name="create-question" action="{{ route('post.admin.exam.import.excel',['course'=>$course, 'type'=>fencrypt($type)])}}" method="POST" enctype="multipart/form-data" style="padding:10px">
			<input type="hidden" name="_token" value="<?php echo csrf_token() ?>">
			<h5>Kỳ thi: <strong> {{ $exam_data[0]->name }}</strong> - Khóa học: <strong>{{ App\Models\Course::getFullNameCourse($course)}}</strong></h5>
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
		<form method="POST" action="{{ route('post.admin.exam.import.data', ['course'=>$course, 'type'=>fencrypt($type)])}}">
			<input type="hidden" name="_token" value="<?php echo csrf_token() ?>">
			<input type="hidden" name="lesson" value="{{ $type }}">
			<button type="submit" class="btn btn-info" style="margin:10px"><i class="fa fa-save bigfonts" aria-hidden="true"></i> Lưu dữ liệu</button>
			<a class="btn btn-success" href="{{ route('get.admin.exam.import.undo',['type'=>fencrypt($type)]) }}" style="margin:10px">
				<i class="fa fa-undo bigfonts" aria-hidden="true"></i> Làm lại
			</a>
		</form>
	</div>
	<hr>
	<div class="table-responsive">
		<table id="data_table" class="table table-bordered table-hover display">
			<thead>
				<tr>
					<th>Kỳ thi</th>
					<th>Khóa học</th>
					<th>Level</th>
					<th>#id</th>
					<th>Câu hỏi</th>
					<th>STT</th>
					<th>Câu trả lời</th>
					<th>Đáp án</th>
				</tr>
			</thead>										
			<tbody>
			@if(isset($data))
				@foreach($data as $key=>$item)
					<tr>
						<td>{{ App\Models\Exam::getName($type) }}</td>
						<td>{{ App\Models\Course::getFullNameCourse($course)}}</td>
						<td>{{ $item->level }}</td>
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