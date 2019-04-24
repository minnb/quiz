@extends('home.app')
@section('title', 'Nơi ươm mầm ước mơ cho con bạn')
@section('content')
<section class="pageTitleSection">
  <div class="container">
    <div class="pageTitleInfo">
      <h2>Giáo viên</h2>
      <ol class="breadcrumb">
        <li><a href="{{url('/')}}">Trang chủ</a></li>
        <li class="active">Giáo viên: {{$data->name}}</li>
      </ol>
    </div>
  </div>
</section>
<section class="mainContent full-width clearfix">
  <div class="container">
    <div class="row">
      <div class="col-sm-4 col-xs-12">
        <div class="teachersPhoto">
          <img src="{{ asset($data->avata)}}" alt="{{$data->name}}" class="img-rounded img-responsive">
        </div>
      </div>
      <div class="col-sm-8 col-xs-12">
        <div class="teachersInfo">
          <h3>Giới thiệu</h3>
          <p>{!! $data->description !!}</p>
          <ul class="list-inline">
            <li><a href="#" class="bg-color-4"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
          </ul>
          <!--
          <h3>Teachers Information</h3>
          <div class="teachersProfession bg-color-1">Designation</div>
          <div class="professionDetails">Assistent Teacher</div>
          <div class="teachersProfession bg-color-2">Degree</div>
          <div class="professionDetails">English Literature</div>
          <div class="teachersProfession bg-color-3">Experience</div>
          <div class="professionDetails">10 Years In Preschool Education</div>
          <div class="teachersProfession bg-color-4">Hobbies</div>
          <div class="professionDetails">Music,Dancing And Playing Football</div>
          <div class="teachersProfession bg-color-5">My Course</div>
          <div class="professionDetails">Language,Grammer</div>
      -->
        </div>
      </div>
    </div>
  </div>
</section>
@endsection