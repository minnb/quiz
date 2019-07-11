@extends('admin.app')
@section('title', 'Chỉnh sửa nội dung câu hỏi')
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
					<label>Nội dung câu hỏi </label> 
					<textarea class="form-control" name="name" placeholder="Nội dung câu hỏi" rows="3">{{ old('name', isset($data) ? $data['name'] : '') }}</textarea> 
				</div>

				<div class="form-group">
					<label>Hình ảnh minh họa</label>
					<input class="form-control" type="file" name="fileImage[]" id="filer_example0" multiple="multiple">
					@if($data['image'] != '')
						<img src="{{ asset($data['image']) }}" class="thumbnail">
					@endif
				</div>
			</div>
			<div class="col-md-3 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Trạng thái</label>
					<select class="form-control" name="status">
						{{ selectedOption(getStatus(), old('status', isset($data) ? $data['status'] : 1)) }}
					</select>
				</div>
				<div class="form-group">
					<label>Cấp độ</label>
					<select class="form-control" name="level">
						{{ selectedOption(getLevelQuestion(), old('level', isset($data) ? $data['level'] : 1) )}}
					</select>
				</div>
				<div class="form-group">
					@if($data['type']!='value')
					<label style="color:red">Đáp án đúng</label>
					@endif
					@if($data['type']=='radio')
						<select class="form-control" name="result">
							{{ selectedOption(getAnswerNumber(), App\Models\Answer::getAswerTrue($id) )}}
						</select>
					@elseif($data['type']=='checkbox')
						@foreach($answer as $k=>$value)
							<div>
								Đáp án {{$k+1}}	<input type="checkbox" name="anserChoose[]" @if($value->result > 0) checked="true" @endif > 				
							</div>
						@endforeach
					@endif
				</div>
			</div>
			<hr>
			<div class="col-md-10 offset-md-1 col-xs-12 col-sm-12">
				@if(isset($answer))
					@foreach($answer as $key=>$value)
					<input type="hidden" name="{{$value->id}}" value="{{$value->id}}">
					<div class="col-md-6 col-xs-12 col-sm-12">
						<div class="form-group">
							<label style="color:blue">Đáp án {{$key+1}}</label>
							<input class="form-control" type="text" name="answer[]" value="{{ $value->name }}">
						</div>
						<div class="form-group">
							<label>Hình ảnh</label>
							<input class="form-control" type="file" name="fileImage2[]" id="filer_example{{$key+1}}" multiple="multiple">
							@if($value['image'] != '')
								<img src="{{ asset($value['image']) }}" class="thumbnail">
							@endif
						</div>
					</div>
					<hr>
					@endforeach
				@endif
			</div>
		</div>
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
	    $('#filer_example0').filer({
	        limit: 3,
	        maxSize: 3,
	        extensions: ['jpg', 'jpeg', 'png', 'gif', 'psd'],
	        changeInput: true,
	        showThumbs: true,
	        addMore: true
	    });
	    $('#filer_example1').filer({
	        limit: 3,
	        maxSize: 3,
	        extensions: ['jpg', 'jpeg', 'png', 'gif', 'psd'],
	        changeInput: true,
	        showThumbs: true,
	        addMore: true
	    });
	    $('#filer_example2').filer({
	        limit: 3,
	        maxSize: 3,
	        extensions: ['jpg', 'jpeg', 'png', 'gif', 'psd'],
	        changeInput: true,
	        showThumbs: true,
	        addMore: true
	    });
	    $('#filer_example3').filer({
	        limit: 3,
	        maxSize: 3,
	        extensions: ['jpg', 'jpeg', 'png', 'gif', 'psd'],
	        changeInput: true,
	        showThumbs: true,
	        addMore: true
	    });
	    $('#filer_example4').filer({
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