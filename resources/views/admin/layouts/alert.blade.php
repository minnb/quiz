@if ($errors->any())
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12" id="message-errors">
		<div class="card mb-3">
			<div class="card-body">
				<div class="alert alert-danger" role="alert">
					<ul>
			            @foreach ($errors->all() as $error)
			                <li>{{ $error }}</li>
			            @endforeach
			        </ul>
				</div>
			</div>
		</div>
	</div>
</div>
@endif