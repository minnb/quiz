//-------------------------------  plugin sinh ra template danh sách câu hỏi ------------------------------
function TemplateQuestion(data) {
    this.data = data;// mảng các  đối tương câu hỏi
}
// có 10 loại dạng câu hỏi: 
//     dạng 1: type = 1 là câu hỏi điền đúng sai 
//     dạng 2: type = 2 là câu hỏi chọn 1 đáp án đúng nhất
//     dạng 3: type = 3 là câu hỏi chọn nhiều đáp án
TemplateQuestion.prototype.render = function () {
    $("#templateQuestion").empty();
    //set các thuộc tính câu hỏi thêm thuộc tính show
    var html = ""; // đoạn html cần render ra.
    this.data[0].active = true;
    if (this.data.length) {
        // get html của từng dạng câu hỏi
        this.data.forEach((element, index) => {
            element.active = element.active || false;// set thuộc tính đối tượng có hiển thị ko
            element.T_value = ""; // set thuộc tính giá trị input của khách hàng
            element.identifyClass = 'T_question_' + index;
            switch (element.type) {
                case "value":
                    html += this.renderQuestion1(element, index);
                    break;
                case "radio":
                    html += this.renderQuestion2(element, index);
                    break;
                case "checkbox":
                    html += this.renderQuestion3(element, index);
                    break;
            }
        });

    }
    $('#templateQuestion').append(html);// render to Dom
}
// render ra câu hỏi dạng điền đúng sai 
//data:object dữ liệu câu hỏi 
//index: int vị trí của câu hỏi trong danh sách câu hỏi

