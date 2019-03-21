@extends('admin.app')
@section('title', 'Thêm mới đề thi')
@section('stylesheet')
	<link href="{{ asset('public/assets/plugins/jquery.filer/css/jquery.filer.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{  asset('public/assets/plugins/jquery.filer/css/themes/jquery.filer-dragdropbox-theme.css') }}" rel="stylesheet" type="text/css" />
@endsection
@section('content')
@include('admin.layouts.flash_message')
@include('admin.layouts.alert')
<div class="container-fluid card">
	<br>
	<form name="create-question" action="{{ route('post.admin.exam.add')}}" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="_token" value="<?php echo csrf_token() ?>">
		<div class="row backgroud_white">
			<div class="col-md-10 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Tên đề thi</label>
					<input type="text" class="form-control" name="name" value="{{ old('name') }}" placeholder="" required="">
				</div>
			</div>
			<div class="col-md-1 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Thời gian (phút)</label>
					<input type="number" class="form-control" name="work_time" value="{{ old('work_time') }}" required="">
				</div>
			</div>
			<div class="col-md-1 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Số câu level 1</label>
					<input type="number" class="form-control" name="lv1" value="{{ old('lv1') }}" required="">
				</div>
			</div>
			<div class="col-md-1 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Số câu level 2</label>
					<input type="number" class="form-control" name="lv2" value="{{ old('lv2') }}" required="">
				</div>
			</div>
			<div class="col-md-1 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Số câu level 3</label>
					<input type="number" class="form-control" name="lv3" value="{{ old('lv3') }}" required="">
				</div>
			</div>
			<div class="col-md-1 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Số câu level 4</label>
					<input type="number" class="form-control" name="lv4" value="{{ old('lv4') }}" required="">
				</div>
			</div>
			<div class="col-md-3 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Hình ảnh</label>
					<input class="form-control" type="file" name="fileImage[]" id="filer_example2" multiple="multiple">
				</div>
			</div>
			<div class="col-md-3 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Loại đề thi</label>
					<select class="form-control" name="type">
						{{ selectedOption(getLoaiDeThi(),'TUAN') }}
					</select>
				</div>
			</div>
			<div class="col-md-2 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Số lượng câu hỏi</label>
					<input type="number" class="form-control" name="number_quesstion" value="{{ old('number_quesstion') }}" required="">
				</div>
			</div>
			<div class="col-md-10 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Diễn giải</label>
					<textarea rows="2" class="form-control" id="description" name="description">{{ old('description') }}</textarea>
				</div>
			</div>
		</div>
		<hr>
		<div class="row backgroud_white">
			<div class="col-md-10 offset-md-1 col-lg-12">
				<button type="submit" class="btn btn-danger"><i class="fa fa-save bigfonts" aria-hidden="true"></i> Cập nhật</button>
				<a class="btn btn-primary" href="{{ route('get.admin.exam.list') }}"><i class="fa fa-list bigfonts" aria-hidden="true"></i> Danh sách đề thi</a>
			</div>
		</div>
	</form>
	<br>
</div>
@endsection
@section('javascript')
<script src="<?php echo asset('public/assets/plugins/func_ckfinder.js'); ?>"></script>
<script src="<?php echo asset('public/assets/plugins/ckeditor/ckeditor.js'); ?>"></script>
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
	$(document).ready(function(){
        ckeditor('description')
        $('.textarea').wysihtml5();
      });
</script>
@endsection