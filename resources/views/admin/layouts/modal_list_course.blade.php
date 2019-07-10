<div class="modal fade bd-example-modal-lg-{{ $item->type }}" tabindex="-1" role="dialog" aria-labelledby="customModal" id="{{ $item->type }}" aria-hidden="true">
  <div class="modal-dialog modal-lg">
	<div class="modal-content">
		<div class="modal-header">
			<?php $examChoose = $item->type; ?>
		<h5 class="modal-title">{{$examChoose}} - Lựa chọn Khóa học</h5><span id="modal-myvar"></span>
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		  <span aria-hidden="true">&times;</span>
		</button>
		</div>
		<div class="modal-body">
			<table id="data_table_modal" class="table table-bordered table-hover display">
				<thead>
					<tr>
						<th>#</th>
						<th>Khoá học</th>
					</tr>
				</thead>										
				<tbody>
					<form  id="type-form" method="POST" action="">
					<?php $lst = App\Models\Course::where('status', 1)->get();
						foreach($lst as $key=>$item) { ?>
					<tr>
						<td><?php echo $key + 1; ?></td>
						<td>
							<a href="{{route('get.admin.exam.import.excel',['course'=>$item->code, 'type'=>fencrypt($examChoose)])}}">
								<?php echo $item->full_name; ?>
							</a>
						</td>
					</tr>
					<?php } ?>
					</form>
				</tbody>
			</table>
		</div>
		<div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	  </div>
	</div>
  </div>
</div>