<link href="{{ asset('public/dashboard/quiz/css/quiz.css') }}" rel="stylesheet" type="text/css" />
<?php $result_header = $data['result_header']; $result_answer = $data['result_answer']; ?>
<div>
	<h4>Xin chào quý phụ huynh,</h4>
	<p>Website học trực tuyến hochieuqua.vn xin thông báo đến quý phụ huynh việc học bài của em: <span>{{ $data['name'] }}</span></p>
	<p>Em đã xem video bài giảng:  <strong>{{ App\Models\Lesson::find($result_header->lesson)->name }} </strong></p>
	<p>Thông báo kết quả làm bài test</p>
	<p>Em đã làm bài test và đạt kết quả đạt: {{ $data['point']}} điểm</p>
	<p>{{ App\Models\XepLoai::getXepLoai($data['point']) }}</p>
	<div>
		<p>Chi tiết bài làm</p>
		<ol>
			@foreach($result_answer as $key=>$item)
				<li>{{ App\Models\Quesstion::find($item->question_id)->name }}</li>
			@endforeach
		</ol>
	</div>
	<div>
		<h4>Nhận xét</h4>
		<ol>
			<li>{!! App\Models\XepLoai::getNhanXet($data['point']) !!}</li>
		</ol>
	</div>
	<hr>
	<h3><a href="https://hochieuqua.vn" target="_blank" title="Học Hiệu Quả - Nơi ươm mầm ước mơ cho con bạn"></a>Học Hiệu Quả</h3>
	<h3>Điện thoại hỗ trợ: 0914 718 806</h3>
</div>
<script type="text/javascript" src="{{ asset('public/dashboard/quiz/js/math.js')}}"></script>