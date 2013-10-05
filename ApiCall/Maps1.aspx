<%@ Page Language="C#" MasterPageFile="~/SiteHTML5.master"  AutoEventWireup="true" CodeBehind="Maps1.aspx.cs" Inherits="ApiCall.Maps1" %>
<%--<!DOCTYPE html>
<html>
  <head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body, #map-canvas {
        margin: 0;
        padding: 0;
        height: 100%;
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false" type="text/javascript"></script>
    <script type="text/javascript">
        var map;
        function initialize() {
            var mapOptions = {
                zoom: 8,
                center: new google.maps.LatLng(-34.397, 150.644),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
        }

        google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>
  <body>
    <div id="map-canvas"></div>
  </body>
</html>--%>

<asp:Content ID="headContent" runat="server" ContentPlaceHolderID="head">
   
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body, #map-canvas {
        margin: 0;
        padding: 0;
        height: 100%;
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true" type="text/javascript"></script>
    <script type="text/javascript">

        var directionsDisplay;
        var directionsService = new google.maps.DirectionsService();
        var map;


        function initialize() {
            directionsDisplay = new google.maps.DirectionsRenderer();
            var mapOptions = {
                zoom: 7,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                center: new google.maps.LatLng(39.1, -94.58)
            }
            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
            directionsDisplay.setMap(map);
            //var control = document.getElementById('control');
            //control.style.display = 'block';
            //map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);
        }

        function calcRoute() {
            var selectedMode = 'DRIVING';
            var a = document.getElementById('start').value;
            var b = document.getElementById('end').value;
            var request = {
                origin: a,
                destination: b,

                travelMode: google.maps.TravelMode[selectedMode]
            };
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                }
            });
        }
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>

</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
         <label> Please Enter the Source and Destination</label>
         <br/>
      <label>
          Source
          <input id="start" type="text" class="" />
      </label>
      <label>
          Destination
          <input id="end" type="text" class="" />
      </label>
      <input type="button" class="" id="viewMap"  style="background-color:Transparent;padding-left:20px;margin:0px; height:25px; color:#0000CD;font-weight:bold; font-size:10pt;cursor:pointer;" value="View Map" onclick="calcRoute()"/>
       
    <div id="map-canvas" align="center" style="width: 900px; height: 600px;"></div>


</asp:Content>




