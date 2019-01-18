@extends('dashboard.app')
@section('title', 'Dashboard')
@section('content')
	{{ $value }} 
	<h1>WELCOME TO DASHBOARD</h1>
	<a href="{{ route('dashboard.logout') }}">Logout</a>
@endsection
