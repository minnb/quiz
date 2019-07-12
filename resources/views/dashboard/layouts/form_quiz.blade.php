<div id="unit_test" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title media align-items-center" id="titleUnitTest">Bài tập trắc nghiệm </h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div id="templateQuestion">

                </div>
            </div>
            <div class="modal-footer buttons">
                <button type="button " onclick="previewAnswer()" class="btn btn-success preview"><i
                        class="fa fa-angle-double-left" aria-hidden="true"></i> Preview </button>
                <button type="button" onclick="markTest()" class="btn btn-success finish">Nộp bài</button>
                <button type="button " onclick="nextAnswer()" class="btn btn-success next">Next <i
                        class="fa fa-angle-double-right" aria-hidden="true"></i> </i></button>

            </div>
        </div>
    </div>
</div>
<div class="container disappear" id="answer_question">
    <div class="title">Đáp án câu trả lời</div>
    <div class="content">
    </div>
</div>