@extends('dashboard.app')
@section('title', 'Kết quả')
@section('content')
	<div data-push data-responsive-width="992px" class="mdk-drawer-layout js-mdk-drawer-layout">
                <div class="mdk-drawer-layout__content page ">

                    <div class="container-fluid page__container">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                            <li class="breadcrumb-item active">Luyện tập</li>
                        </ol>
                        <div class="media mb-headings align-items-center">
                            <div class="media-body">
                                <h1 class="h2">Luyện tập đề thi</h1>
                            </div>
                            <div class="media-right">
                                <a href="#" class="btn btn-success">
                                    Have a Question <i class="material-icons btn__icon--right">help_outline</i>
                                </a>
                            </div>
                        </div>
                        <div class="card-columns">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <div class="flex">
                                        <h4 class="card-title">Thi theo chuyên đề</h4>
                                        <div class="card-subtitle">Getting started</div>
                                    </div>
                                    <i class="material-icons text-muted-light">info_outline</i>
                                </div>
                                <ul class="list-group list-group-fit">
                                    <li class="list-group-item">
                                        <a href=""><i class="material-icons float-right text-muted-light">trending_flat</i> Basic Setup</a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href=""><i class="material-icons float-right text-muted-light">trending_flat</i> Working with the Dev</a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href=""><i class="material-icons float-right text-muted-light">trending_flat</i> Your first deploy</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <div class="flex">
                                        <h4 class="card-title">Thi tuần</h4>
                                        <div class="card-subtitle">Documentation</div>
                                    </div>
                                    <i class="material-icons text-muted-light">info_outline</i>
                                </div>
                                <ul class="list-group list-group-fit">
                                    <li class="list-group-item">
                                        <a href=""><i class="material-icons float-right text-muted-light">trending_flat</i> Styling with SASS</a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href=""><i class="material-icons float-right text-muted-light">trending_flat</i> Editing the Pages</a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href=""><i class="material-icons float-right text-muted-light">trending_flat</i> Saving for later</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <div class="flex">
                                        <h4 class="card-title">Thi tháng</h4>
                                        <div class="card-subtitle">Documentation</div>
                                    </div>
                                    <i class="material-icons text-muted-light">info_outline</i>
                                </div>
                                <ul class="list-group list-group-fit">
                                    <li class="list-group-item">
                                        <a href="">
                                            <i class="material-icons float-right text-muted-light">trending_flat</i>
                                            Course API Docs
                                        </a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href=""><i class="material-icons float-right text-muted-light">trending_flat</i> Student API Docs</a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href=""> <i class="material-icons float-right text-muted-light">trending_flat</i>Instructor API Docs</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <div class="flex">
                                        <h4 class="card-title">Thi học kỳ</h4>
                                        <div class="card-subtitle">Documentation</div>
                                    </div>
                                    <i class="material-icons text-muted-light">info_outline</i>
                                </div>
                                <ul class="list-group list-group-fit">
                                    <li class="list-group-item">
                                        <a href="">
                                            <i class="material-icons float-right text-muted-light">trending_flat</i>
                                            Học kỳ 1
                                        </a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href=""><i class="material-icons float-right text-muted-light">trending_flat</i> Học kỳ 2</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>

@endsection
