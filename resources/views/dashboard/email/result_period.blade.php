<link href="{{ asset('public/dashboard/quiz/css/quiz.css') }}" rel="stylesheet" type="text/css" />
<?php $result_header = $data['result_header']; $result_answer = $data['result_answer']; ?>
<div>
	<h4>Xin chào quý phụ huynh,</h4>
	<p>Website học trực tuyến hochieuqua.vn xin thông báo đến quý phụ huynh việc học tập của em: <span>{{ $data['name'] }}</span></p>
	<p>Em đã bài {{$data['subject']}}
	<h3>Kết quả bài thi</h3>
	<div>
		<h3>Đạt kết quả: <span style="font-size: 20px">{{ $data['point']}}</span> điểm, <span>{{ App\Models\XepLoai::getXepLoai($data['point']) }}</span></h3>
		<p>Chi tiết bài làm:</p>
		<ol>
			@foreach($result_answer as $key=>$item)
				<li>{{ App\Models\Quesstion::find($item->question_id)->name }}</li>
			@endforeach
		</ol>
	</div>
	<div>
		<h4>Nhận xét</h4>
		<p>{!! App\Models\XepLoai::getNhanXet($data['point']) !!}</p>
	</div>
	<hr>
	<p><i>Đây là email được gửi tự động từ hochieuqua.vn, Quý phụ huynh/học viên vui lòng không trả lời email này</i></p>
	<h3><a href="https://hochieuqua.vn" target="_blank" title="Học Hiệu Quả - Nơi ươm mầm ước mơ cho con bạn"></a>Học Hiệu Quả</h3>
	<h3>Điện thoại hỗ trợ: 0914 718 806</h3>
</div>
<script type="text/javascript" src="{{ asset('public/dashboard/quiz/js/math.js')}}"></script>