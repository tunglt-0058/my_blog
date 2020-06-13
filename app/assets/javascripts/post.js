//= require select2/dist/js/select2.min
//= require propellerkit/components/select2/js/pmd-select2
function show_memo_form() {
    $("#memo-form").attr("class", "collapse.in");
    $("#create-memo-but").attr("class", "collapse")
}
function cancel_create_memo() {
    $("#memo-form").attr("class", "collapse");
    $("#create-memo-but").attr("class", "btn pmd-btn-flat pmd-ripple-effect btn-primary");
}
function cancel_update_memo() {
    $("#memo-form").attr("class", "collapse");
    $("#memo-show").attr("class", "collapse.in");
}
