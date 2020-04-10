function static_page_replace() {
    $('#static_page_slug').val(generate($('#static_page_title').val()));
}

function reg_replace() {
    $('#user_company_slug').val(generate($('#user_company_name').val()));
}

function generate(text) {
    return text.split(' ').join('-').toLowerCase()
}
