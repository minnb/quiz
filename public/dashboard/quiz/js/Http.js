// -----------------------------đối tượng Http dùng truy vấn hai phương thức post , get-------------------------------------------
function Http() {
    this.host = "http://localhost:8000/quiz";
    this.token = "0795879133";
}
// truy vấn phương thức post 
Http.prototype.post = function (uri, body) {
    let url = this.host + uri;// + "/" + this.token;
    return new Promise(function (resolve, reject) {
        try {
            $.ajax({
                url: url,
                type: 'POST',
                data: body,
                success: function (result) {
                    resolve({ error: 0, datas: data });
                }
            }).fail(function (error) {
                reject({ error: 1, datas: error });
            });
          
        }
        catch (error) {
            reject({ error: 1, datas: error }); // always close the resource
        }
    });
}
// truy vấn phương thức get
Http.prototype.get = function (uri) { //đúng rùi nó gọi đền đây hiểu ko chạy thử đi
    let url = this.host + uri + "/" + this.token;
    return new Promise(function (resolve, reject) {
        try {
            $.get(url, function (data) {
                resolve({ error: 0, datas: data });
            }).fail(function (error) {
                reject({ error: 1, datas: error });
            });;
        }
        catch (error) {
            reject({ error: 1, datas: error }); // always close the resource
        }
    });


}
