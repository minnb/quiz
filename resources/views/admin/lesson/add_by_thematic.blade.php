@extends('admin.app')
@section('title', 'Thêm mới bài giảng')
@section('stylesheet')
	<link href="{{ asset('public/assets/plugins/jquery.filer/css/jquery.filer.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{  asset('public/assets/plugins/jquery.filer/css/themes/jquery.filer-dragdropbox-theme.css') }}" rel="stylesheet" type="text/css" />
@endsection
@section('content')
@include('admin.layouts.flash_message')
@include('admin.layouts.alert')
<div class="container-fluid card">
	<br>
	<form name="create-question" action="{{ route('post.admin.lesson.add.thematic', ['thematic'=>fencrypt($thematic_id)])}}" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="_token" value="<?php echo csrf_token() ?>">
		<div class="row backgroud_white">
			<div class="col-md-6 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label><span style="font-size:17px">Tạo mới Bài giảng:</span> <span style="color:blue">{{ App\Models\Thematic::getCourseByThematic($thematic_id) }}</span></label>
					<input type="text" class="form-control" name="name" value="Chuyên đề: {{ App\Models\Thematic::find($thematic_id)->name }}" placeholder="" readonly="true">
				</div>
				<div class="form-group">
					<label>Tên bài giảng</label>
					<input type="text" name="name" class="form-control" value="{{ old('name')}}" placeholder="Tên bài giảng" required="">  
				</div>
				<div class="form-group">
					<label>Link video</label>
					<input type="text" name="link_video" class="form-control" value="{{ old('link_video')}}" placeholder="">  
				</div>
				<div class="form-group">
					<label>Tóm tắt nội dung</label>
					<textarea class="form-control" name="description" rows="2" id="description" >{{ old('description')}}</textarea> 
				</div>
				<div class="form-group">
					<label>Nội dung</label>
					<textarea class="form-control" name="content" rows="3" id="content" >{{ old('content')}}</textarea> 
				</div>
			</div>
			<div class="col-md-3 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Giáo viên</label>
					<select class="form-control" name="teacher">
						{{ getSelectForm(App\Models\Teacher::getSelectTeacher(),old('teacher')) }}
					</select>
				</div>
				<div class="form-group">
					<label>Tuần</label>
					<select class="form-control" name="week">
						{{ getSelectForm(App\Models\Week::getSelectWeek(),old('week')) }}
					</select>
				</div>
				<div class="form-group">
					<label style="color:red">Hiển thị bài giảng</label>
					<select class="form-control" name="trial">
						{{ selectedOption(getVideStatus(),old('trial')) }}
					</select>
				</div>
				<div class="form-group">
					<label>Sắp xếp thứ tự</label>
					<input type="number" class="form-control" name="sort" value="0" />
				</div>
				<div class="form-group">
					<label>Từ khoá</label>
					<textarea class="form-control" name="keywords" rows="3" id="keywords" >{{ old('keywords')}}</textarea> 
				</div>
				<div class="form-group">
					<label>Hình ảnh</label>
					<input class="form-control" type="file" name="fileImage[]" id="filer_example2" multiple="multiple">
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