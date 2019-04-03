@extends('admin.app')
@section('title', 'Tạo chuyên đề cho khoá học')
@section('stylesheet')
	<link href="{{ asset('public/assets/plugins/jquery.filer/css/jquery.filer.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{  asset('public/assets/plugins/jquery.filer/css/themes/jquery.filer-dragdropbox-theme.css') }}" rel="stylesheet" type="text/css" />
@endsection
@section('content')
@include('admin.layouts.flash_message')
@include('admin.layouts.alert')
<div class="container-fluid card">
	<br>
	<form name="create-question" action="{{ route('post.admin.thematic.edit',['id'=>fencrypt($thematic_id)])}}" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="_token" value="<?php echo csrf_token() ?>">
		<div class="row backgroud_white">
			<div class="col-md-4 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Tên chuyên đề</label>
					<input type="text" name="name" required="" class="form-control" value="{{ old('status', isset($data) ? $data['name'] : 1) }}" placeholder="Chuyên đề">
				</div>
				<div class="form-group">
					<label>Trạng thái</label>
					<select class="form-control" name="status">
						{{ selectedOption(getStatus(),old('status', isset($data) ? $data['status'] : 1)) }}
					</select>
				</div>
				<div class="form-group">
					<label>Sắp xếp</label>
					<input type="number" name="sort" value="{{ old('status', isset($data) ? $data['sort'] : 0) }}" class="form-control" required="" style="text-align: center;">
				</div>
				<div class="form-group">
					<label>Từ khoá</label>
					<input type="text" name="keywords"  class="form-control" value="{{ old('keywords') }}" placeholder="#Từ khoá">
				</div>
			</div>
			<div class="col-md-3 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Khoá học</label>
					<select class="form-control" name="course">
						<option value="{{ $data['course'] }}">{{ App\Models\Course::getFullNameCourse($data['course']) }}</option>
					</select>
				</div>
				<div class="form-group">
					<label>Môn học</label>
					<select class="form-control" name="subject">
						<option value="{{ $data['subject'] }}">{{ App\Models\Subject::find($data['subject'])->name }}</option>
					</select>
				</div>
				<div class="form-group">
					<label>Tuần</label>
					<select class="form-control" name="week">
						{{ selectedOption(getWeek(), old('week', isset($data) ? $data['week'] : 1) )}}
					</select>
				</div>
				<div class="form-group">
					<label>Hình ảnh</label>
					<input class="form-control" type="file" name="fileImage[]" id="filer_example2" multiple="multiple">
					@if($data['image'] != '')
						<img src="{{ asset($data['image']) }}" class="thumbnail">
					@endif
				</div>
			</div>
			<div class="col-md-8 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Diễn giải</label>
					<textarea  class="form-control" id="description" name="description">{{ old('description', isset($data) ? $data['description'] : '') }}</textarea>
				</div>
				<br>
				<hr>
				<button type="submit" class="btn btn-danger"><i class="fa fa-save bigfonts" aria-hidden="true"></i> Cập nhật</button>
				<a class="btn btn-primary" href="{{ route('get.admin.thematic.list') }}"><i class="fa fa-list bigfonts" aria-hidden="true"></i> Danh sách chuyên đề</a>
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