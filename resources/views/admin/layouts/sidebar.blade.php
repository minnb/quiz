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
						<li><a href="#">Chuyên đề</a></li>
						<li><a href="#">Môn học</a></li>
						<li><a href="{{ route('get.admin.course.list') }}">Khoá học</a></li>
						<li><a href="{{ route('get.admin.class.list') }}">Lớp học</a></li>
					</ul>
                </li>
                <li class="submenu">
                    <a href="#"><i class="fa fa-leanpub bigfonts"></i> <span> Học & Thi </span> <span class="menu-arrow"></span></a>
					<ul class="list-unstyled">
						<li><a href="#">Danh sách câu hỏi</a></li>
						<li><a href="#">Danh sách bài giảng</a></li>
						<li><a href="#">Đề thi</a></li>
					</ul>
                </li>
                <li class="submenu">
                    <a href="#"><i class="fa fa-cogs bigfonts"></i> <span> Quản trị</span> <span class="menu-arrow"></span></a>
					<ul class="list-unstyled">
						<li><a href="#">Danh sách tài khoản</a></li>
					</ul>
                </li>

            </ul>
        <div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>