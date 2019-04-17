<!doctype html>
<html lang="en">
<head>
    <title>Luyện thi chuyên đề</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href = "{{ asset('public/assets/css/bootstrap.min.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ asset('public/dashboard/quiz/css/smart_wizard.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('public/dashboard/quiz/css/smart_wizard_theme_circles.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('public/dashboard/quiz/css/smart_wizard_theme_arrows.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('public/dashboard/quiz/css/smart_wizard_theme_dots.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('public/dashboard/quiz/css/quiz.css') }}" rel="stylesheet" type="text/css" />
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
</head>
<body class="body-quiz">
  <div class="preloader">
    <div class="sk-double-bounce">
        <div class="sk-child sk-double-bounce1"></div>
        <div class="sk-child sk-double-bounce2"></div>
    </div>
  </div>
    <br>
    <div class="container">
      <div class="row justify-content-md-center">
        <div class="col-lg-9 privew">
         <form action="{{ route('post.dashboard.quiz.take.detail',['quiz_id'=>fencrypt($quiz_id)])}}" method="POST">
           <input type="hidden" name="_token" value="{!! csrf_token() !!}">
            <div id="smartwizard" class="smartwizard">
              <h1 class="questions"><strong>Chuyên đề: {{ App\Models\Thematic::find($thematic)->name }}</strong></h1>
              <ul>
                <?php $i = 0; ?>
                @foreach($question_data as $key=>$item)
                  <li><a href="#step-{{$key+1}}">Câu {{$i+1}}<br /></a></li><?php $i++; ?>
                @endforeach
              </ul>
              <div class="privew">
                <?php $j = 0; ?>
                @foreach($question_data as $key=>$item)
                  <input type="hidden" name="questions[{{ $item['question_id'] }}]" value="{{ $item['question_id'] }}">
                  <div id="step-{{$key+1}}">
                      <div class="card no-border questionsBox">
                          <div class="card-header alert alert-primary">
                            <strong>Câu hỏi {{$j+1}}:</strong> <span> {!! $item['name'] !!}</span><?php $j++; ?>
                            @if($item['image'] != '')
                              <img src="{{ asset($item['image']) }}" class="img-thumb-question">
                            @endif
                          </div>
                           <ul class="answerList">
                            @foreach($item['answer'] as $i=>$value)
                              <li>
                                <label>
                                  <input type="radio" name="answer[{{$value['question_id']}}]" value="{{$value['stt']}}" id="radio{{$i}}">{!! $value['name'] !!}
                                </label>
                              </li>
                            @endforeach
                            <input type="radio" name="answer[{{$value['question_id']}}]" value="99" id="radio{{$i}}" checked="true" class="hidden">
                          </ul>
                      </div>
                  </div>
                @endforeach
              </div>
            </div>
          </form>
        </div>
      </div>
      <br>
      <div class="row justify-content-md-center">
        <div class="col-lg-9 privew">
            <div class="privew">
              <a class="btn btn-primary" href="{{route('dashboard')}}" style="float:left">Quay lại bài giảng</a>
              <a class="btn btn-danger" href="{{route('dashboard')}}" style="float:right">Bài giảng tiếp theo</a>
            </div>
        </div>
      </div>
    </div>
    <script type="text/javascript" src="{{ asset('public/assets/js/jquery.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('public/assets/js/popper.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('public/assets/js/bootstrap.min.js') }}" ></script>
    <script type="text/javascript" src="{{ asset('public/dashboard/quiz/js/jquery.smartWizard.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('public/dashboard/quiz/js/math.js')}}"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#smartwizard").on("showStep", function(e, anchorObject, stepNumber, stepDirection, stepPosition) {
               //alert("You are on step "+stepNumber+" now");
               if(stepPosition === 'first'){
                   $("#prev-btn").addClass('disabled');
               }else if(stepPosition === 'final'){
                   $("#next-btn").addClass('disabled');
               }else{
                   $("#prev-btn").removeClass('disabled');
                   $("#next-btn").removeClass('disabled');
               }
            });
            var btnFinish = $('<button type="submit"></button>').text('Nộp bài')
                                             .addClass('btn btn-info');
                                             //.on('click', function(){ alert('Nộp bài luyện thi'); });
            var btnCancel = $('<button></button>').text('Làm lại')
                                             .addClass('btn btn-danger')
                                             .on('click', function(){ $('#smartwizard').smartWizard("reset"); });
            $('#smartwizard').smartWizard({
                    selected: 0,
                    theme: 'default',
                    transitionEffect:'fade',
                    showStepURLhash: true,
                    toolbarSettings: {toolbarPosition: 'both',
                                      toolbarButtonPosition: 'end',
                                      toolbarExtraButtons: [btnFinish, btnCancel]
                                    }
            });
            $("#reset-btn").on("click", function() {
                $('#smartwizard').smartWizard("reset");
                return true;
            });
            $("#prev-btn").on("click", function() {
                $('#smartwizard').smartWizard("prev");
                return true;
            });

            $("#next-btn").on("click", function() {
                $('#smartwizard').smartWizard("next");
                return true;
            });

            $("#theme_selector").on("change", function() {
                $('#smartwizard').smartWizard("theme", $(this).val());
                return true;
            });

            $("#theme_selector").change();

            $(".fraction").each(function(key, value) {
                $this = $(this)
                var split = $this.html().split("/")
                if( split.length == 2 ){
                    $this.html('<span class="top">'+split[0]+'</span><span class="bottom">'+split[1]+'</span>')
                }    
            });

        });
    </script>
</body>
</html>
