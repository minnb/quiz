@extends('admin.app')
@section('title', 'Import câu hỏi theo chuyên đề')
@section('stylesheet')
	<link href="{{ asset('public/assets/plugins/jquery.filer/css/jquery.filer.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{  asset('public/assets/plugins/jquery.filer/css/themes/jquery.filer-dragdropbox-theme.css') }}" rel="stylesheet" type="text/css" />
@endsection
@section('content')
@include('admin.layouts.flash_message')
@include('admin.layouts.alert')
<div class="container-fluid card">
	<form name="create-question" action="{{ route('post.admin.question.import.upload',['id'=>fencrypt($thematic_id)])}}" method="POST" enctype="multipart/form-data" style="padding:10px">
		<input type="hidden" name="_token" value="<?php echo csrf_token() ?>">
		<div class="row backgroud_white">
			<div class="col-md-10 offset-md-1 col-xs-12 col-sm-12">
				<div class="col-md-5">
					<label>Upload file excel</label>
					<input type="file" class="form-control" name="fileExcel" value="{{ old('fileExcel') }}" required="">
				</div>
				<hr>
				<div>
					<button type="submit" class="btn btn-danger"><i class="fa fa-cloud-upload bigfonts" aria-hidden="true"></i> Upload file</button>
				</div>	
			</div>
		</div>
	</form>
</div>
<br>
<div class="container-fluid card" style="padding:10px">
	<div>
		<form method="POST" action="#">
			<input type="hidden" name="_token" value="<?php echo csrf_token() ?>">
			<input type="hidden" name="thematic" value="{{ $thematic_id }}">
			<button type="submit" class="btn btn-info" style="margin:10px"><i class="fa fa-save bigfonts" aria-hidden="true"></i> Lưu dữ liệu</button>
		</form>
	</div>
	<hr>
	<div class="table-responsive">
		<table id="data_table" class="table table-bordered table-hover display">
			<thead>
				<tr>
					<th>#</th>
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
						<td>{{ $key + 1 }}</td>
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