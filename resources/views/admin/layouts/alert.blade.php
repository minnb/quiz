@if ($errors->any())
<div class="container-fluid" id="flash-message">
    <div class="alert alert-danger alert-dismissible fade in" role="alert">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
</div>
@endif