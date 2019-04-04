@extends('admin.app')
@section('title', 'Auto send email')
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
								<th>Type</th>
								<th>Quiz_id</th>
								<th>UserName</th>
								<th>Email</th>
								<th>Created_at</th>
								<th>Updated_at</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
						</thead>										
						<tbody>
							<?php foreach($data as $key=>$item) { ?>
							<tr>
								<td><?php echo $key + 1; ?></td>
								<td>{{ $item->type }}</td>
								<td>{{ $item->quiz_id }}</td>
								<td>{{ $item->name }}</td>
								<td>{{ $item->email }}</td>
								<td>{{ $item->created_at }}</td>
								<td>{{ $item->updated_at }}</td>
								<td>
									@if($item->status == 0)
										<span class="btn btn-danger btn-sm">Pending</span>
									@else
										<span class="btn btn-success btn-sm">Success</span>
									@endif
								</td>
								<td>
									@if($item->status == 0)
									<a class="btn btn-primary" href="{{ route('get.admin.manual.send.email',['quiz_id'=>fencrypt($item->quiz_id)]) }}">Send email</a>
									@else
										<span>Success</span>
									@endif
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