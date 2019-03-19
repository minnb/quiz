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
					<form name="slider-form" action="{{ route('post.admin.pages.slide.add') }}" method="POST" enctype="multipart/form-data">
						<input type="hidden" name="_token" value="<?php echo csrf_token() ?>">
						<div class="form-group">
							<label>Số thứ tự (0 -> 9)</label>
							<input type="number" class="form-control" name="sort" required="" value="{{ old('link') }}" style="text-align:center; ">
						</div>
						<div class="form-group">
							<label>Tiêu đề 1</label>
							<input type="text" class="form-control" name="name1" value="{{ old('name1') }}">
						</div>
						<div class="form-group">
							<label>Tiêu đề 2</label>
							<input type="text" class="form-control" name="name2" value="{{ old('name1') }}">
						</div>
						<div class="form-group">
							<label>Liên kết</label>
							<input type="text" class="form-control" name="link" value="{{ old('link') }}">
						</div>
						<div class="form-group">
							<label>Hình ảnh <small style="color:red">(size: 1920 x 720 px)</small></label>
							<input class="form-control" type="file" name="fileImage" id="filer_example2" multiple="multiple">
						</div>
						<hr>
						<button type="submit" class="btn btn-primary"><i class="fa fa-save bigfonts" aria-hidden="true"></i> Upload</button>
					</form>
				</div>
			</div>
			<div class="card-body">
				<div class="row">
					@if($data->count()>0)
						@foreach($data as $item)
						<a href="{{ route('get.admin.pages.slide.edit', ['id'=>fencrypt($item->id)]) }}" class="col-sm-2">
							<img alt="{{ fencrypt($item->id) }}" src="{{ asset($item->image) }}" class="img-fluid">
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