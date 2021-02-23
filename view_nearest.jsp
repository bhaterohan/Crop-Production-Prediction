<%-- 
    Document   : showbins
    Created on : 24 Jan, 2018, 4:58:56 PM
    Author     : shri
--%>
<%@page import="java.util.Arrays"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DBConnection"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            HttpSession httpSession = request.getSession(false);
            try {
                if (httpSession.getAttribute("username") == null) {
                    response.sendRedirect("login.html?message='expired'");
                }
            } catch (Exception e) {
                response.sendRedirect("login.html?message='expired'");
            }
            JSONArray jsonArray = new JSONArray();
            jsonArray = (JSONArray) httpSession.getAttribute("array1");

        %>
        <meta charset="utf-8">
        <title>Marker animations with <code>setTimeout()</code></title>
        <style>
            /* Always set the map height explicitly to define the size of the div
             * element that contains the map. */
            #map {
                height: 100%;
            }
            /* Optional: Makes the sample page fill the window. */
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
            #floating-panel {
                position: absolute;
                top: 10px;
                left: 25%;
                z-index: 5;
                background-color: #fff;
                padding: 5px;
                border: 1px solid #999;
                text-align: center;
                font-family: 'Roboto','sans-serif';
                line-height: 30px;
                padding-left: 10px;
            }
            #floating-panel {
                margin-left: -52px;
            }
        </style>
    </head>
    <body>
        <div id="floating-panel">
            <button id="drop" onclick="drop()">Drop Markers</button>
        </div>
        <div id="map"></div>
        <script>
            // If you're adding a number of markers, you may want to drop them on the map
            // consecutively rather than all at once. This example shows how to use
            // window.setTimeout() to space your markers' animation.
            function initMap() {
                var latlng = new google.maps.LatLng(18.5592685, 73.9298358);
                var myOptions = {
                    zoom: 14,
                    center: latlng,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    mapTypeControl: false
                };
                var map = new google.maps.Map(document.getElementById("map"), myOptions);
                var infowindow = new google.maps.InfoWindow(), marker, lat, lng;
                 var json = <%=jsonArray%>;

                for (var o in json) {

                    lat = json[ o ].lat;
                    lng = json[ o ].lng;
                    name = json[ o ].name;
                    color = json[o].color;
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(lat, lng),
                        icon: {
                            path: google.maps.SymbolPath.BACKWARD_CLOSED_ARROW,
                            strokeColor: color,
                            scale: 5
                        },
                        name: name,
                        map: map
                    });
                    google.maps.event.addListener(marker, 'click', function (e) {
                        infowindow.setContent(this.name);
                        infowindow.open(map, this);
                    }.bind(marker));
                }
            }
        </script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC1xMDhYV9Ar5_oX5tdPJm2QcYfGhicN34&callback=initMap">
        </script>
    </body>
</html>
