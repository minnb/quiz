@extends('admin.app')
@section('title', 'Danh sách hỏi đáp')
@section('content')
@include('admin.layouts.flash_message')
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
		<div class="card mb-3">
			<div class="card-header">
				<div class="col-md-6 offset-md-1 col-xs-12 col-sm-12">
					<form name="slider-form" action="{{ route('post.admin.pages.qa.edit', ['id'=>fencrypt($id)]) }}" method="POST" enctype="multipart/form-data">
						<input type="hidden" name="_token" value="<?php echo csrf_token() ?>">
						<div class="form-group">
							<label>Câu hỏi</label>
							<textarea  class="form-control" rows="2" id="description" name="name" required="">{{ old('name', isset($data) ? $data[0]->name : '') }}</textarea>
						</div>
						<div class="form-group">
							<label>Trả lời</label>
							<textarea  class="form-control" id="content" name="content" required="">{{ old('content', isset($data) ? $data[0]->content : '') }}</textarea>
						</div>
						<hr>
						<button type="submit" class="btn btn-info"><i class="fa fa-save bigfonts" aria-hidden="true"></i> Lưu thông tin</button>
					</form>
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table id="data_table" class="table table-bordered table-hover display">
						<thead>
							<tr>
								<th>#</th>
								<th>Câu hỏi</th>
								<th>Câu trả lời</th>
								<th>Trạng thái</th>
								<th></th>
							</tr>
						</thead>										
						<tbody>
							<?php foreach($data as $key=>$item) { ?>
							<tr>
								<td><?php echo $key + 1; ?></td>
								<td>{{ $item->name }}</td>
								<td>{!! $item->content !!}</td>
								<td>{{  getStatusName($item->status) }}</td>
								<td>
									<a href="{{ route('get.admin.news.edit',['id'=>fencrypt($item->id)])}} "><i class="fa fa-fw fa-edit"></i> Edit </a>
									<a href="{{ route('get.admin.news.delete',['id'=>fencrypt($item->id)])}}" style="color:red" onclick="return alertDelete();"><i class="fa fa-fw fa-trash"></i> Delete</a>
								</td>
							</tr>
							<?php } ?>
						</tbody>
					</table>
				</div>
			</div>														
		</div>
	</div>				
</div>
@endsection
@section('javascript')
	<script src="{{ asset('public/assets/plugins/datatables/jquery.dataTables.min.js') }}"></script>
	<script src="{{ asset('public/assets/plugins/datatables/dataTables.bootstrap4.min.js') }}"></script>
	<script src="<?php echo asset('public/assets/plugins/func_ckfinder.js'); ?>"></script>
	<script src="<?php echo asset('public/assets/plugins/ckeditor/ckeditor.js'); ?>"></script>
	<script type="text/javascript">
		$(function() {
			$('#data_table').DataTable();
		});
		$(document).ready(function(){
	        ckeditor('content')
	        $('.textarea').wysihtml5();
	      });
	</script>
@endsection