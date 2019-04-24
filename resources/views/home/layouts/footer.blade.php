    <footer>
      <div class="container-fluid color-bar clearfix">
        <div class="row">
          <div class="col-sm-1 col-xs-2 bg-color-1">fix bar</div>
          <div class="col-sm-1 col-xs-2 bg-color-2">fix bar</div>
          <div class="col-sm-1 col-xs-2 bg-color-3">fix bar</div>
          <div class="col-sm-1 col-xs-2 bg-color-4">fix bar</div>
          <div class="col-sm-1 col-xs-2 bg-color-5">fix bar</div>
          <div class="col-sm-1 col-xs-2 bg-color-6">fix bar</div>
          <div class="col-sm-1 bg-color-1 hidden-xs">fix bar</div>
          <div class="col-sm-1 bg-color-2 hidden-xs">fix bar</div>
          <div class="col-sm-1 bg-color-3 hidden-xs">fix bar</div>
          <div class="col-sm-1 bg-color-4 hidden-xs">fix bar</div>
          <div class="col-sm-1 bg-color-5 hidden-xs">fix bar</div>
          <div class="col-sm-1 bg-color-6 hidden-xs">fix bar</div>
        </div>
      </div>
      <div class="footerInfoArea full-width clearfix" style="background-image: url({{asset('public/home/img/footer/footer-bg-1.png') }} );">
        <div class="container">
          <div class="row">
            <div class="col-sm-3 col-xs-12">
              <div class="footerTitle">
                <a href="{{url('/')}}"><img src="{{ asset('public/home/img/logo-footer.png') }}"></a>
              </div>
              <div class="footerInfo">
                <p><i>Để mỗi giờ con học là những phút giây vui vẻ. Học bất cứ đâu, hiểu bất cứ điều gì.</i></p>
                <p><i>Học Hiệu Quả - Giáo viên tận tâm, nhiệt tình. Hệ thống học thi thông minh.</i></p>
              </div>
            </div>
            <div class="col-sm-3 col-xs-12">
              <div class="footerTitle">
                <h4>Kênh hỗ trợ</h4>
              </div>
              <div class="footerInfo">
                <ul class="list-unstyled footerList">
                  <li>
                    <a href="#">
                      <i class="fa fa-angle-double-right" aria-hidden="true"></i>Danh sách giáo viên
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-angle-double-right" aria-hidden="true"></i>Hương dẫn đăng ký
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-angle-double-right" aria-hidden="true"></i>Hướng dẫn sử dụng
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-angle-double-right" aria-hidden="true"></i>Hợp tác cùng hochieuqua.vn
                    </a>
                  </li>
                  <li>
                    <a href="{{ route('home.faq') }}">
                      <i class="fa fa-angle-double-right" aria-hidden="true"></i>Câu hỏi thường gặp
                    </a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="col-sm-3 col-xs-12">
              <div class="footerTitle">
                <h4>Bài viết gần đây</h4>
              </div>
              <div class="footerInfo">
                <ul class="list-unstyled postLink">
                  <?php $lstNews = App\Models\News::getTopNews(3); ?>
                  @if($lstNews->count() > 0)
                  @foreach($lstNews as $item)
                  <li>
                    <div class="media">
                      <a class="media-left" href="single-blog.html">
                        <img class="media-object img-rounded border-color-1" src="{{ asset($item->image) }}" alt="Image">
                      </a>
                      <div class="media-body">
                        <h5 class="media-heading"><a href="single-blog.html">{!! $item->name !!} &nbsp;&nbsp;<small>{{ Carbon\Carbon::parse($item->updated_at) }}</small></a></h5>
                      </div>
                    </div>
                  </li>
                  @endforeach
                  @endif
                </ul>
              </div>
            </div>
            <div class="col-sm-3 col-xs-12">
              <div class="footerTitle">
                <h4>Đăng ký nhận email</h4>
              </div>
              <div class="footerInfo">
                <p>Học hiệu quả - Cho thành công mai sau</p>
                <div class="input-group">
                  <input type="text" class="form-control" placeholder="Email address" aria-describedby="basic-addon21">
                  <button type="submit" class="input-group-addon" id="basic-addon21"><i class="fa fa-check" aria-hidden="true"></i></button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="copyRight clearfix">
        <div class="container">
          <div class="row">
            <div class="col-sm-5 col-sm-push-7 col-xs-12">
              <ul class="list-inline">
                <li><a href="#" class="bg-color-1"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                <li><a href="#" class="bg-color-2"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                <li><a href="#" class="bg-color-3"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                <li><a href="#" class="bg-color-4"><i class="fa fa-pinterest-p" aria-hidden="true"></i></a></li>
                <li><a href="#" class="bg-color-5"><i class="fa fa-vimeo" aria-hidden="true"></i></a></li>
              </ul>
            </div>
            <div class="col-sm-7 col-sm-pull-5 col-xs-12">
              <div class="copyRightText">
                <p>© 2019 Copyright - Học Hiệu Quả <a href="#"></a></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
    </div>

    <div class="scrolling">
      <a href="#pageTop" class="backToTop hidden-xs" id="backToTop"><i class="fa fa-arrow-up" aria-hidden="true"></i></a>
    </div>
    <div class="modal fade customModal" id="loginModal" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="panel panel-default formPanel">
            <div class="panel-heading bg-color-1 border-color-1">
              <h3 class="panel-title">Đăng nhập</h3>
            </div>
            <div class="panel-body">
              <form action="{{ route('home.login.post') }}" method="POST" role="form">
                 @csrf
                <div class="form-group formField">
                  <input type="text" name="email" class="form-control" placeholder="Địa chỉ email">
                </div>
                <div class="form-group formField">
                  <input type="password" name="password" class="form-control" placeholder="Mật khẩu">
                </div>
                <div class="form-group formField">
                  <input type="submit" class="btn btn-primary btn-block bg-color-4 border-color-4" value="Đăng nhập">
                </div>
                <div class="form-group formField">
                  <p class="help-block">
                  <a href="{{ URL::to('auth/google') }}" class="btn-social btn-google-link"><i class="fa fa-google"></i> <span style="font-size: 15px;">Đăng nhập với Gmail</span></a>
                  </p>
                </div>
                <br>
                <div class="form-group formField">
                  <p class="help-block"><a href="#" style="color:#000">Quên mật khẩu?</a></p>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade customModal" id="createAccount" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="panel panel-default formPanel">
            <div class="panel-heading bg-color-1 border-color-1">
              <h3 class="panel-title">Đăng ký</h3>
            </div>
            <div class="panel-body">
              <form action="#" method="POST" role="form">
                <div class="form-group formField">
                  <input type="text" name="name" class="form-control" placeholder="Họ tên">
                </div>
                <div class="form-group formField">
                  <input type="email" name="email" class="form-control" placeholder="Địa chỉ email">
                </div>
                <div class="form-group formField">
                  <input type="text" name="phone" class="form-control" placeholder="Số điện thoại">
                </div>
                <div class="form-group formField">
                  <input type="password" name="password" class="form-control" placeholder="Mật khẩu">
                </div>
                <div class="form-group formField">
                  <input type="password" name="repassword" class="form-control" placeholder="Nhập lại Mật khẩu">
                </div>
                <div class="form-group formField">
                  <input type="submit" class="btn btn-primary btn-block bg-color-4 border-color-4" value="Đăng ký">
                </div>
                <div class="form-group formField">
                  <a href="{{ URL::to('auth/google') }}" class=" btn btn-primary btn-block bg-color-3 border-color-3 btn-social btn-google-link" style="color:#fff"><i class="fa fa-google"></i> <span style="font-size: 15px;">Đăng ký với Gmail</span></a>

                  <p class="help-block">Bạn đã có tài khoản? <a href="#">Đăng nhập</a></p>
                  
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="{{ asset('public/home/plugins/jquery/jquery-min.js') }}"></script>
    <script src="{{ asset('public/home/plugins/jquery-ui/jquery-ui.js') }}"></script>
    <script src="{{ asset('public/home/plugins/bootstrap/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('public/home/plugins/rs-plugin/js/jquery.themepunch.tools.min.js') }}"></script>
    <script src="{{ asset('public/home/plugins/rs-plugin/js/jquery.themepunch.revolution.min.js') }}"></script>
    <script src="{{ asset('public/home/plugins/selectbox/jquery.selectbox-0.1.3.min.js') }}"></script>
    <script src="{{ asset('public/home/plugins/owl-carousel/owl.carousel.js') }}"></script>
    <script src="{{ asset('public/home/plugins/waypoint/waypoints.min.js') }}"></script>
    <script src="{{ asset('public/home/plugins/counter-up/jquery.counterup.min.js') }}"></script>
    <script src="{{ asset('public/home/plugins/isotope/isotope.min.js') }}"></script>
    <script src="{{ asset('public/home/plugins/fancybox/jquery.fancybox.min.js') }}"></script>
    <script src="{{ asset('public/home/plugins/isotope/isotope-triger.js') }}"></script>
    <script src="{{ asset('public/home/plugins/countdown/jquery.syotimer.js') }}"></script>
    <script src="{{ asset('public/home/plugins/velocity/velocity.min.js') }}"></script>
    <script src="{{ asset('public/home/plugins/smoothscroll/SmoothScroll.js') }}"></script>
    <script src="{{ asset('public/home/plugins/wow/wow.min.js') }}"></script>
    <script src="{{ asset('public/home/js/app.js') }}"></script>
</body>
</html>
