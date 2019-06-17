// ------------------------service câu hỏi----------------------------------------------- 
function ServiceQuestion() {
    this.http = new Http();
}
// lấy danh sách các câu hỏi 
//id : int Mã nhận dạng cho loại câu hỏi 
ServiceQuestion.prototype.getListQuestions = async function (id) {
    let uri = '/api/v1/quiz-take/' + id;
    let result = await this.http.get(uri);
    return result;
}

ServiceQuestion.prototype.getQuizId = async function (type, course, thematic, lesson, strToken) {
    let uri = '/api/v1/quiz/' + type +'/' + course + '/' + thematic + '/' + lesson + '/' + strToken;
    let result = await this.http.get(uri);
    return result;
}
//edit các câu hỏi
ServiceQuestion.prototype.sendTest = async function (body) {
    console.log(body.data)
    let uri = '/api/v1/quiz-take';
    let result = await this.http.post(uri, JSON.stringify(body));
    console.log(result);
    return result;
}