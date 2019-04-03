<div>
	<h4>Xin chào: {{ $data['name'] }}</h4>
	<p>Bạn vừa làm bài luyện tập của 
		<?php $result_header = $data['result_header']; $result_answer = $data['result_answer']; ?>
	</p>
	<div>
		<h3>Tổng điểm: <span style="font-size: 20px">{{ $data['point']}}</span></h3>
		<ol>
			@foreach($result_answer as $key=>$item)
				<li>{{ App\Models\Quesstion::find($item->question_id)->name }}</li>
			@endforeach
		</ol>
	</div>
	<div>
		<h4>Nhận xét</h4>
		<p>.....</p>
	</div>
	<h3>Học Hiệu Quả</h3>
</div>