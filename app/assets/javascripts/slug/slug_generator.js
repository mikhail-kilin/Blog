function static_page_replace() {
    replace('static_page_slug', 'static_page_title');
}

function reg_replace() {
    replace('user_company_slug', 'user_company_name');
}

function company_replace() {
    replace('company_slug', 'company_name');
}

function replace(slug, name) {
    $('#' + slug).val(generate($('#' + name).val()));
}

function generate(text) {
    return text.split(' ').join('-').toLowerCase()
}
