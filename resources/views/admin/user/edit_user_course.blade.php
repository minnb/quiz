@extends('admin.app')
@section('title', 'Thêm khóa học cho học viên')
@section('stylesheet')
	<link href="{{ asset('public/assets/plugins/jquery.filer/css/jquery.filer.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{  asset('public/assets/plugins/jquery.filer/css/themes/jquery.filer-dragdropbox-theme.css') }}" rel="stylesheet" type="text/css" />
@endsection
@section('content')
@include('admin.layouts.flash_message')
@include('admin.layouts.alert')
<div class="container-fluid card">
	<br>
	<form name="create-question" action="{{ route('post.admin.course.register', ['id'=>fencrypt($id)] )}}" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="_token" value="<?php echo csrf_token() ?>">
		<div class="row backgroud_white">
			<div class="col-md-4 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Họ tên</label>
					<input type="text" name="name" required="" class="form-control" value="{{ old('name', isset($data) ? App\Models\User::find($data->user_id)->name : '') }}"  readonly="">
				</div>
				<div class="form-group">
					<label>Email</label>
					<input type="email" name="email" required="" class="form-control" value="{{ old('email', isset($data) ? App\Models\User::find($data->user_id)->email : '') }}" readonly="">
				</div>
				<div class="form-group">
					<label>Chọn khóa học</label>
					<select class="form-control" name="course">
						<option value="{{$data->course}}">{{ App\Models\Course::getFullNameCourse($data->course) }}</option>
					</select>
				</div>
				<div class="form-group">
					<label>Trạng thái</label>
					<select class="form-control" name="status">
						{{ selectedOption(getStatusCourseUser(),(old('status', isset($data) ? $data->status : 0))) }}
					</select>
				</div>
			</div>
		</div>
		<hr>
		<div class="row backgroud_white">
			<div class="col-md-10 offset-md-1 col-lg-12">
				<button type="submit" class="btn btn-danger"><i class="fa fa-save bigfonts" aria-hidden="true"></i> Cập nhật dữ liệu</button>
				<a class="btn btn-primary" href="{{ route('get.admin.user.list.course') }}"><i class="fa fa-list bigfonts" aria-hidden="true"></i> Danh sách học viên</a>
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