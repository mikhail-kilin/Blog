function static_page_replace() {
    replace('static_page_slug', 'static_page_title');
}

function reg_replace() {
    replace('user_own_company_attributes_slug', 'user_own_company_attributes_name');
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
