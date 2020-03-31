function static_page_replace() {
    $('#static_page_slug').val(generate($('#static_page_title').val()));
}

function generate(text) {
    return text.split(' ').join('-').toLowerCase()
}
