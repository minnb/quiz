@extends('admin.app')
@section('title', 'Danh mục lớp học')
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
								<th>Lớp</th>
								<th>Khoá học</th>
								<th>Thao tác</th>
							</tr>
						</thead>										
						<tbody>
							<?php foreach($data as $key=>$item) { ?>
							<tr>
								<?php $course = App\Models\ClassRoom::countCourseByClass($item->id); ?>
								<td><?php echo $key + 1; ?></td>
								<td><?php echo $item->name; ?></td>
								<td>
									{{ $course }} <span> khoá học</span> 
									@if($course < 2)
										<a href="{{ route('get.admin.course.add',['class'=>fencrypt($item->id)]) }}"> <i class="fa fa-fw fa-plus"></i> Thêm khoá học</a>
									@else
										<a href="#"><i class="fa fa-fw fa-plus"></i> Thêm khoá học</a>
									@endif
								</td>
								<td>
									<a href="# "><i class="fa fa-fw fa-edit"></i> Edit </a>
									<a href="#" style="color:red"><i class="fa fa-fw fa-trash"></i> Disable</a>
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