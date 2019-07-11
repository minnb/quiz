@extends('admin.app')
@section('title', 'Danh sách tuần')
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
								<th>Tuần</th>
								<th>Từ ngày (dd-mm)</th>
								<th>Đến ngày (dd-mm)</th>
								<th>Ghi chú</th>
							</tr>
						</thead>										
						<tbody>
							<?php foreach($data as $key=>$item) { ?>
								<tr>
									<td><?php echo $key + 1; ?></td>
									<td>
										<a href="{{ route('get.admin.exam.weeks.edit',['id'=>fencrypt($item->id)]) }}"><?php echo $item->name; ?></a></td>
									<td><?php echo $item->from_date; ?></td>
									<td><?php echo $item->to_date; ?></td>
									<td></td>
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