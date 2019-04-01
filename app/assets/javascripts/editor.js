$(document).ready(function(){
    var editor = new MediumEditor('.editable', {
        placeholder: {
            text: 'Enter your review'
        }
    });

    $('.editable').mediumInsert({
        editor: editor,
        addons: {
            images: {
                preview: true,
                fileUploadOptions: {
                    url: '/uploads',
                },
            },
        }
    });
});