TemplateQuestion.prototype.renderQuestion1 = function (data, index, showAnswer = false) {
    let title = '<div class="card"> <div class="card-header"><div class="media align-items-center"><div class="media-left"><label for="title">' 
        + '<h4 class="mb-0 number_question"><strong>' + (index + 1) + '#</strong></h4></div><div class="media-body"> <h4 class="card-title">'
        + data.title + '</h4></div></div></div> <div class="card-body">';
    let subQuestion = '';
    data.listAnswers.forEach((answer, index) => {
        let value = "";
        if (showAnswer) {
            value = answer.T_value;
        }
        subQuestion += ' <div class="form-group"><label for="title"><span class="phuong_an">'
            + answer.method + '</span>. <span class="content">' + answer.content
            + '</span></label><input type="text" class="form-control" onclick="update()" value="' + value + '"></div>';
    });
    return ('<form class="form-inline ' + data.identifyClass + ' ' + ((data.active) ? 'active' : '') + '">'
        + title + subQuestion + '</div></form></div>');
}
// render ra cậu hỏi dạng option lựa chọn duy nhất
//data:object dữ liệu câu hỏi 
//index: int vị trí của câu hỏi trong danh sách câu hỏi
TemplateQuestion.prototype.renderQuestion2 = function (data, index, showAnswer = false) {
    let title = '<div class="card"> <div class="card-header"><div class="media align-items-center"><div class="media-left"><label for="title">' 
        + '<h4 class="mb-0"><strong>' + (index + 1) + '#</strong></h4></div><div class="media-body"> <h4 class="card-title">'
        + data.title + '</h4></div></div></div> <div class="card-body">';
    let subQuestion = '';

    data.listAnswers.forEach((answer, index) => {
        let isChecked = "";
        //xem option có nên checked ko
        if (showAnswer && answer.T_value) {
            isChecked = "checked";
        }
        subQuestion += ' <div class="form-groups"><div class="checkbox"><label class="lbCheckbox"><input type="radio" name="optradio" value="'
            + answer.content + '"' + isChecked + ((showAnswer) ? ' disabled' : '') + ' >  ' + answer.content
            + '</label></div></div>';
    });
    return ('<form class="form-inline ' + data.identifyClass + ' ' + ((data.active) ? 'active' : '') + '">'
        + title + subQuestion + '</div></form></div>');
}
// render ra câu hỏi dạng chọn nhiều đáp án checkbox
//data:object dữ liệu câu hỏi 
//index: int vị trí của câu hỏi trong danh sách câu hỏi
TemplateQuestion.prototype.renderQuestion3 = function (data, index, showAnswer = false) {
    let title = '<div class="card"> <div class="card-header"><div class="media align-items-center"><div class="media-left"><label for="title">' 
        + '<h4 class="mb-0"><strong>' + (index + 1) + '#</strong></h4></div><div class="media-body"> <h4 class="card-title">'
        + data.title + '</h4></div></div></div> <div class="card-body">';
    let subQuestion = '';
    data.listAnswers.forEach((answer, index) => {
        let isChecked = "";
        //xem option có nên checked ko
        if (showAnswer && answer.T_value) {
            isChecked = "checked";
        }
        subQuestion += ' <div class="form-groups"><label><input type="checkbox" value="'
            + answer.content + '"' + isChecked + ((showAnswer) ? ' disabled' : '') + ' >  ' + answer.content
            + '</label></div>';
    });
    return ('<form class="form-inline ' + data.identifyClass + ' ' + ((data.active) ? 'active' : '') + '">'
        + title + subQuestion + '</div></form></div>');
}
// hiển thị câu hỏi trước đó
TemplateQuestion.prototype.previewQuestion = function () {
    // tìm vị trí active
    let activeQuestionIndex = this.data.findIndex(item => {
        return item.active;
    })

    if (activeQuestionIndex) {
        //xóa tất cả các class acitve và thay đổi tất cả các đối tượng có active = false
        $('#templateQuestion form').removeClass('active');
        this.data.forEach(item => {
            item.active = false;
        })
        //thêm class active cho class mới và thuộc tính acitve cho đối tượng active
        $('#templateQuestion form:nth-child(' + (activeQuestionIndex) + ')').addClass('active');
        this.data[activeQuestionIndex - 1].active = true;
    }


}
// hiển thị câu hỏi tiếp theo
TemplateQuestion.prototype.nextQuestion = function () {
    //tìm vị trí active

    let activeQuestionIndex = this.data.findIndex(item => {
        return item.active;
    })
    if (activeQuestionIndex < this.data.length - 1) {
        //xóa tất cả các class acitve và thay đổi tất cả các đối tượng có active = false
        $('#templateQuestion form').removeClass('active');
        this.data.forEach(item => {
            item.active = false;
        })

        //thêm class active cho class mới và thuộc tính acitve cho đối tượng active
        $('#templateQuestion form:nth-child(' + (activeQuestionIndex + 2) + ')').addClass('active');
        this.data[activeQuestionIndex + 1].active = true;
    }

}
// cập nhật dữ liệu của cả mẫu câu hỏi
TemplateQuestion.prototype.updateData = function () {
    this.data.forEach((item, index) => {
        switch (item.type) {
            case "value":
                {
                    item.listAnswers.forEach((answer, index1) => {
                        answer.T_value = $("." + item.identifyClass + " .form-group:nth-child(" + (index1 + 2) + ") input").val();
                    });
                    break;
                }
            case "radio":
                {
                    item.listAnswers.forEach((answer, index1) => {
                        answer.T_value = $("." + item.identifyClass + " .form-groups:nth-child(" + (index1 + 2) + ") input").is(":checked");
                    });
                    break;
                }
            case "checkbox":
                {
                    console.log(item.listAnswers);
                    item.listAnswers.forEach((answer, index1) => {
                        answer.T_value = $("." + item.identifyClass + " .form-groups:nth-child(" + (index1 + 2) + ") input").is(":checked");
                    });
                    break;
                }
        }

    });
}
// xem đáp án câu hỏi có đúng ko 
TemplateQuestion.prototype.isRightAnswer3 = function (indexAnswer) {
    let { listAnswers } = this.data[indexAnswer];
    let isWrong = listAnswers.filter(e => {
        return (e.result == e.stt) && !e.T_value;
    });
    if (isWrong.length) {
        return false;
    }
    return true;

}
// xem đáp án câu hỏi có đúng ko 
TemplateQuestion.prototype.isRightAnswer1 = function (indexAnswer) {
    let { listAnswers } = this.data[indexAnswer];

    let isWrong = listAnswers.filter(e => {
        let kqStudent = "";
        if (e.T_value == "Đ" || e.T_value == "S") {
            kqStudent = (e.T_value == "Đ") ? true : false;
        }
        let kqQuestion = (e.result == e.stt) ? true : false;
        console.log(kqQuestion, kqStudent);
        if (kqQuestion !== kqStudent) {
            return true
        }

    });
    console.log(isWrong);
    if (isWrong.length) {
        return false;
    }
    return true;

}
