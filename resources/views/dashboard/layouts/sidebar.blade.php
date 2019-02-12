<div class="mdk-drawer js-mdk-drawer" id="default-drawer">
        <div class="mdk-drawer__content ">
            <div class="sidebar sidebar-left sidebar-dark bg-dark o-hidden" data-perfect-scrollbar>
                <div class="sidebar-p-y">
                    <div class="sidebar-heading">Dashboard</div>
                    <ul class="sidebar-menu sm-active-button-bg">
                        <li class="sidebar-menu-item active">
                            <a class="sidebar-menu-button" href="{{ route('dashboard')}}">
                                <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">account_box</i> {{ App\Models\User::getInfoUser()['name'] }}
                            </a>
                        </li>
                        <!--
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">school</i> Instructor
                            </a>
                        </li>
                    -->
                    </ul>
                    <!-- Account menu -->
                    <div class="sidebar-heading">Tài khoản</div>
                    <ul class="sidebar-menu">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button sidebar-js-collapse" data-toggle="collapse" href="#account_menu">
                                <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">person_outline</i>
                                Thông tin
                                <span class="ml-auto sidebar-menu-toggle-icon"></span>
                            </a>
                            <ul class="sidebar-submenu sm-indent collapse" id="account_menu">
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">Thông tin cá nhân</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">Lịch sử thanh toán</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">Hoá đơn</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" data-toggle="collapse" href="#messages_menu">
                                <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">comment</i> Tin nhắn
                                <span class="ml-auto sidebar-menu-toggle-icon"></span>
                            </a>
                            <ul class="sidebar-submenu sm-indent collapse" id="messages_menu">
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">Tin nhắn 1</span>
                                        <span class="sidebar-menu-badge badge badge-primary badge-notifications ml-auto">2</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">Tin nhắn 2</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <div class="sidebar-heading">Học viên</div>
                    <ul class="sidebar-menu sm-active-button-bg">
                        <!--
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">search</i> Khoá học
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">import_contacts</i> Danh sách khoá học
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">class</i> Nâng cao
                                <span class="sidebar-menu-badge badge badge-primary ml-auto">PRO</span>
                            </a>
                        </li>
                        -->
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="{{ route('get.dashboard.course.list') }}">
                                <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">import_contacts</i> Danh sách khoá học
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="{{ route('get.dashboard.course.mycourse') }}">
                                <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">school</i> Khoá học của tôi
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">dvr</i> Làm bài kiểm tra
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">poll</i> Sổ điểm
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" data-toggle="collapse" href="#forum_menu">
                                <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">chat_bubble_outline</i>
                                Kết nối
                                <span class="ml-auto sidebar-menu-toggle-icon"></span>
                            </a>
                            <ul class="sidebar-submenu sm-indent collapse" id="forum_menu">
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">Forum</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">Discussion</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">Student Profile - Courses</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">Student Profile - Posts</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">Instructor Profile</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">live_help</i> Trợ giúp
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="{{ route('dashboard.logout') }}">
                                <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">lock_open</i> Thoát
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
</div>
