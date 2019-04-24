  <nav id="menuBar" class="navbar navbar-default lightHeader" role="navigation">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="{{ url('/')}}"><img src="{{ asset('public/home/img/logo-school.png') }}" alt="Học hiệu quả"></a>
      </div>
      <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown singleDrop color-1   active ">
            <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
              <i class="fa fa-home bg-color-1" aria-hidden="true"></i> <span class="active">Trang chủ</span>
            </a>
          </li>
          <?php
            $menu_course = App\Models\Course::where('status',1)->orderBy('code')->get();
            $menu_teacher =  App\Models\Teacher::where('status', 1)->orderBy('id')->get();
          ?>
          <li class="dropdown singleDrop color-3 ">
            <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-file-text-o bg-color-2" aria-hidden="true"></i> <span>Khoá học</span></a>
            <ul class="dropdown-menu dropdown-menu-left">
              @foreach($menu_course as $item)
                <li class=" "><a href="{{route('home.course.detail', ['id'=>fencrypt($item->id), 'name'=>Illuminate\Support\Str::slug($item->full_name)])}}">{{ $item->full_name }}</a></li>
              @endforeach
            </ul>
          </li>
          <li class="dropdown singleDrop color-3 ">
            <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-list-ul bg-color-3" aria-hidden="true"></i> <span>Giáo viên</span></a>
            <ul class="dropdown-menu dropdown-menu-left">
              @foreach($menu_teacher as $item)
                <li class=" "><a href="{{ route('home.teacher.detail',['id'=>fencrypt($item->id), 'name'=>Illuminate\Support\Str::slug($item->name)]) }}">{{ $item->name }}</a></li>
              @endforeach
            </ul>
          </li>
          <li class="dropdown singleDrop color-1 ">
            <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
              <i class="fa fa-home bg-color-1" aria-hidden="true"></i> <span class="active">Hợp tác</span>
            </a>
          </li>
          <li class="dropdown singleDrop color-1 ">
            <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
              <i class="fa fa-pencil-square-o bg-color-4" aria-hidden="true"></i> <span class="active">Hỗ trợ</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</header>