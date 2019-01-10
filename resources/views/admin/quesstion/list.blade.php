@extends('admin.app')
@section('title', 'Danh sách câu hỏi ôn tập')
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
								<th>Câu hỏi</th>
								<th>Chuyên đề</th>
								<th>Khóa học</th>
								<th>Cấp độ</th>
								<th>Loại</th>
								<th>Trạng thái</th>
								<th>
									<a href="#" ><i class="fa fa-fw fa-plus"></i> Thêm mới câu hỏi</a>
								</th>
							</tr>
						</thead>										
						<tbody>
							<?php foreach($data as $key=>$item) { ?>
							<tr>
								<td><?php echo $key + 1; ?></td>
								<td><a href="{{ route('get.admin.exam.edit',['id'=>fencrypt($item->id)])}}">{{ $item->name }}</a></td>
								<td>{{ App\Models\Thematic::find($item->thematic)->name }}</td>
								<td>{{ $item->course }}</td>
								<td>{{ $item->level }}</td>
								<td>{{ $item->used }}</td>
								<td>
									@if($item->status == 0)
										<span>Disable</span>
									@else
										<span>Active</span>
									@endif
								</td>
								<td>
									<a href="{{ route('get.admin.quesstion.edit',['id'=>fencrypt($item->id)])}} "><i class="fa fa-fw fa-edit"></i> Edit </a>
									<a href="{{ route('get.admin.quesstion.delete',['id'=>fencrypt($item->id)])}}" style="color:red" onclick="return alertDelete();"><i class="fa fa-fw fa-trash"></i> Delete</a>
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