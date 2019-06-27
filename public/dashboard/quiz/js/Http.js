// -----------------------------đối tượng Http dùng truy vấn hai phương thức post , get-------------------------------------------
function Http() {
    //this.host = "http://localhost:8000/quiz";
    this.host = "https://hochieuqua.vn";
    this.token = "0795879133";
}
// truy vấn phương thức post 
Http.prototype.post = function (uri, body) {
    let url = this.host + uri;// + "/" + this.token;
    $.ajaxSetup({
           headers: {'X-CSRF-Token': $('meta[name=csrf_token]').attr('content')}
        });
    $.ajax({
        url: url,
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify( body ), 
        success: function(){
           swal({
              title: "Good job!",
              text: "You clicked the button!",
              icon: "success",
              button: "Aww yiss!",
            });
           location.reload();
        },
        error: function(){
            alert('error');
        }
    });

    /*
    return new Promise(function (resolve, reject) {
        try {
            $.ajax({
                contentType: 'application/json; charset=utf-8',
                url: url,
                type: 'POST',
                data: body,
                dataType: 'json',
                success: function (data) {
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
   */
}
// truy vấn phương thức get
Http.prototype.get = function (uri) { 
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
