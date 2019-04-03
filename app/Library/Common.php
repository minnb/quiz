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
      '0' => 'Sử dụng cho Quiz Test',
      '1' => 'Sử dụng cho đề thi'
    ];
    return $arrStatus;
}

function getQuizType($id){
  if($id == 0){ echo 'Quiz test'; }else {echo 'Luyện thi';}
}
function getWeek(){
  return [
    '1' => 'Tuần 01',
    '2' => 'Tuần 02',
    '3' => 'Tuần 03',
    '4' => 'Tuần 04',
    '5' => 'Tuần 05',
    '6' => 'Tuần 06',
    '7' => 'Tuần 07',
    '8' => 'Tuần 08',
    '9' => 'Tuần 09',
    '10' => 'Tuần 10',
    '11' => 'Tuần 11',
    '12' => 'Tuần 12',
    '13' => 'Tuần 13',
    '14' => 'Tuần 14',
    '15' => 'Tuần 15',
    '16' => 'Tuần 16',
    '17' => 'Tuần 17',
    '18' => 'Tuần 18',
    '19' => 'Tuần 19',
    '20' => 'Tuần 20',
    '21' => 'Tuần 21',
    '22' => 'Tuần 22',
    '23' => 'Tuần 23',
    '24' => 'Tuần 24',
    '25' => 'Tuần 25',
    '26' => 'Tuần 26',
    '27' => 'Tuần 27',
    '28' => 'Tuần 28',
    '29' => 'Tuần 29',
    '30' => 'Tuần 30',
    '31' => 'Tuần 31',
    '32' => 'Tuần 32',
    '33' => 'Tuần 33',
    '34' => 'Tuần 34',
    '35' => 'Tuần 35',
    '36' => 'Tuần 36',
  ];
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

function getToken($length = 10) {
    return substr(str_shuffle(str_repeat($x='0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', ceil($length/strlen($x)) )),1,$length);
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