var target_test = {
    typeQuestion1: false,
    typeQuestion2: false,
    typeQuestion3: false,
    typeQuestion4: false,
    typeQuestion5: false,
    typeQuestion6: false
};
var listQuestion = [];
var temQuestion;
let infoTest;
var serviceQuestion = new ServiceQuestion();
var serviceCommon = new ServiceCommon();
var totalQuestion = 0;
var currentQuestion = 0;
function start_test() {
    //get list question 
    serviceQuestion.getListQuestions(137).then(tempResult => {
       
        let { error, datas } = tempResult;
        if (!error) {
            infoTest = {
                id: datas.id || 0,
                lesson: datas.lesson || "",
                quiz: datas.quiz || "Không có câu hỏi ?",
                thematic: datas.thematic || ""
            }
            let { data } = datas;
            let questions = [];
            if (serviceCommon.isArray(data)) {
                data.forEach(item => {
                    let infoQuestion = {
                        type: item.type || "radio",
                        title: item.name || "Không có câu hỏi",
                        question_id: item.question_id || 0,
                        name: item.name || "",
                        image: item.image || "",
                        level: item.level || 0,
                        listAnswers: []
                    };
                    if (serviceCommon.isArray(item.answer)) {
                        switch (item.type) {
                            case "radio":
                                {
                                    item.answer.forEach((e1,i1) => {
                                        let item1 = {
                                            method: "A",
                                            content: e1.name || "Không có đáp án",
                                            answer_id: e1.answer_id || 0,
                                            stt: e1.stt,
                                            name: e1.name || "",
                                            value: e1.value || "",
                                            result: e1.result || "",
                                            image: e1.image || ""
                                        };
                                        
                                       
                                        infoQuestion.listAnswers.push(item1);
                                    });
                                    break;
                                }
                            case "checkbox":
                                {
                                    item.answer.forEach(e1 => {
                                        let item1 = {
                                            method: "A",
                                            content: e1.name || "Không có đáp án",
                                            answer_id: e1.answer_id || 0,
                                            stt: e1.stt,
                                            name: e1.name || "",
                                            value: e1.value || "",
                                            result: e1.result || "",
                                            image: e1.image || ""
                                        };
                                        infoQuestion.listAnswers.push(item1);
                                    })

                                    break;
                                }
                            case "value":
                                {
                                    item.answer.forEach((e1,i1) => {
                                        let item1 = {
                                            method: "A",
                                            content: e1.name || "Không có đáp án",
                                            answer_id: e1.answer_id || 0,
                                            stt: e1.stt,
                                            name: e1.name || "",
                                            value: e1.value || "",
                                            result: e1.result || "",
                                            image: e1.image || ""
                                        };
                                        if(i1 == 0){
                                            item1.method = "A";
                                        }else  if(i1 == 1){
                                            item1.method = "B";
                                        }else  if(i1 == 2){
                                            item1.method = "C";
                                        }else {
                                            item1.method = "D";
                                        }
                                        infoQuestion.listAnswers.push(item1);
                                    })

                                    break;
                                }
                            default:
                                break;
                        }

                    }
                    questions.push(infoQuestion);
                })
            }
            // render template questions
            temQuestion = new TemplateQuestion(questions);
            temQuestion.render();
            totalQuestion = temQuestion.data.length;
            this.controlButton(1);
            console.log(this.temQuestion.data);
            // mở phần kiểm tra câu hỏi 
            $("#unit_test").modal('show');
        }
    })
}
function controlButton(currentQuestion) {
    currentQuestion = currentQuestion;
    $(".buttons button").removeClass("disappear");
    if (currentQuestion == 1) {
        $(".buttons .preview").addClass("disappear");
        $(".buttons .finish").addClass("disappear");
    } else if (currentQuestion == totalQuestion) {
        $(".buttons .next").addClass("disappear");
    } else {
        $(".buttons .next").addClass("disappear");
    }
}
// mở câu hỏi trước
function previewAnswer() {
    this.controlButton(currentQuestion--);
    temQuestion.previewQuestion();
}
// mở câu hỏi tiếp theo
function nextAnswer() {
    this.controlButton(currentQuestion++);
    temQuestion.nextQuestion();
    console.log(temQuestion.data);
}
// kiểm tra đáp án sau khi hoàn thiện bài test
function markTest() {
    $("#unit_test").modal('hide');
    $("body > .container").removeClass("disappear");
    $("body > #test_question").addClass("disappear");
    temQuestion.updateData();
    let data = [];
    temQuestion.data.forEach(item => {
        let { listAnswers, question_id, type, name, level, image } = item;
        let element = {
            question_id: question_id,
            type: type,
            answer: []
        };
        switch (element.type) {
            case "radio":
                {
                    let findAnswer = listAnswers.filter(e => {
                        return e.T_value;
                    });
                    if (findAnswer.length > 0) {
                        let answer = {
                            stt: findAnswer[0].stt,
                            result: findAnswer[0].result
                        }

                        element.answer.push(answer);
                    }
                    break;

                }
            case "checkbox":
                {
                    let findAnswer = listAnswers.filter(e => {
                        return e.T_value;
                    });
                    findAnswer.forEach(e => {
                        let answer = {
                            stt: findAnswer[0].stt,
                            result: findAnswer[0].result
                        };
                        element.answer.push(answer);
                    });

                    break;
                }
            case "value":
                {
                    let findAnswer = listAnswers.filter(e => {
                        return e.T_value;
                    });
                    findAnswer.forEach(e => {
                        let answer = {
                            stt: findAnswer[0].stt,
                            result: findAnswer[0].T_value
                        };
                        element.answer.push(answer);
                    });
                    break;
                }
            default:
                break;
        }
        data.push(element);
    })

    body = {
        quiz: infoTest.id,
        data: data
    }
    this.renderAnswer();
    serviceQuestion.sendTest(body).then(result => {
        console.log(result);
    });


}
//render html đáp án
function renderAnswer() {
    let html = "";
    console.log("Sdfadf");
    let numberRightAnswer = 0;
    let { data } = this.temQuestion;
    data.forEach((e, i) => {

        if (e.type == "radio") {
            html += this.temQuestion.renderQuestion2(e, i, true);
            let rightAnswer = "";
            let findAnswer = e.listAnswers.filter(e1 => {
                return e1.result == e1.stt;
            })
            if (findAnswer.length) {
                html += '<div class="textAnser"> Đáp án là:' + findAnswer[0].name + '</div>'
            };

            let isRightAnser = e.listAnswers.filter(e1 => {
                console.log(e1.result + "-- " + e1.stt + "--" + e1.T_value);
                return (e1.result == e1.stt) && e1.T_value;
            });
            if (isRightAnser.length) {
                numberRightAnswer++;
            }

        } else if (e.type == "checkbox") {
            html += this.temQuestion.renderQuestion3(e, i, true);
            let rightAnswer = "";
            let findAnswer = e.listAnswers.filter(e1 => {
                return e1.result == e1.stt;
            })
            if (findAnswer.length) {
                findAnswer.forEach(e2 => {
                    rightAnswer += e2.name + " ,";
                })
                rightAnswer = rightAnswer.substring(-1, rightAnswer.length - 1); console.log(rightAnswer);
                html += '<div class="textAnser"> Đáp án là:' + rightAnswer + '</div>';
            };
            if (this.temQuestion.isRightAnswer3(i)) {
                numberRightAnswer++;
            }
        }else {
            console.log("Sdfadf");
            html += this.temQuestion.renderQuestion1(e, i, true);
            let rightAnswer = "";
            let findAnswer = e.listAnswers.filter(e1 => {
                return e1.result == e1.stt;
            })
            if (findAnswer.length) {
                findAnswer.forEach(e2 => {
                    rightAnswer += e2.name + " ,";
                })
                rightAnswer = rightAnswer.substring(-1, rightAnswer.length - 1); console.log(rightAnswer);
                html += '<div class="textAnser"> Đáp án là:' + rightAnswer + '</div>';
            };
            if (this.temQuestion.isRightAnswer1(i)) {
                numberRightAnswer++;
            }
        }

    });
    html += "<div>Bạn trả lời được đúng " + numberRightAnswer + "/" + totalQuestion + "."
    $("#answer_question .content").append(html)
}
// object: question
// property:   typeQuestion:Number
//             id:String
//             titleQuestion: String  
//             contentHtml: String


