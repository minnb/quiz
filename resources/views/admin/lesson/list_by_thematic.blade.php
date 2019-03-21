@extends('admin.app')
@section('title', 'Danh sách bài giảng')
@section('content')
@include('admin.layouts.flash_message')
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12" >
		<div class="card mb-3">
			<div class="card-body">
				<h4>Chuyên đề: <strong>{{ App\Models\Thematic::find($thematic_id)->name }}</strong></h4>
				<a class="btn btn-success" style="float:right; margin-left: 10px;" href="{{ route('get.admin.lesson.list') }}">
					<i class="fa fa-mail-reply bigfonts"></i> Danh sách bài giảng</a> 
				 <a class="btn btn-primary" style="float:right" href="{{ route('get.admin.lesson.add.thematic', ['thematic'=>fencrypt($thematic_id)]) }}">
					<i class="fa fa-fw fa-plus"></i>Thêm mới bài giảng</a>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
		<div class="card mb-3">
			<div class="card-body">
				<div class="table-responsive">
					<table id="data_table" class="table table-bordered table-hover display">
						<thead>
							<tr>
								<th>#</th>
								<th>Hình ảnh</th>
								<th>Tên bài giảng</th>
								<th>Chuyên đề</th>
								<th>Khoá học</th>
								<th>Trạng thái</th>
								<th></th>
							</tr>
						</thead>										
						<tbody>
							<?php foreach($data as $key=>$item) { ?>
							<tr>
								<td><?php echo $key + 1; ?></td>
								<td></td>
								<td><a href="{{ route('get.admin.lesson.edit',['id'=>fencrypt($item->id)])}}">{{ $item->name }}</a></td>
								<td>{{ App\Models\Thematic::find($item->thematic)->name }}</td>
								<td>{{ $item->course }}</td>
								<td>
									@if($item->status == 0)
										<span>Disable</span>
									@else
										<span>Active</span>
									@endif
								</td>
								<td>
									<a href="{{ route('get.admin.lesson.edit',['id'=>fencrypt($item->id)])}} "><i class="fa fa-fw fa-edit"></i> Edit </a>
									<a href="{{ route('get.admin.lesson.delete',['id'=>fencrypt($item->id)])}}" style="color:red" onclick="return alertDelete();"><i class="fa fa-fw fa-trash"></i> Delete</a>
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
	<script type="text/javascript">
		$(function() {
			$('#data_table').DataTable();
		});
	</script>
@endsection