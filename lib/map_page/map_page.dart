import 'dart:async';
import 'package:cosbe_domo/bottom_bar/bottom_bar.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong2/latlong.dart' as lat;
import 'package:async/async.dart';
import 'Marker.dart';
import 'package:cosbe_domo/map_page/map_function.dart';

class map_page extends StatefulWidget {
  @override
  State<map_page> createState() => map_pageState();
}


class map_pageState extends State<map_page>  {

  void updatecircle(Location location){
    setState((){
      LatLng latlng = LatLng(current_latitude, current_longitude);
      circles=Circle(
        circleId: CircleId("my"),
        center: latlng,
        radius: 500,
        strokeColor: Colors.blue,
        strokeWidth: 3,
        fillColor: Colors.blue.withAlpha(50),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("dOmO",style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold),),
        actions: [
          Icon(Icons.account_circle,size: 50,color: Colors.blue,)
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            GoogleMap(
              mapToolbarEnabled: false,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: true,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              initialCameraPosition: CameraPosition(
                  target: LatLng(current_latitude,current_longitude),
                  zoom: 15
              ),
              onMapCreated:  (GoogleMapController controller) {
                setState(() {
                  addmap();
                  mapController = controller;
                  controller.setMapStyle('[{"featureType": "poi.park","elementType": "labels.icon","stylers": [{"visibility": "off"}]},{"featureType": "poi.business","elementType": "labels.icon","stylers": [{"visibility": "off"}]},{"featureType": "poi.government","elementType": "labels.icon","stylers": [{"visibility": "off"}]},{"featureType": "poi.place_of_worship","elementType": "labels.icon","stylers": [{"visibility": "off"}]},{"featureType": "poi.school","elementType": "labels.icon","stylers": [{"visibility": "off"}]},{"featureType": "poi.attraction","elementType": "labels.icon","stylers": [{"visibility": "off"}]},{"featureType": "poi.medical","elementType": "labels.icon","stylers": [{"visibility": "off"}]},{"featureType": "landscape.natural","elementType": "labels.icon","stylers": [{"visibility": "off"}]},]');
                  location.onLocationChanged.listen((l) async{
                      updatecircle(location);
                    }
                  );
                });
              },
              markers: markerArray,
              circles:Set.of((circles!=null)?[circles]:[]),
           ),
             Align(
               alignment: Alignment.bottomLeft,
               child: MaterialButton(
                onPressed: () async {
                  await initLocationService(location);
                  mapController?.animateCamera(
                      CameraUpdate.newCameraPosition(
                          CameraPosition(
                              target: LatLng(current_latitude,current_longitude),
                              zoom: 15
                          )
                      ),
                  );
                },
                 child: Container(
                   width: 80,
                   height: 30,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(5)
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Icon(Icons.location_on_outlined),
                       Text("내 위치"),
                     ],
                   )
                 ),
            ),
             ), //내 위치 버튼
          ]
        ),
      ),
      bottomNavigationBar: bottom_bar(),
    );
  }
}

