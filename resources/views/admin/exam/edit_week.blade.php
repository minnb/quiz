@extends('admin.app')
@section('title', 'Tuần > Chỉnh sửa thời gian')
@section('stylesheet')
	<link href="{{ asset('public/assets/plugins/jquery.filer/css/jquery.filer.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{  asset('public/assets/plugins/jquery.filer/css/themes/jquery.filer-dragdropbox-theme.css') }}" rel="stylesheet" type="text/css" />
	<link href="{{ asset('public/assets/plugins/datetimepicker/css/daterangepicker.css') }}" rel="stylesheet" type="text/css" />

@endsection
@section('content')
@include('admin.layouts.flash_message')
@include('admin.layouts.alert')
<div class="container-fluid card">
	<br>
	<form name="create-question" action="{{ route('post.admin.exam.weeks.edit', ['id'=>fencrypt($id)])}}" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="_token" value="<?php echo csrf_token() ?>">
		<div class="row backgroud_white">
			<div class="col-md-7 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<input type="text" class="form-control" name="name" value="{{ old('name', isset($data) ? $data['name'] : '' ) }}" placeholder="" readonly="">
				</div>
			</div>
		</div>
		<div class="row backgroud_white">
			<div class="col-md-3 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label style="color:blue">Từ ngày</label>
					<input type="text" class="form-control" name="singledatepicker1"  value="{{ old('singledatepicker1', isset($data) ? $data['from_date'] : '' ) }}"/>
				</div>
			</div>
			<div class="col-md-3 offset-md-1 col-xs-12 col-sm-12">
				<div class="form-group">
					<label style="color:red">Đến ngày</label>
					<input type="text" class="form-control" name="singledatepicker2" value="{{ old('singledatepicker2', isset($data) ? $data['to_date'] : '' ) }}"/>
				</div>
			</div>
		</div>
		<hr>
		<div class="row backgroud_white">
			<div class="col-md-10 offset-md-1 col-lg-12">
				<button type="submit" class="btn btn-danger"><i class="fa fa-save bigfonts" aria-hidden="true"></i> Cập nhật</button>
				<a class="btn btn-primary" href="{{ route('get.admin.exam.weeks') }}"><i class="fa fa-list bigfonts" aria-hidden="true"></i> Danh sách tuần</a>
			</div>
		</div>
	</form>
	<br>
</div>
@endsection
@section('javascript')

<script src="<?php echo asset('public/assets/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js'); ?>"></script>
<script src="<?php echo asset('public/assets/plugins/waypoints/lib/jquery.waypoints.min.js') ; ?>"></script>
<script src="<?php echo asset('public/assets/plugins/counterup/jquery.counterup.min.js') ; ?>"></script>	
<script src="<?php echo asset('public/assets/plugins/jquery.filer/js/jquery.filer.min.js') ; ?>"></script>

<script src="<?php echo asset('public/assets/plugins/datetimepicker/js/moment.min.js') ; ?>"></script>
<script src="<?php echo asset('public/assets/plugins/datetimepicker/js/daterangepicker.js') ; ?>"></script>

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
	$(function() {
		$('input[name="singledatepicker1"]').daterangepicker({
			singleDatePicker: true,
			showDropdowns: true,
			locale: {
	          format: 'DD-MM-YYYY'
	        }
		});
	});
	$(function() {
		$('input[name="singledatepicker2"]').daterangepicker({
			singleDatePicker: true,
			showDropdowns: true,
			locale: {
	          format: 'DD-MM-YYYY'
	        }
		});
	});
</script>
@endsection