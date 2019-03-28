$(".login-modal").click(function(){
    $('#form-login-modal').html('<%= j render "devise/sessions/form_modal" %>');
    $('#form-login-modal').modal('show');
});
