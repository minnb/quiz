<?php

function getStatus(){
    $arrStatus = [
      '0' => 'Block',
      '1' => 'Active'
    ];
    return $arrStatus;
}
function getStatusCourseUser(){
    $arrStatus = [
      '0' => 'Học thử',
      '1' => 'Học viên'
    ];
    return $arrStatus;
}
function getVideStatus(){
    $arrStatus = [
      '0' => 'Chỉ học viên xem',
      '1' => 'Cho phép học thử'
    ];
    return $arrStatus;
}
function getKhoaHoc(){
  return [
    '0' => 'Cơ bản',
    '1' => 'Nâng cao',
  ];
}
function getLoaiDeThi(){
  return [
    'QUIZ'=>'Luyện tập quiz',
    'CHUYENDE'=>'Luyện tập theo chuyên đề',
    'TUAN' => 'Đề thi tuần',
    'THANG' => 'Đề thi tháng',
    'HOCKY1' => 'Đề thi học kỳ 1',
    'HOCKY2' => 'Đề thi học kỳ 2'
  ];
}
function getQuizUsed(){
    $arrStatus = [
      '1' => 'Sử dụng cho đề thi',
      '0' => 'Sử dụng cho Quiz Test',
      //'value'  => 'Tự điền đáp án'
    ];
    return $arrStatus;
}

function getQuizType($id){
  if($id == 0){ echo 'Đề thi'; }else {echo 'Quiz test';}
}

function getAnswerNumber(){
    $arrStatus = [
      '1' => 'Đáp án 1',
      '2' => 'Đáp án 2',
      '3' => 'Đáp án 3',
      '4' => 'Đáp án 4',
    ];
    return $arrStatus;
}

function getLevelQuestion(){
    $arrStatus = [
      '1' => 'Nhận biết',
      '2' => 'Hiểu',
      '3' => 'Vận dụng',
	    '4' => 'Vận dụng sáng tạo'
    ];
    return $arrStatus;
}
function getTypeAnswer(){
    $arrStatus = [
      'radio' => 'Trả lời 1 đáp án',
      //'checkbox' => 'Chọn nhiều đáp án',
      //'value'  => 'Điền đáp án',
    ];
    return $arrStatus;
}
function calcPoint($total, $kq){
  return round((10/$total)*$kq,1);
}
function xeploai($point){
  $xep = '';
  if($point < 5){
    $xep = '<span style="color:red"> Điểm kém </span>';
  }elseif ($point >= 5 && $point < 7) {
    $xep = '<span style="color:#1c9ef5"> Trung bình </span>';
  }elseif ($point >= 7 && $point < 9) {
    $xep = '<span style="color:green"> Điểm khá </span>';
  }else{
    $xep = '<span style="color:blue"> Điểm giỏi </span>';
  }
  echo $xep;
}