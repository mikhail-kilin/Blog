if (document.getElementsByClassName("ckeditor").length > 0) {
	CKEDITOR.editorConfig = function(config) {
		config.filebrowserBrowseUrl = "/ckeditor/attachment_files";
		config.filebrowserFlashBrowseUrl = "/ckeditor/attachment_files";
		config.filebrowserFlashUploadUrl = "/ckeditor/attachment_files";
		config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";
		config.filebrowserImageBrowseUrl = "/ckeditor/pictures";
		config.filebrowserImageUploadUrl = "/ckeditor/pictures";
		config.filebrowserUploadUrl = "/ckeditor/attachment_files";
		config.toolbarGroups = [
			{ name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
			{ name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
			{ name: 'links' },
			{ name: 'insert' },
			{ name: 'tools' },
			{ name: 'document',	   groups: [ 'mode', 'document', 'doctools' ] },
			{ name: 'others' },
			'/',
			{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
			{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks' ] },
			{ name: 'about' }
		];
		return true;
	};
}