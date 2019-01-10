@extends('admin.app')
@section('title', 'Danh sách chuyên đề')
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
								<th>Chuyên đề</th>
								<th>Khoá học</th>
								<th>Môn học</th>
								<th>Câu hỏi</th>
								<th>Trạng thái</th>
								<th>
									<a href="#" data-toggle="modal" data-target=".bd-example-modal-lg"><i class="fa fa-fw fa-plus"></i> Thêm mới chuyên đề</a>
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
								<td>
									<a href="{{ route('get.admin.thematic.edit',['id'=>fencrypt($item->id)])}}"><?php echo $item->name; ?></a>
								</td>
								<td>{{ App\Models\Course::getFullNameCourse($item->course) }}</td>
								<td>{{ App\Models\Subject::find($item->subject)->name }}</td>
								<td>
									<span>(0)</span>
									<a href="{{ route('get.admin.quesstion.add.thematic',['thematic'=>fencrypt($item->id)]) }}"><i class="fa fa-fw fa-plus"></i> Thêm mới câu hỏi</a>
								</td>
								<td>
									@if($item->status == 0)
										<span>Disable</span>
									@else
										<span>Active</span>
									@endif
								</td>
								<td>
									<a href="{{ route('get.admin.thematic.edit',['id'=>fencrypt($item->id)])}} "><i class="fa fa-fw fa-edit"></i> Edit </a>
									<a href="{{ route('get.admin.thematic.delete',['id'=>fencrypt($item->id)])}}" style="color:red" onclick="return alertDelete();"><i class="fa fa-fw fa-trash"></i> Delete</a>
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
<!-- Large modal -->
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg">
	<div class="modal-content">
		<div class="modal-header">
		<h5 class="modal-title">Lựa chọn môn học - Khoá học</h5>
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		  <span aria-hidden="true">&times;</span>
		</button>
		</div>
		<div class="modal-body">
			<table id="data_table" class="table table-bordered table-hover display">
				<thead>
					<tr>
						<th>#</th>
						<th>Khoá học</th>
						<th>Môn học</th>
					</tr>
				</thead>										
				<tbody>
					<?php $lst = App\Models\Course_Subject::getListSubjectInCourse('');
						foreach($lst as $key=>$item) { ?>
					<tr>
						<td><?php echo $key + 1; ?></td>
						<td>
							<a href="{{ route('get.admin.thematic.add', ['course'=>fencrypt($item->course), 'subject'=>fencrypt($item->id)]) }}">
								{{ $item->course }} - {{ App\Models\Course::getFullNameCourse($item->course) }}</td>
							</a>
						<td>
							<a href="{{ route('get.admin.thematic.add', ['course'=>fencrypt($item->course), 'subject'=>fencrypt($item->id)]) }}">
								{{ $item->name }}
							</a>
						</td>
					</tr>
					<?php } ?>
				</tbody>
			</table>
		</div>
		<div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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