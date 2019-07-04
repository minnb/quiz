<?php

function convertDateTo2Char($str, $char){
	$arr = explode($char, $str);
	$date = $arr[0].'-'.$arr[1];
	return $date;
}