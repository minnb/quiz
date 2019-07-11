@extends('admin.app')
@section('title', 'Danh sách kỳ thi')
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
								<th>Mã đề thi</th>
								<th>Tên đề thi</th>
								<th>SL câu hỏi</th>
								<th></th>
							</tr>
						</thead>										
						<tbody>
							<?php foreach($data as $key=>$item) { ?>
							<tr>
								<td><?php echo $key + 1; ?></td>
								<td>{{ $item->type }}</td>
								<td>
									<a href="{{ route('get.admin.exam.edit',['id'=>fencrypt($item->id)])}}"><?php echo $item->name; ?></a>
								</td>
								<td>
									<a href="{{ route('get.admin.quesstion.list.question')}}">
										{{ number_format(App\Models\Exam::countQuestionByHK($item->type))}}
									</a>
								</td>
								<td>
									<button class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg-{{ $item->type }}">
										<i class="fa fa-fw fa-file-excel-o"></i> Import Excel
									</button>
									@include('admin.layouts.modal_list_course')
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