@extends('admin.app')
@section('title', 'Tạo câu hỏi')
@section('stylesheet')
	<link href="{{ asset('public/assets/plugins/jquery.filer/css/jquery.filer.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{  asset('public/assets/plugins/jquery.filer/css/themes/jquery.filer-dragdropbox-theme.css') }}" rel="stylesheet" type="text/css" />
@endsection
@section('content')
@include('admin.layouts.flash_message')
@include('admin.layouts.alert')
<div class="container-fluid card">
	<br>
	<form name="create-question" action="{{ route('post.admin.quesstion.edit', ['id'=>fencrypt($id)])}}" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="_token" value="<?php echo csrf_token() ?>">
		<div class="row backgroud_white">
			<div class="col-md-6 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label><b>Chỉnh sửa câu hỏi: <strong>{{ App\Models\Thematic::getCourseByThematic($data['thematic']) }}</strong></b></label>
					<input type="text" class="form-control" name="name" value="Chuyên đề: {{ App\Models\Thematic::find($data['thematic'])->name }}" placeholder="" readonly="true">
				</div>
				<div class="form-group">
					<label>Nội dung Câu hỏi</label>
					<textarea class="form-control" name="name" placeholder="Nội dung câu hỏi" rows="3">{{ old('name', isset($data) ? $data['name'] : '') }}</textarea> 
				</div>

				<div class="form-group">
					<label>Hình ảnh</label>
					<input class="form-control" type="file" name="fileImage[]" id="filer_example2" multiple="multiple">
					@if($data['image'] != '')
						<img src="{{ asset($data['image']) }}" class="thumbnail">
					@endif
				</div>
				<hr>
				@if(isset($answer))
					@foreach($answer as $key=>$value)
						<div class="form-group">
							<label>Đáp án {{$key+1}}</label>
							<input class="form-control" type="text" name="answer[]" value="{{ $value->name }}">
						</div>
					@endforeach
				@endif
			</div>
			<div class="col-md-3 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Trạng thái</label>
					<select class="form-control" name="used">
						{{ selectedOption(getStatus(), old('status', isset($data) ? $data['status'] : 1)) }}
					</select>
				</div>
				<div class="form-group">
					<label>Sử dụng</label>
					<select class="form-control" name="used">
						{{ selectedOption(getQuizUsed(), old('used', isset($data) ? $data['used'] : 1)) }}
					</select>
				</div>
				<div class="form-group">
					<label>Cấp độ</label>
					<select class="form-control" name="level">
						{{ selectedOption(getLevelQuestion(), old('level', isset($data) ? $data['level'] : 1) )}}
					</select>
				</div>
				<div class="form-group">
					<label>Loại câu trả lời</label>
					<select class="form-control" name="type">
						{{ selectedOption(getTypeAnswer(),'radio') }}
					</select>
				</div>
				<div class="form-group">
					<label style="color:red">Đáp án đúng</label>
					<select class="form-control" name="result">
						{{ selectedOption(getAnswerNumber(), App\Models\Answer::getAswerTrue($id) )}}
					</select>
				</div>
			</div>
		</div>
		<hr>
		<div class="row backgroud_white">
			<div class="col-md-10 offset-md-1 col-lg-12">
				<button type="submit" class="btn btn-danger"><i class="fa fa-save bigfonts" aria-hidden="true"></i> Cập nhật</button>
				<a class="btn btn-primary" href="{{ route('get.admin.exam.list') }}"><i class="fa fa-list bigfonts" aria-hidden="true"></i> Danh sách câu hỏi</a>
			</div>
		</div>
	</form>
	<br>
</div>
@endsection
@section('javascript')
<script src="<?php echo asset('public/assets/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js'); ?>"></script>
<script src="<?php echo asset('public/assets/plugins/waypoints/lib/jquery.waypoints.min.js') ; ?>"></script>
<script src="<?php echo asset('public/assets/plugins/counterup/jquery.counterup.min.js') ; ?>"></script>	
<script src="<?php echo asset('public/assets/plugins/jquery.filer/js/jquery.filer.min.js') ; ?>"></script>
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
</script>
@endsection