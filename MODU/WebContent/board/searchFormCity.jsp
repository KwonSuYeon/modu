<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--https://maps.googleapis.com/maps/api/js?key=AIzaSyDT7sSTMO5sgyqu_1l0KuaIK_QAyv0U44c&libraries=places&language=ko&callback=initMap --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../resource/css/style-login-join.css" />
<link rel="stylesheet" href="../resource/css/style-search.css" />
<script type="text/javascript">
function send(){
    
    var name = document.getElementById('name').value;
   // alert(name);
    
    var countryCode = document.getElementById('countryCode').value;
    //alert(countryCode);
    	        
    opener.document.getElementById('city').value = name;
    opener.document.getElementById('countryCode').value = countryCode;

  	self.close();       //蟹紳陥 ばばばばばばばばばばばば 嬢錠 ばばばばばばばばば 姶維 ばばばばばばばばばば
} 
</script>
</head>
<body>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDT7sSTMO5sgyqu_1l0KuaIK_QAyv0U44c&libraries=places"></script>
<input type="hidden" id="lat">
<input type="hidden" id="lng">
<input type="hidden" id="name">
<input type="hidden" id="countryCode">
<div class="search">
<label for="locationTextField">亀獣:</label>
<input id="locationTextField" size="50" type="text" /><input type="button" value="伊事" id="searchbt" onclick="send()">
</div>
<script>
   function init() {
      var input = document.getElementById('locationTextField');
      var options = {
    		  types: ['(cities)']
    		 // ,componentRestrictions: {country: "us"}
    		 };
      var autocomplete = new google.maps.places.Autocomplete(input,options);
      autocomplete.setFields(
              ['address_components','url','geometry', 'formatted_address','icon', 'name']);
      autocomplete.addListener('place_changed', function() {
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            // User entered the name of a Place that was not suggested and
            // pressed the Enter key, or the Place Details request failed.
            window.alert("No details available for input: '" + place.name + "'");
            return;
          }
          
          document.getElementById("lng").value=place.geometry.location.lng();
          document.getElementById("lat").value=place.geometry.location.lat();
          document.getElementById("name").value=place.name;
          
		  console.log(place);
      
          //厩亜坪球 亜閃神奄
		for (var i = 0; i < place.address_components.length; i += 1) {
        	var addressObj = place.address_components[i];
       			for (var j = 0; j < addressObj.types.length; j += 1) {
       				if (addressObj.types[j] === 'country') { /*outputs result if it is country*/
           		document.getElementById('countryCode').value = addressObj.short_name;
         		}
       		}
     	}
          var address = '';
          if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
            console.log(address);
          }

        });
   }
google.maps.event.addDomListener(window, 'load', init);
</script>
</body>
</html>