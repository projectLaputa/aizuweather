// jQuery plugin for setting the class of a particular element to "current" based on the current page.
// Useful for navigation menus that are part of a server side include for the whole site.
//
// By Rob Watts, http://magicedit.com
// Version 1.4, June 14, 2011
// Provided under the MIT license. Feel free to use it however you like.
//
// Example:
// $("ul.nav a").currentPage();
//
// To override defaults, pass in a defaults object:
// $("ul.nav a").currentPage({
//    attr: "href",
//    defaultClass: "selected",
//    indexPage: ""
// });

function getPage() {
  var href = window.location.href;
  var host = window.location.host;
  var pos = href.indexOf(host);
  var url = href.substring(pos + host.length);


  if ( url.charAt(0) == "/" )
    url = url.substring(1, url.length);

  return url;
}


jQuery.fn.currentPage = function(options) {
  var currentPage = "";
  var thisClass = "";
  var thisHref = "";
  var settings = jQuery.extend({
    defaultClass: "current",       // Default class to add to current link
	attr: "href",              // Default attribute to compare with current page URL (not usually used)
	appendToFirstClass: false, // Append the defaultClass to the first class on the element.
	                              // E.g. class="monkey" becomes class="monkey monkeycurrent"
	indexPage: "/",            // Default index page (to make current when page is not shown in URL)
	anyPath: false             // Ignore the path (supports pages in subfolders, and triggers on filename alone)
	}, options);

  currentPage = getPage();

  if ( (currentPage == "") || ( settings.anyPath && (currentPage.indexOf("/") == currentPage.length-1) ) )
    currentPage = settings.indexPage;

  this.each(function() {
      thisHref = $(this).attr(settings.attr);

      // Strip off leading slash if anyPath is true
      if (settings.anyPath && (thisHref.charAt(0)=="/"))
	thisHref = thisHref.substring(1, thisHref.length);
      
      if ( (thisHref == currentPage) || ( settings.anyPath && ( ( currentPage.indexOf(thisHref) > -1 ) && ( currentPage.indexOf(thisHref) + thisHref.length == currentPage.length ) ) ) ) {
	if (settings.appendToFirstClass) {
	  thisClass = $(this).attr("class").split(" ")[0];  // Choose the first class (if multiple classes defined)
	  thisClass = thisClass + settings.defaultClass;    // Append the default current class to the first class class
	}
	else 
	  thisClass = settings.defaultClass;

	$(this).addClass(thisClass);
      }
    });
};
