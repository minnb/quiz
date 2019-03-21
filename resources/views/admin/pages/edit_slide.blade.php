@extends('admin.app')
@section('title', 'Danh sách Slide')
@section('stylesheet')
	<link href="{{ asset('public/assets/plugins/jquery.filer/css/jquery.filer.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{  asset('public/assets/plugins/jquery.filer/css/themes/jquery.filer-dragdropbox-theme.css') }}" rel="stylesheet" type="text/css" />
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.2.5/jquery.fancybox.min.css" />
@endsection
@section('content')
@include('admin.layouts.flash_message')
@include('admin.layouts.alert')
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
		<div class="card mb-3">
			<div class="card-header">
				<h3><i class="fa fa-image"></i> Hình ảnh</h3>
				<hr>
				<div class="col-md-6 offset-md-1 col-xs-12 col-sm-12">
					<form name="slider-form" method="POST" enctype="multipart/form-data" action="{{ route('post.admin.pages.slide.edit', ['id'=>fencrypt($id)]) }}">
						<input type="hidden" name="_token" value="<?php echo csrf_token() ?>">
						<div class="form-group">
							<label>Số thứ tự (0 -> 9)</label>
							<input type="number" class="form-control" name="sort" required="" value="{{ old('sort', asset($data) ? $data['sort'] : 0) }}" style="text-align:center; ">
						</div>
						<div class="form-group">
							<label>Trạng thái</label>
							<select class="form-control" name="status">
								{{ selectedOption(getStatus(),old('status', isset($data) ? $data['status'] : 1)) }}
							</select>
						</div>
						<div class="form-group">
							<label>Tiêu đề 1</label>
							<input type="text" class="form-control" name="name1" value="{{ old('name1', asset($data) ? $data['name1'] : '') }}">
						</div>
						<div class="form-group">
							<label>Tiêu đề 2</label>
							<input type="text" class="form-control" name="name2" value="{{ old('name2', asset($data) ? $data['name2'] : '') }}">
						</div>
						<div class="form-group">
							<label>Liên kết</label>
							<input type="text" class="form-control" name="link" value="{{ old('link', asset($data) ? $data['link'] : '') }}">
						</div>
						<div class="form-group">
							<label>Hình ảnh <small style="color:red">(size: 1920 x 720 px)</small></label>
							<input class="form-control" type="file" name="fileImage[]" id="filer_example2" multiple="multiple">
							@if($data['image'] != '')
								<img src="{{ asset($data['image']) }}" style="max-width:150px;height: auto;">
							@endif
						</div>
						<hr>
						<button type="submit" class="btn btn-primary"><i class="fa fa-save bigfonts" aria-hidden="true"></i> Lưu chỉnh sửa</button>
						<a href="{{ route('get.admin.pages.slide.list') }}" class="btn btn-danger"><i class="fa fa-plus bigfonts" aria-hidden="true"></i> Thêm mới</a>
					</form>
				</div>
			</div>
			<div class="card-body">
				<div class="row">
					@if($data_image->count()>0)
						@foreach($data_image as $item)
						<a href="{{ route('get.admin.pages.slide.edit', ['id'=>fencrypt($item->id)]) }}" class="col-sm-2">
							<img alt="" src="{{ asset($item->image) }}" class="img-fluid">
						</a>
						@endforeach
					@else
						<span style="color: red;">Chưa có hình ảnh</span>
					@endif
				</div>

			</div>														
		</div>
	</div>				
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.2.5/jquery.fancybox.min.js"></script>
@endsection