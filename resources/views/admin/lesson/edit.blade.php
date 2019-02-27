@extends('admin.app')
@section('title', 'Chỉnh sửa mới bài giảng')
@section('stylesheet')
	<link href="{{ asset('public/assets/plugins/jquery.filer/css/jquery.filer.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{  asset('public/assets/plugins/jquery.filer/css/themes/jquery.filer-dragdropbox-theme.css') }}" rel="stylesheet" type="text/css" />
@endsection
@section('content')
@include('admin.layouts.flash_message')
@include('admin.layouts.alert')
<div class="container-fluid card">
	<br>
	<form name="create-question" action="{{ route('get.admin.lesson.edit', ['thematic'=>fencrypt($data['id'])])}}" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="_token" value="<?php echo csrf_token() ?>">
		<div class="row backgroud_white">
			<div class="col-md-6 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label><span style="font-size:19px">Bài giảng:</span> <span style="color:blue;font-size:19px">{{ App\Models\Thematic::getCourseByThematic($data['thematic']) }}</span></label>
					<input type="text" style="font-weight: bold;" class="form-control" name="name" value="Chuyên đề: {{ App\Models\Thematic::find($data['thematic'])->name }}" readonly>
				</div>
				<div class="form-group">
					<label>Tên bài giảng</label>
					<input type="text" name="name" class="form-control" value="{{ old('name', isset($data) ? $data['name'] : '')}}"  required="">  
				</div>
				<div class="form-group">
					<label>Link video</label>
					<input type="text" name="link_video" class="form-control" value="{{ old('link_video', isset($data) ? $data['link_video'] : '')}}" placeholder="">  
				</div>
				<div class="form-group">
					<label>Tóm tắt nội dung</label>
					<textarea class="form-control" name="description" rows="2" id="description" >{{ old('description', isset($data) ? $data['description'] : '')}}</textarea> 
				</div>
				<div class="form-group">
					<label>Nội dung</label>
					<textarea class="form-control" name="content" rows="3" id="content" >{{ old('content', isset($data) ? $data['content'] : '')}}</textarea> 
				</div>
			</div>
			<div class="col-md-3 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Giáo viên</label>
					<select class="form-control" name="teacher">
						{{ getSelectForm(App\Models\Teacher::getSelectTeacher(), old('teacher', isset($data) ? $data['teacher'] : '')) }}
					</select>
				</div>
				<div class="form-group">
					<label>Từ khoá</label>
					<textarea class="form-control" name="keywords" rows="3" id="keywords" >{{ old('keywords', isset($data) ? $data['keywords'] : '')}}</textarea> 
				</div>
				<div class="form-group">
					<label>Trạng thái</label>
					<select class="form-control" name="status">
						{{ selectedOption(getStatus(), old('status', isset($data) ? $data['status'] : 1)) }}
					</select>
				</div>
				<div class="form-group">
					<label>Hình ảnh</label>
					<input class="form-control" type="file" name="fileImage[]" id="filer_example2" multiple="multiple">
					@if($data['image'] != '')
						<img src="{{ asset($data['image']) }}" style="max-width:150px;height: auto;">
					@endif
				</div>
			</div>
		</div>
		<hr>
		<div class="row backgroud_white">
			<div class="col-md-10 offset-md-1 col-lg-12">
				<button type="submit" class="btn btn-danger"><i class="fa fa-save bigfonts" aria-hidden="true"></i> Cập nhật</button>
				<a class="btn btn-primary" href="{{ route('get.admin.lesson.list') }}"><i class="fa fa-list bigfonts" aria-hidden="true"></i> Danh sách bài giảng</a>
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
	$(document).ready(function(){
        ckeditor('content')
        $('.textarea').wysihtml5();
      });
</script>
@endsection