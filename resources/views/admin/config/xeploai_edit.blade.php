@extends('admin.app')
@section('title', 'Chửa sửa xếp loại - đánh giá')
@section('stylesheet')
	<link href="{{ asset('public/assets/plugins/jquery.filer/css/jquery.filer.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{  asset('public/assets/plugins/jquery.filer/css/themes/jquery.filer-dragdropbox-theme.css') }}" rel="stylesheet" type="text/css" />
@endsection
@section('content')
@include('admin.layouts.flash_message')
@include('admin.layouts.alert')
<div class="container-fluid card">
	<br>
	<form name="create-question" action="{{ route('post.admin.config.xeploai.edit', ['id'=>fencrypt($id)])}}" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="_token" value="<?php echo csrf_token() ?>">
		<div class="row backgroud_white">
			<div class="col-md-10 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Xếp loại</label>
					<input type="text" class="form-control" name="name" value="{{ old('name', isset($data) ? $data['name'] : '' ) }}" placeholder="" required="">
				</div>
			</div>
			<div class="col-md-10 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Nhận xét - đánh giá</label>
					<textarea  class="form-control" id="description" name="description">{{ old('description', isset($data) ? $data['description'] : 0) }}</textarea>
				</div>
			</div>
		</div>
		<hr>
		<div class="row backgroud_white">
			<div class="col-md-1 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label style="color:blue">Điểm từ</label>
					<input type="number" class="form-control css_number" name="from_point" value="{{ old('from_point', isset($data) ? $data['from_point'] : 0) }}" required="">
				</div>
			</div>
			<div class="col-md-1 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label style="color:red">Đến điểm</label>
					<input type="number" class="form-control css_number" name="to_point" value="{{ old('to_point', isset($data) ? $data['to_point'] : 0) }}" required="">
				</div>
			</div>
		</div>
		<hr>
		<div class="row backgroud_white">
			<div class="col-md-10 offset-md-1 col-lg-12">
				<button type="submit" class="btn btn-danger"><i class="fa fa-save bigfonts" aria-hidden="true"></i> Cập nhật</button>
				<a class="btn btn-primary" href="{{ route('get.admin.config.xeploai') }}"><i class="fa fa-list bigfonts" aria-hidden="true"></i> Xếp loại</a>
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