@extends('home.app')
@section('title', 'Nơi ươm mầm ước mơ cho con bạn')
@section('content')
<section class="pageTitleSection">
  <div class="container">
    <div class="pageTitleInfo">
      <h2>Khóa học</h2>
      <ol class="breadcrumb">
        <li><a href="{{url('/')}}">Trang chủ</a></li>
        <li class="">{{ $data->full_name }}</li>
      </ol>
    </div>
  </div>
</section>
 <section class="mainContent full-width clearfix courseSingleSection">
      <div class="container">
        <div class="row">
          <div class="col-md-9 col-sm-8 col-xs-12 block pull-right">
            <div class="thumbnail thumbnailContent alt">
              <div class="embed-responsive embed-responsive-16by9">
                <iframe class="embed-responsive-item" src="{{$data->link_video}}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen>
                </iframe>
              </div>
              <div class="sticker bg-color-1">{{number_format($data->unit_price) }}<ins>đ</ins></div>
              <div class="caption border-color-1">
                <h3 class="color-1">Nội dung khóa học</h3>
                {!! $data->description !!}
                <h3 class="color-1">Đề cương khóa học</h3>
                <div class="table-responsive">
                  <table class="table table-curved">
                    <thead>
                      <tr>
                        <th class="col-sm-2 bg-color-1">Time <i class="fa fa-arrow-down" aria-hidden="true"></i></th>
                        <th class="col-sm-2 bg-color-2">Monday</th>
                        <th class="col-sm-2 bg-color-3">Tuesday</th>
                        <th class="col-sm-2 bg-color-4">Wednesday</th>
                        <th class="col-sm-2 bg-color-5">Thursday</th>
                        <th class="col-sm-2 bg-color-6">Friday</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>9.00 - 10.00 AM</td>
                        <td>
                          <span class="color-2">History</span>
                          School History
                        </td>
                        <td>
                          <span class="color-3">Math</span>
                          Larning Numbers
                        </td>
                        <td>
                          <span class="color-4">Geography</span>
                          Making a Map
                        </td>
                        <td>
                          <span class="color-5">English</span>
                          Speaking English
                        </td>
                        <td>
                          <span class="color-6">Art</span>
                          Art
                        </td>
                      </tr>
                      <tr>
                        <td>10.00 - 11.00 AM</td>
                        <td>
                          <span class="color-2">Geography</span>
                          Making a Map
                        </td>
                        <td>
                          <span class="color-3">English</span>
                          Speaking English
                        </td>
                        <td>
                          <span class="color-4">Art</span>
                          Art
                        </td>
                        <td>
                          <span class="color-5">Math</span>
                          Larning Numbers
                        </td>
                        <td>
                          <span class="color-6">History</span>
                          School History
                        </td>
                      </tr>
                      <tr>
                        <td>11.00 - 11.30 AM</td>
                        <td>
                          <span class="color-2">Break</span>
                          Lunch
                        </td>
                        <td>
                          <span class="color-3">Break</span>
                          Lunch
                        </td>
                        <td>
                          <span class="color-4">Break</span>
                          Lunch
                        </td>
                        <td>
                          <span class="color-5">Break</span>
                          Lunch
                        </td>
                        <td>
                          <span class="color-6">Break</span>
                          Lunch
                        </td>
                      </tr>
                      <tr>
                        <td>11.30 - 12.30 PM</td>
                        <td>
                          <span class="color-2">English</span>
                          Speaking English
                        </td>
                        <td>
                          <span class="color-3">Art</span>
                          Art
                        </td>
                        <td>
                          <span class="color-4">History</span>
                          School History
                        </td>
                        <td>
                          <span class="color-5">Geography</span>
                          Making a Map
                        </td>
                        <td>
                          <span class="color-6">Math</span>
                          Larning Numbers
                        </td>
                      </tr>
                      <tr>
                        <td>12.30 - 1.30 PM</td>
                        <td>
                          <span class="color-2">Geography</span>
                          Making a Map
                        </td>
                        <td>
                          <span class="color-3">English</span>
                          Speaking English
                        </td>
                        <td>
                          <span class="color-4">Art</span>
                          Art
                        </td>
                        <td>
                          <span class="color-5">Math</span>
                          Larning Numbers
                        </td>
                        <td>
                          <span class="color-6">History</span>
                          School History
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="btnArea">
              <a href="#" class="btn btn-primary">Mua khóa học</a>
            </div>
          </div>
          <div class="col-md-3 col-sm-4 col-xs-12 pull-left">
            <aside>
              <div class="rightSidebar">
                <div class="panel panel-default">
                  <div class="panel-heading bg-color-1 border-color-1">
                    <h3 class="panel-title">Thông tin khóa học</h3>
                  </div>
                  <div class="panel-body">
                    <ul class="media-list">
                      <li class="media iconContet">
                        <div class="media-left iconContent bg-color-4">
                          <i class="fa fa-anchor" aria-hidden="true"></i>
                        </div>
                        <div class="media-body iconContent">
                          <h4 class="media-heading color-4">Giáo viên</h4>
                          <p>Đặng Thế Hiếu</p>
                        </div>
                      </li>
                      <li class="media">
                        <div class="media-left iconContent bg-color-6">
                          <i class="fa fa-money" aria-hidden="true"></i>
                        </div>
                        <div class="media-body iconContent">
                          <h4 class="media-heading color-6">Học phí</h4>
                          <p>{{number_format($data->unit_price) }}<ins>đ</ins></p>
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
                <div class="btnPart">
                  <a href="#" class="btn btn-primary btn-block bg-color-6">Đăng ký học</a>
                </div>
                @if($data_course->count()>0)
                <div class="panel panel-default">
                  <div class="panel-heading bg-color-5 border-color-5">
                    <h3 class="panel-title">Khóa học khác</h3>
                  </div>
                  <div class="panel-body">
                    <ul class="media-list blogListing">
                      @foreach($data_course as $key=>$item)
                      <li class="media">
                        <div class="media-left">
                          <a href="{{ route('home.course.detail',['id'=>$item->id, 'name'=>makeUnicode($item->name)])}}">
                            <img src="{{ asset(getImage($item->image)) }}" alt="{{$item->full_name}}" class="img-rounded" style="max-height: 50px"></a>
                        </div>
                        <div class="media-body">
                          <h4 class="media-heading"><a href="#">{{$item->full_name}}</a></h4>
                          <p>Học phí: @if($item->unit_price > 0) <span style="color:red; font-weight: bold;"> {{ number_format($item->unit_price) }} </span>
                            <ins>đ</ins>
                            @else <small style="color:blue">Miễn phí</small>
                            @endif</p>
                        </div>
                      </li>
                      @endforeach
                    </ul>
                  </div>
                </div>
                @endif
              </div>
            </aside>
          </div>
        </div>
      </div>
    </section>
@endsection