@extends('home.app')
@section('title', 'Nơi ươm mầm ước mơ cho con bạn')
@section('content')
<section class="pageTitleSection">
  <div class="container">
    <div class="pageTitleInfo">
      <h2>Hỏi đáp</h2>
      <ol class="breadcrumb">
        <li><a href="{{url('/')}}">Trang chủ</a></li>
        <li class="">Hỏi đáp</li>
      </ol>
    </div>
  </div>
</section>
 <section class="mainContent full-width clearfix">
      <div class="container">
        <div class="row">
          <div class="col-md-9 col-sm-8 col-xs-12">
            <div class="accordionCommon hello" id="faqAccordion">
              <div class="panel-group" id="accordionFaq">
              @if($data->count() > 0)
                @foreach($data as $key=>$item)
                <div class="panel panel-default">
                  <a class="panel-heading accordion-toggle bg-color-{{rand(1,5)}}" data-toggle="collapse" data-parent="#accordionFaq" href="#collapse-{{$key}}">
                    <span>{{ $item->name }}</span>
                    <span class="iconBlock"><i class="fa fa-chevron-up"></i></span>
                  </a>
                  <div id="collapse-{{$key}}" class="panel-collapse collapse">
                    <div class="panel-body">
                      {!! $item->content !!}
                    </div>
                  </div>
                </div>
                @endforeach
              @endif
              </div>
            </div>
          </div>
          <div class="col-md-3 col-sm-4 col-xs-12">
            <aside>
              <div class="panel panel-default eventSidebar">
                <div class="panel-heading bg-color-1 border-color-1">
                  <h3 class="panel-title">Đặt câu hỏi</h3>
                </div>
                <div class="panel-body">
                  <div class="homeContactContent">
                    <form action="#" method="POST" role="form">
                      <div class="form-group">
                        <i class="fa fa-user"></i>
                        <input type="text" class="form-control border-color-1" id="exampleInputEmail1" placeholder="Họ tên">
                      </div>
                      <div class="form-group">
                        <i class="fa fa-envelope" aria-hidden="true"></i>
                        <input type="text" class="form-control border-color-2" id="exampleInputEmail2" placeholder="Địa chỉ email">
                      </div>
                      <div class="form-group">
                        <i class="fa fa-comments" aria-hidden="true"></i>
                        <textarea class="form-control border-color-4" placeholder="Nội dung"></textarea>
                      </div>
                      <button type="submit" class="btn btn-primary btn-Full">Gửi câu hỏi</button>
                    </form>
                  </div>
                </div>
              </div>
            </aside>
          </div>
        </div>
      </div>
    </section>
@endsection