<div class="left main-sidebar">
	<div class="sidebar-inner leftscroll">
		<div id="sidebar-menu">
			<ul>
				<li class="submenu">
					<a class="active" href="{{ route('admin') }}"><i class="fa fa-fw fa-bars"></i><span> Dashboard </span> </a>
                </li>
				<li class="submenu">
                    <a href="#"><i class="fa fa-fw fa-area-chart"></i><span> Thống kê </span> </a>
                </li>
				<li class="submenu">
                    <a href="#"><i class="fa fa-fw fa-table"></i> <span> Danh mục </span> <span class="menu-arrow"></span></a>
					<ul class="list-unstyled">
						<li><a href="{{ route('get.admin.teacher.list') }}">Giáo viên</a></li>
						<li><a href="{{ route('get.admin.subject.list') }}">Môn học</a></li>
						<li><a href="{{ route('get.admin.course.list') }}">Khoá học</a></li>
						<li><a href="{{ route('get.admin.class.list') }}">Lớp học</a></li>
					</ul>
                </li>
                <li class="submenu">
                    <a href="#"><i class="fa fa-leanpub bigfonts"></i> <span> Học & Thi </span> <span class="menu-arrow"></span></a>
					<ul class="list-unstyled">
						<li><a href="{{ route('get.admin.thematic.list') }}">Danh sách Chuyên đề</a></li>
						<li><a href="{{ route('get.admin.quesstion.list.quiz') }}">DS câu hỏi luyện Quiz</a></li>
						<li><a href="{{ route('get.admin.quesstion.list.question') }}">DS câu hỏi luyện thi</a></li>
						<li><a href="{{ route('get.admin.lesson.list') }}">Danh sách bài giảng</a></li>
						<li><a href="{{ route('get.admin.exam.list') }}">Cấu hình Đề thi</a></li>
					</ul>
                </li>
                <li class="submenu">
                    <a href="#"><i class="fa fa-cogs bigfonts"></i> <span> Quản trị</span> <span class="menu-arrow"></span></a>
					<ul class="list-unstyled">
						<li><a href="{{ route('get.admin.user.list') }}">Danh sách tài khoản</a></li>
						<li><a href="{{ route('get.admin.user.list.course') }}">Học viên & khóa học</a></li>
					</ul>
                </li>

            </ul>
        <div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>