_satellite._cleanTrimText = function(node) {
	var txt = this.text(node);
	txt = this.cleanText(txt);
	return this.trim(txt);
}

