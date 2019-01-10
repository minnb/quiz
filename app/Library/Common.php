<?php

function getStatus(){
    $arrStatus = [
      '0' => 'Block',
      '1' => 'Active'
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
    'TUAN' => 'Đề thi tuần',
    'THANG' => 'Đề thi tháng',
    'HOCKY1' => 'Đề thi học kỳ 1',
    'HOCKY2' => 'Đề thi học kỳ 1'
  ];
}
function getTypeAnswer(){
    $arrStatus = [
      'radio' => 'Một đáp án',
      'checkbox' => 'Nhiều đáp án',
      //'value'  => 'Tự điền đáp án'
    ];
    return $arrStatus;
}
function getQuizUsed(){
    $arrStatus = [
      '0' => 'Sử dụng cho đề thi',
      '1' => 'Sử dụng cho Quiz Test',
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
      '0' => 'Nhận biết',
      '1' => 'Hiểu',
      '2' => 'Vận dụng',
	  '3' => 'Vận dụng sáng tạo'
    ];
    return $arrStatus;
}
function getTypeAnswerImage(){
    $arrStatus = [
      'null' => 'Loại trả lời text',
      'image' => 'Loại trả lời bằng hình ảnh',
      //'text'  => 'Tự điền đáp án'
    ];
    return $arrStatus;
}
