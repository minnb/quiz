@extends('admin.app')
@section('title', 'Danh sách đề thi')
@section('content')
@include('admin.layouts.flash_message')
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
								<th>Mã đề thi</th>
								<th>Tên đề thi</th>
								<th>SL câu hỏi</th>
								<th>Thời gian</th>
								<th>Level 1</th>
								<th>Level 2</th>
								<th>Level 3</th>
								<th>Level 4</th>
								<th>Trạng thái</th>
								<th>
									<a href="{{ route('get.admin.exam.add') }}" ><i class="fa fa-fw fa-plus"></i> Thêm mới đề thi</a>
								</th>
							</tr>
						</thead>										
						<tbody>
							<?php foreach($data as $key=>$item) { ?>
							<tr>
								<td><?php echo $key + 1; ?></td>
								<td>
									@if($item->image != '')
									<img src="{{ asset($item->image) }}" class="thumbnail">
									@ELSE
										<span></span>
									@endif
								</td>
								<td>{{ $item->type }}</td>
								<td><a href="{{ route('get.admin.exam.edit',['id'=>fencrypt($item->id)])}}"><?php echo $item->name; ?></a></td>
								<td>{{ $item->number_quesstion }}</td>
								<td>{{ $item->work_time }}</td>
								<td>{{ $item->lv1 }}</td>
								<td>{{ $item->lv2 }}</td>
								<td>{{ $item->lv3 }}</td>
								<td>{{ $item->lv4 }}</td>
								<td>
									@if($item->status == 0)
										<span>Disable</span>
									@else
										<span>Active</span>
									@endif
								</td>
								<td>
									<a href="{{ route('get.admin.exam.edit',['id'=>fencrypt($item->id)])}} "><i class="fa fa-fw fa-edit"></i> Edit </a>
									<a href="{{ route('get.admin.exam.delete',['id'=>fencrypt($item->id)])}}" style="color:red" onclick="return alertDelete();"><i class="fa fa-fw fa-trash"></i> Delete</a>
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