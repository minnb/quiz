function alertDelete(){
    var x = confirm("Bạn có chắc muốn xoá bản ghi này không?");
    if (x)
        return true;
    else
        return false;
}

$(document).ready(function(){
    $('#type-question').change(function(e)
       {
        var _token = $("form[name='create-question']").find("input[name='_token']").val();
        e.preventDefault();
        $id = $(this).val();
        $("div").remove( "#answer_result" );
        $.get
         ({
         url: baseURL +'/dashboard/quiz/api/answer/'+$id,
         type: 'GET',
         dataType: 'html',
         success: function(data)
           {
             console.log(data);
             $("#answer_result_parent").append(data);
           }
         });
     });
});