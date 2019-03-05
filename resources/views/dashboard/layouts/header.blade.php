<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Học Hiệu Quả | @yield('title')</title>
    <meta name="robots" content="noindex">
    <link type="text/css" href="{{ asset('public/dashboard/vendor/perfect-scrollbar.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('public/dashboard/css/material-icons.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('public/dashboard/css/material-icons.rtl.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('public/dashboard/css/fontawesome.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('public/dashboard/css/fontawesome.rtl.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('public/dashboard/css/app.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('public/dashboard/css/app.rtl.css') }}" rel="stylesheet">
    @yield('stylesheet')
    <script type="text/javascript">
        var baseURL = "{!! url('/') !!}";
        window.setTimeout(function() {
            $("#flash-message").fadeTo(500, 0).slideUp(500, function(){
            $(this).remove();
            });
        }, 5000);
    </script>
</head>
<?php
    $infoUserHHQ = App\Models\User::getInfoUser();
?>
<body class=" layout-fluid">
<div class="preloader">
    <div class="sk-double-bounce">
        <div class="sk-child sk-double-bounce1"></div>
        <div class="sk-child sk-double-bounce2"></div>
    </div>
</div>
<!-- Header Layout -->
<div class="mdk-header-layout js-mdk-header-layout">

