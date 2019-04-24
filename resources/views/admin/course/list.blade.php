@extends('admin.app')
@section('title', 'Danh sách khoá học')
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
								<th>Hình</th>
								<th>Mã khóa học</th>
								<th>Lớp</th>
								<th>Tên khóa học</th>
								<th colspan="2">Môn học</th>
								<th>Học phí</th>
								<th>Trạng thái</th>
								<th>
									
								</th>
							</tr>
						</thead>										
						<tbody>
							<?php foreach($data as $key=>$item) { ?>
							<tr>
								<td><?php echo $key + 1; ?></td>
								<td>
									<img src="{{ asset($item->image)}}" style="max-height: 100px; width: auto;">
								</td>
								<td><?php echo $item->code; ?></td>
								<td><?php echo App\Models\ClassRoom::find($item->class)->name; ?></td>
								<td><?php echo $item->name; ?></td>
								<td>
									<?php $lst_subject = App\Models\Course_Subject::getListSubjectInCourse($item->code); ?>
									@if(isset($lst_subject))
										<ol>
										@foreach($lst_subject as $value)
											<li>{{ $value->name }}</li>
										@endforeach
										</ol>
									@endif
								</td>
								<td>
									<a href="{{ route('get.admin.course.add.subject',['id'=>fencrypt($item->code)])}} "><i class="fa fa-fw fa-edit"></i> Thêm môn học </a>
								</td>
								<td>{{ number_format($item->unit_price) }} <ins>đ</ins></td>
								<td>
									@if($item->status == 0)
										<span>Disable</span>
									@else
										<span>Active</span>
									@endif
								</td>
								<td>
									<a href="{{ route('get.admin.course.edit',['id'=>fencrypt($item->id)])}} "><i class="fa fa-fw fa-edit"></i> Edit </a>
									<a href="#" style="color:red"><i class="fa fa-fw fa-trash"></i> Delete</a>
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