@extends('home.app')
@section('title', 'Nơi ươm mầm ước mơ cho con bạn')
@section('content')
@include('home.layouts.banner')
    <section class="mainContent full-width clearfix featureSection">
      <div class="container">
        <div class="sectionTitle text-center " >
          <h2 class="wow fadeInUp">
            <span class="shape shape-left bg-color-4"></span>
            <span>Giới thiệu</span>
            <span class="shape shape-right bg-color-4"></span>
          </h2>
        </div>
        <div class="row ">
          <div class="col-sm-6 col-lg-4 col-xs-12">
            <div class="media featuresContent wow fadeInUp">
              <span class="media-left bg-color-1">
                <i class="fa fa-graduation-cap bg-color-1" aria-hidden="true"></i>
              </span>
              <div class="media-body">
                <h3 class="media-heading color-1">Giáo viên </h3>
                <p>Danh sách giáo viên giỏi, nhiều năm kinh nghiệm giảng dạy và luyện thi được tuyển chọn từ các trường THCS</p>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 col-xs-12">
            <div class="media featuresContent wow fadeInUp">
              <span class="media-left bg-color-2">
                <i class="fa fa-leaf bg-color-2" aria-hidden="true"></i>
              </span>
              <div class="media-body">
                <h3 class="media-heading color-2">Bài giảng</h3>
                <p>Hệ thống bài giảng trực tuyến sinh động, luôn đổi mới để phù hợp xu hướng mới</p>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 col-xs-12">
            <div class="media featuresContent wow fadeInUp">
              <span class="media-left bg-color-3">
                <i class="fa fa-car bg-color-3" aria-hidden="true"></i>
              </span>
              <div class="media-body">
                <h3 class="media-heading color-3">Luyện thi</h3>
                <p>Tuyển tập các đề thi trực tuyến phong phú, từ cơ bản đến nâng cao và sát với thực tế</p>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 col-xs-12">
            <div class="media featuresContent wow fadeInUp">
              <span class="media-left bg-color-4">
                <i class="fa fa-cutlery bg-color-4" aria-hidden="true"></i>
              </span>
              <div class="media-body">
                <h3 class="media-heading color-4">Trao đổi</h3>
                <p>Trao đổi và được Giáo viên hướng dẫn thông quan diễn đàn, facebook, email</p>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 col-xs-12">
            <div class="media featuresContent wow fadeInUp">
              <span class="media-left bg-color-5">
                <i class="fa fa-heart bg-color-5" aria-hidden="true"></i>
              </span>
              <div class="media-body">
                <h3 class="media-heading color-5">Học bạ</h3>
                <p>Quá trình học tập được Giáo viên nhận xét và chấm điểm. Gửi kết quả tới từng học sinh</p>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 col-xs-12">
            <div class="media featuresContent wow fadeInUp">
              <span class="media-left bg-color-6">
                <i class="fa fa-shield bg-color-6" aria-hidden="true"></i>
              </span>
              <div class="media-body">
                <h3 class="media-heading color-6">Định hướng</h3>
                <p>Học Hiệu Quả hôm nay - Cho Thành công mai sau</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    @if($data_course->count()>0)
    <section class="whiteSection full-width clearfix coursesSection"  id="ourCourses" >
      <div class="container">
        <div class="sectionTitle text-center">
          <h2 class="wow fadeInUp" >
            <span class="shape shape-left bg-color-4"></span>
            <span>Khoá học</span>
            <span class="shape shape-right bg-color-4"></span>
          </h2>
        </div>
        <div class="row ">
          @foreach($data_course as $key=>$item)
          <div class="col-sm-6 col-md-3 col-xs-12 block">
            <div class="thumbnail thumbnailContent wow fadeInUp">
              <a href="{{ route('home.course.detail',['id'=>$item->id, 'name'=>makeUnicode($item->name)])}}"><img src="{{ asset(getImage($item->image)) }}" alt="{{$item->full_name}}" class="img-responsive"></a>
              <div class="caption border-color-1">
                <h3><a href="{{ route('home.course.detail',['id'=>$item->id, 'name'=>makeUnicode($item->name)])}}" class="color-1">{{$item->full_name}}</a></h3>
                <ul class="list-unstyled">
                  <li><i class="fa fa-calendar-o" aria-hidden="true"></i>Học sinh lớp {{ $item->class }}</li>
                  <li><i class="fa fa-clock-o" aria-hidden="true"></i> Học phí: 
                    @if($item->unit_price > 0) <span style="color:red; font-weight: bold;"> {{ number_format($item->unit_price) }} </span><ins>đ</ins>
                    @else <span style="color:blue">Miễn phí</span>
                    @endif
                  </li>
                </ul>
                <p>{!! $item->description !!}</p>
                <ul class="list-inline btn-yellow">
                  <li><a href="{{ route('home.register.course.try', ['course'=>fencrypt($item->code)]) }}" class="btn btn-primary "><i class="fa fa-shopping-basket " aria-hidden="true"></i>Đăng ký học thử</a></li>
                  <li><a href="{{ route('home.course.detail',['id'=>$item->id, 'name'=>makeUnicode($item->name)])}}" class="btn btn-link"><i class="fa fa-angle-double-right" aria-hidden="true"></i> Chi tiết</a></li>
                </ul>
              </div>
            </div>
          </div>
          @endforeach
        </div>
        </div>
      </div>
    </section>
    @endif
    @if($data_teacher->count() > 0 )
    <section class="colorSection full-width clearfix bg-color-5 teamSection" id="ourTeam">
      <div class="container">
        <div class="sectionTitle text-center alt">
          <h2 class="wow fadeInUp">
            <span class="shape shape-left bg-color-3"></span>
            <span>Giáo viên</span>
            <span class="shape shape-right bg-color-3"></span>
          </h2>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <div class="owl-carousel teamSlider">
              @foreach($data_teacher as $key=>$item)
              <div class="slide wow fadeInUp">
                <div class="teamContent">
                  <div class="teamImage">
                    <img src="{{ asset($item->avata) }}" alt="{{$item->name}}" class="img-circle">
                    <div class="maskingContent">
                      <ul class="list-inline">
                        <li><a href="{{ route('home.teacher.detail',['id'=>fencrypt($item->id), 'name'=>Illuminate\Support\Str::slug($item->name)])}}"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                      </ul>
                    </div>
                  </div>
                  <div class="teamInfo">
                    <h3><a href="{{ route('home.teacher.detail',['id'=>fencrypt($item->id), 'name'=>Illuminate\Support\Str::slug($item->name)])}}">{{ $item->name }}</a></h3>
                    <p>Môn Toán</p>
                  </div>
                </div>
              </div>
              @endforeach
            </div>
          </div>
        </div>
      </div>
    </section>
    @endif
    <!--
    <section class="whiteSection full-width clearfix newsSection" id="latestNews">
      <div class="container">
        <div class="sectionTitle text-center">
          <h2 class="wow fadeInUp">
            <span class="shape shape-left bg-color-4"></span>
            <span>Tin tức</span>
            <span class="shape shape-right bg-color-4"></span>
          </h2>
        </div>

        <div class="row">
          <div class="col-sm-4 col-xs-12 block ">
            <div class="thumbnail thumbnailContent wow fadeInUp">
              <a href="single-blog-left-sidebar.html"><img src="{{ asset('public/home/img/home/news/news-1.jpg') }}" alt="image" class="img-responsive"></a>
              <div class="sticker-round bg-color-1">10 <br>July</div>
              <div class="caption border-color-1">
                <h3><a href="single-blog-left-sidebar.html" class="color-1">The standard chunk of Lorem.</a></h3>
                <ul class="list-inline">
                  <li><a href="single-blog-left-sidebar.html"><i class="fa fa-user" aria-hidden="true"></i>Jone Doe</a></li>
                  <li><a href="single-blog-left-sidebar.html"><i class="fa fa-comments-o" aria-hidden="true"></i>4 Comments</a></li>
                </ul>
                <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classi cal Latin literature. </p>
                <ul class="list-inline btn-yellow">
                  <li><a href="single-blog-left-sidebar.html" class="btn btn-link"><i class="fa fa-angle-double-right" aria-hidden="true"></i> Read More</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-sm-4 col-xs-12 block ">
            <div class="thumbnail thumbnailContent wow fadeInUp">
              <a href="single-blog-left-sidebar.html"><img src="{{ asset('public/home/img/home/news/news-2.jpg') }}" alt="image" class="img-responsive"></a>
              <div class="sticker-round bg-color-2">10 <br>July</div>
              <div class="caption border-color-2">
                <h3><a href="single-blog-left-sidebar.html" class="color-2">Vestibulum congue massa vitae.</a></h3>
                <ul class="list-inline">
                  <li><a href="single-blog-left-sidebar.html"><i class="fa fa-user" aria-hidden="true"></i>Jone Doe</a></li>
                  <li><a href="single-blog-left-sidebar.html"><i class="fa fa-comments-o" aria-hidden="true"></i>4 Comments</a></li>
                </ul>
                <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classi cal Latin literature. </p>
                <ul class="list-inline btn-green">
                  <li><a href="single-blog-left-sidebar.html" class="btn btn-link"><i class="fa fa-angle-double-right" aria-hidden="true"></i> Read More</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-sm-4 col-xs-12 block ">
            <div class="thumbnail thumbnailContent wow fadeInUp">
              <a href="single-blog-left-sidebar.html"><img src="{{ asset('public/home/img/home/news/news-3.jpg') }}" alt="image" class="img-responsive"></a>
              <div class="sticker-round bg-color-3">10 <br>July</div>
              <div class="caption border-color-3">
                <h3><a href="single-blog-left-sidebar.html" class="color-3">Curabitur ac nulla sodales risus.</a></h3>
                <ul class="list-inline">
                  <li><a href="single-blog-left-sidebar.html"><i class="fa fa-user" aria-hidden="true"></i>Jone Doe</a></li>
                  <li><a href="single-blog-left-sidebar.html"><i class="fa fa-comments-o" aria-hidden="true"></i>4 Comments</a></li>
                </ul>
                <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classi cal Latin literature. </p>
                <ul class="list-inline btn-red">
                  <li><a href="single-blog-left-sidebar.html" class="btn btn-link"><i class="fa fa-angle-double-right" aria-hidden="true"></i> Read More</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>

        <div class="btnArea">
          <a href="blog-grid.html" class="btn btn-primary">View more</a>
        </div>
      </div>
    </section>

    <section class="lightSection full-width clearfix homeContactSection">
      <div class="container">
        <div class="row">
          <div class="col-sm-6 col-xs-12 ">
            <div class="homeContactContent wow fadeInUp">
              <h2>Liên hệ</h2>
              <p></p>
              <address>
                <p><i class="fa fa-map-marker bg-color-1" aria-hidden="true"></i>Thị trấn Hữu Bằng, Huyện Thạch Thất, Hà Nội</p>
                <p><i class="fa fa-envelope bg-color-2" aria-hidden="true"></i><a href="mailto:hotro@hochieuqua.vn">hotro@hochieuqua.vn</a></p>
                <p><i class="fa fa-phone bg-color-4" aria-hidden="true"></i>0914 817 806</p>
              </address>
            </div>
          </div>
          <div class="col-sm-6 col-xs-12">
            <div class="homeContactContent wow fadeInUp">
              <form action="#" method="POST" role="form">
                <div class="form-group">
                  <i class="fa fa-user"></i>
                  <input type="text" class="form-control border-color-1" id="exampleInputEmail1" placeholder="Họ tên">
                </div>
                <div class="form-group">
                  <i class="fa fa-envelope" aria-hidden="true"></i>
                  <input type="text" class="form-control border-color-2" id="exampleInputEmail2" placeholder="Địa chỉ email">
                </div>
                <div class="form-group">
                  <i class="fa fa-comments" aria-hidden="true"></i>
                  <textarea class="form-control border-color-4" placeholder="Nội dung tin nhắn"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Gửi liên hệ</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
  -->
@endsection
