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
function getPage(){var a=window.location.href,b=window.location.host,c=a.indexOf(b),d=a.substring(c+b.length);return d.charAt(0)=="/"&&(d=d.substring(1,d.length)),d}jQuery.fn.currentPage=function(a){var b="",c="",d="",e=jQuery.extend({defaultClass:"current",attr:"href",appendToFirstClass:!1,indexPage:"/",anyPath:!1},a);b=getPage();if(b==""||e.anyPath&&b.indexOf("/")==b.length-1)b=e.indexPage;this.each(function(){d=$(this).attr(e.attr),e.anyPath&&d.charAt(0)=="/"&&(d=d.substring(1,d.length));if(d==b||e.anyPath&&b.indexOf(d)>-1&&b.indexOf(d)+d.length==b.length)e.appendToFirstClass?(c=$(this).attr("class").split(" ")[0],c+=e.defaultClass):c=e.defaultClass,$(this).addClass(c)})}