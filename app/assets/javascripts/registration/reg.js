function open_author() {
    $("#user_own_company_attributes_name").attr('disabled', 'disabled');
    $("#user_own_company_attributes_slug").attr('disabled', 'disabled');
    $("#company_form").attr('hidden', 'true');
    $("#user_companies").removeAttr('disabled');
    $("#author_form").removeAttr('hidden')
}

function open_owner() {
    $("#user_companies").attr('disabled', 'disabled');
    $("#author_form").attr('hidden', 'true')
    $("#user_own_company_attributes_name").removeAttr('disabled');
    $("#user_own_company_attributes_slug").removeAttr('disabled');
    $("#company_form").removeAttr('hidden');
}
