function ckeditor (name) {
    var editor = CKEDITOR.replace(name ,{
        uiColor : '#d4d4d4',
        language:'vi',
        filebrowserImageBrowseUrl : baseURL+'/public/assets/plugins/ckfinder/ckfinder.html?Type=Images',
        filebrowserFlashBrowseUrl : baseURL+'/public/assets/plugins/ckfinder/ckfinder.html?Type=Flash',
        filebrowserImageUploadUrl : baseURL+'/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images',
        filebrowserFlashUploadUrl : baseURL+'/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash',
        toolbar:[
        ['Source','-','Save','NewPage','Preview','-','Templates'],
        ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print'],
        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
        ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'HiddenField'],
        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','CreateDiv'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Link','Unlink','Anchor'],
        ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
        ['Styles','Format','Font','FontSize'],
        ['TextColor','BGColor'],
        ['Maximize', 'ShowBlocks','-','About']
        ]
        });
}