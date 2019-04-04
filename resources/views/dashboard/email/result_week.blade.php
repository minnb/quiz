<?php $result_header = $data['result_header']; $result_answer = $data['result_answer']; ?>
<div>
	<h4>Xin chào quý phụ huynh,</h4>
	<p>Website học trực tuyến hochieuqua.vn xin thông báo đến quý phụ huynh việc học tập của em: <span>{{ $data['name'] }}</span></p>
	<p>Em đã bài luyện thi tuần {{$result_header->week}} <strong>Môn học: </strong>{{App\Models\Subject::find($result_header->subject)->name}}</p>
	<h3>Kết quả bài thi</h3>
	<div>
		<h3>Đạt kết quả: <span style="font-size: 20px">{{ $data['point']}}</span> điểm</h3>
		<p>Chi tiết bài làm:</p>
		<ol>
			@foreach($result_answer as $key=>$item)
				<li>{{ App\Models\Quesstion::find($item->question_id)->name }}</li>
			@endforeach
		</ol>
	</div>
	<div>
		<h4>Nhận xét</h4>
		<p>Chúc mừng em đã hoàn thành xuất sắc (khá tốt) các kiến thức trong tuần {{$result_header->week}}</p>
	</div>
	<hr>
	<h3><a href="https://hochieuqua.vn" target="_blank" title="Học Hiệu Quả - Nơi ươm mầm ước mơ cho con bạn"></a>Học Hiệu Quả</h3>
	<h3>Điện thoại hỗ trợ: 0914 718 806</h3>
</div>