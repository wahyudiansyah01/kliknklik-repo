function jl_navigation_interaction_click (node) {
	var ni = _satellite._cleanTrimText(node);
	// Top navigation: dept link
	if (_satellite.matchesCss("nav#nn-nav-menu a.dept-link",node)) {
		ni = "TopNav|" + ni;
	}
	// Top navigation: deep link
	else if (_satellite.matchesCss("nav#nn-nav-menu a",node)) {
		while (node != document.body) {
			if (_satellite.matchesCss("div.nn-flyout-col",node) && node.hasChildNodes()) {
				for (var i = 0; i < node.childNodes.length; i++) {
					if (_satellite.matchesCss("strong.nn-submenu-title",node.childNodes[i])) {
						ni = _satellite._cleanTrimText(node.childNodes[i]) + "|" + ni;
						break;
					}
				}
			}
			else if (_satellite.matchesCss("li.nn-menu",node) && node.hasChildNodes()) {
				for (var i = 0; i < node.childNodes.length; i++) {
					if (_satellite.matchesCss("a.dept-link",node.childNodes[i])) {
						ni = _satellite._cleanTrimText(node.childNodes[i]) + "|" + ni;
						break;
					}
				}		
			}
			node = node.parentNode;
		}
		ni = "TopNav|" + ni;
	}
	// Left navigation
	else if (_satellite.matchesCss("div.lt-nav a",node)) {
		while (node != document.body) {
			if (_satellite.matchesCss("section.lt-nav-container",node) && node.hasChildNodes()) {
				for (var i = 0; i < node.childNodes.length; i++) {
					if (_satellite.matchesCss("header",node.childNodes[i])) {
						ni = _satellite._cleanTrimText(node.childNodes[i]) + "|" + ni;
						break;
					}
				}
			}
			node = node.parentNode;
		}
		_satellite.cssQuery("nav#nn-nav-menu .current-section .dept-link", function (e) {
      if (e) {
        ni = _satellite._cleanTrimText(e[0]) + "|" + ni;
      }
    });
		ni = "LeftNav|" + ni;
	}
	// Bottom navigation
	else if (_satellite.matchesCss("section.footer-links a",node)) {
		while (node != document.body) {
			if (_satellite.matchesCss("div.cq-seo-list",node) && node.hasChildNodes()) {
				for (var i = 0; i < node.childNodes.length; i++) {
					if (_satellite.matchesCss("h3",node.childNodes[i])) {
						ni = _satellite._cleanTrimText(node.childNodes[i]) + "|" + ni;
						break;
					}
				}
			}
			node = node.parentNode;
		}
		ni = "BottomNav|" + ni;
	}

	return ni;
}
