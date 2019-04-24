@extends('admin.app')
@section('title', 'Chỉnh sửa khoá học')
@section('stylesheet')
	<link href="{{ asset('public/assets/plugins/jquery.filer/css/jquery.filer.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{  asset('public/assets/plugins/jquery.filer/css/themes/jquery.filer-dragdropbox-theme.css') }}" rel="stylesheet" type="text/css" />
@endsection
@section('content')
@include('admin.layouts.flash_message')
<div class="container-fluid card">
	<br>
	<form name="create-question" action="{{ route('post.admin.course.edit', ['id'=>fencrypt($course_id)] )}}" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="_token" value="<?php echo csrf_token() ?>">
		<div class="row backgroud_white">
			<div class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Lớp</label>
					<select class="form-control" name="class" disabled="">
						<option>{{ App\Models\ClassRoom::find($data['class'])->name }}</option>
					</select>
				</div>
				<div class="form-group">
					<label>Khoá học</label>
					<select class="form-control" name="course" disabled="">
						{{ selectedOption(getKhoahoc(),old('course', isset($data) ? $data['course'] : 0 )) }}
					</select>
				</div>
				<div class="form-group">
					<label>Link video</label>
					<input type="text" name="link_video" class="form-control" value="{{ old('link_video', isset($data) ? $data['link_video'] : '')}}" placeholder="">  
				</div>
				<div class="form-group">
					<label>Trạng thái</label>
					<select class="form-control" name="status">
						{{ selectedOption(getStatus(), old('status', isset($data) ? $data['status'] : 1 )) }}
					</select>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Học phí</label>
					<input class="form-control" type="number" name="unit_price" value="{{ old('unit_price', isset($data) ? $data['unit_price'] : 0 )}}" >
				</div>
				<div class="form-group">
					<label>Hình ảnh (270x230px)</label>
					<input class="form-control" type="file" name="fileImage[]" id="filer_example2" multiple="multiple">
					@if($data['image'] != '')
						<img src="{{ asset($data['image']) }}" class="thumbnail">
					@endif
				</div>
			</div>
			<div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
				
			</div>
			<div class="col-lg-9 col-md-9 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Diễn giải</label>
					<textarea  class="form-control" id="description" name="description">{{ old('description', isset($data) ? $data['description'] : 0) }}</textarea>
				</div>
			</div>
		</div>
		<hr>
		<div class="row backgroud_white">
			<div class="col-md-12 col-lg-12">
				<button type="submit" class="btn btn-danger"><i class="fa fa-save bigfonts" aria-hidden="true"></i> Cập nhật</button>
				<a  class="btn btn-info"><i class="fa fa-refresh bigfonts" aria-hidden="true"></i> Thực hiện lại</a>
				<a  class="btn btn-primary" href="{{ route('get.admin.course.list') }}"><i class="fa fa-list bigfonts" aria-hidden="true"></i> Danh sách khóa học</a>
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