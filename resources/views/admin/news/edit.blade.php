@extends('admin.app')
@section('title', 'Tạo mới Tin tức')
@section('stylesheet')
	<link href="{{ asset('public/assets/plugins/jquery.filer/css/jquery.filer.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{  asset('public/assets/plugins/jquery.filer/css/themes/jquery.filer-dragdropbox-theme.css') }}" rel="stylesheet" type="text/css" />
@endsection
@section('content')
@include('admin.layouts.flash_message')
@include('admin.layouts.alert')
<div class="container-fluid card">
	<br>
	<form name="create-question" action="{{ route('post.admin.news.edit', ['id'=>fencrypt($id)])}}" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="_token" value="<?php echo csrf_token() ?>">
		<div class="row backgroud_white">
			<div class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Tiêu để</label>
					<input type="text" name="name" class="form-control" required="" value="{{old('name', isset($data) ? $data['name'] : '')}}"/>
				</div>
				<div class="form-group">
					<label>Danh mục</label>
					<select class="form-control" name="cate_id">
						<option value="1">Tin tức</option>
					</select>
				</div>
				<div class="form-group">
					<label>Từ khoá</label>
					<input type="text" name="tags" class="form-control" value="{{old('tags', isset($data) ? $data['tags'] : '')}}" />
				</div>
				<div class="form-group">
					<label>Trạng thái</label>
					<select class="form-control" name="status">
						{{ selectedOption(getStatus(),old('status', isset($data) ? $data['status'] : 1)) }}
					</select>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Hình ảnh  (370x260px)</label>
					<input class="form-control" type="file" name="fileImage[]" id="filer_example2" multiple="multiple">
				</div>
				@if($data['image'] != '')
					<div class="form-group">
						<label> </label>
						<img src="{{ asset($data['image']) }}" style="max-height: 100px">
					</div>
				@endif
			</div>
			<div class="col-lg-9 col-md-9 col-xs-12 col-sm-12">
				<div class="form-group">
					<label>Tóm tắt nội dung</label>
					<textarea  class="form-control" rows="3" id="description" name="description">{{ old('description', isset($data) ? $data['description'] : '') }}</textarea>
				</div>
				<div class="form-group">
					<label>Nội dung</label>
					<textarea  class="form-control" id="content" name="content">{{ old('content', isset($data) ? $data['content'] : '' ) }}</textarea>
				</div>
			</div>
		</div>
		<hr>
		<div class="row backgroud_white">
			<div class="col-md-12 col-lg-12">
				<button type="submit" class="btn btn-danger"><i class="fa fa-save bigfonts" aria-hidden="true"></i> Lưu thông tin</button>
				<a class="btn btn-primary" href="{{ route('get.admin.news.list') }}"><i class="fa fa-list bigfonts" aria-hidden="true"></i> Danh sách Tin tức</a>
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