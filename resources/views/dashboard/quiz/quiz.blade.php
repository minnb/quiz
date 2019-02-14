<!doctype html>
<html lang="en">
<head>
    <title>Smart Wizard - a JavaScript jQuery Step Wizard plugin</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href = "{{ asset('public/assets/css/bootstrap.min.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ asset('public/dashboard/quiz/css/smart_wizard.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('public/dashboard/quiz/css/smart_wizard_theme_circles.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('public/dashboard/quiz/css/smart_wizard_theme_arrows.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('public/dashboard/quiz/css/smart_wizard_theme_dots.css') }}" rel="stylesheet" type="text/css" />
</head>
<body>
    <br>
    <div class="container">
        <div id="smartwizard">
            <h4 class="border-bottom border-gray pb-2"><small>Chuyên đề: {{App\Models\Thematic::find($thematic_id)->name}}</small></h4>
            <ul>
              @foreach($question_data as $key=>$item)
                <li><a href="#step-{{$key+1}}">Câu số {{$key+1}}<br /></a></li>
              @endforeach
            </ul>
            <div>

                <div id="step-1" class="">
                    <h3 class="border-bottom border-gray pb-2">Step 3 Content</h3>
                    <div class="card">
                        <div class="card-header">My Details</div>
                        <div class="card-block p-0">
                          <table class="table">
                              <tbody>
                                  <tr> <th>Name:</th> <td>Tim Smith</td> </tr>
                                  <tr> <th>Email:</th> <td>example@example.com</td> </tr>
                              </tbody>
                          </table>
                        </div>
                    </div>
                </div>
               
            </div>
        </div>
        {{ print_result($question_data) }}
    </div>

    <script type="text/javascript" src="{{ asset('public/assets/js/jquery.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('public/assets/js/popper.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('public/assets/js/bootstrap.min.js') }}" ></script>
    <script type="text/javascript" src="{{ asset('public/dashboard/quiz/js/jquery.smartWizard.js') }}"></script>

    <script type="text/javascript">
        $(document).ready(function(){
            // Step show event
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
            // Toolbar extra buttons
            var btnFinish = $('<button></button>').text('Nộp bài')
                                             .addClass('btn btn-info')
                                             .on('click', function(){ alert('Finish Clicked'); });
            var btnCancel = $('<button></button>').text('Làm lại')
                                             .addClass('btn btn-danger')
                                             .on('click', function(){ $('#smartwizard').smartWizard("reset"); });
            // Smart Wizard
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
            // External Button Events
            $("#reset-btn").on("click", function() {
                // Reset wizard
                $('#smartwizard').smartWizard("reset");
                return true;
            });
            $("#prev-btn").on("click", function() {
                // Navigate previous
                $('#smartwizard').smartWizard("prev");
                return true;
            });

            $("#next-btn").on("click", function() {
                // Navigate next
                $('#smartwizard').smartWizard("next");
                return true;
            });

            $("#theme_selector").on("change", function() {
                // Change theme
                $('#smartwizard').smartWizard("theme", $(this).val());
                return true;
            });

            $("#theme_selector").change();
        });
    </script>
</body>
</html>
