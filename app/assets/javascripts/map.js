function map_canvas(lat,lng,type) {
	document.write('<div id="map_canvas" style="width:500px; height:300px"></div>');
  var latlng = new google.maps.LatLng(lat, lng);
  var opts = {
    zoom: 14,
    center: latlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("map_canvas"), opts);
	var infowindow = new google.maps.InfoWindow({
    content: document.write(type),
    position: latlng
  });
  infowindow.open(map);
}
