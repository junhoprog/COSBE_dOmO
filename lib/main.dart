import 'dart:async';
import 'package:googlemaptest/Marker.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong2/latlong.dart' as lat;
import 'package:async/async.dart';

import 'Marker.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('GoogleMap'),
      ),
      body: MapSample(),
    ),
  ),
  );
}

double current_latitude=0;
double current_longitude=0;

CameraPosition chungbuk_university = CameraPosition(
  target: LatLng(37.551, 126.991),
  zoom: 15,
);
class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}


class MapSampleState extends State<MapSample>  {
  GoogleMapController? mapController;
  Location location = new Location();
  final lat.Distance distance = lat.Distance();
  AsyncMemoizer asyncMemoizer = AsyncMemoizer();
  int a = markerlist.length;
  final Map _start = new Map();

  Timer? _timer;

  void startTimer(int i) {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start[markerlist[i]] == 0) {
          setState(() {
            timer.cancel();
            _endTimer(i);
          });
        } else {
          setState(() {
            _start[markerlist[i]]--;
          });
        }
      },
    );
  }


  Circle circles= Circle(
      circleId: CircleId("my"),
      center: LatLng(36.6327083252033,127.48753448066267),
      radius: 500,
      onTap: (){print("a");},
    );

  void addmap(){
    for(int i=0;i<markerArray.length;i++) {
      markermap[markerlist[i]]=true;
      _start[markerlist[i]]=10;
    }
  }

  void updatecircle(LocationData newlocation){
    LatLng latlng = LatLng(newlocation.latitude!, newlocation.longitude!);
    this.setState(() {
      circles=Circle(
        circleId: CircleId("my"),
        center: latlng,
        radius: 500,
        strokeColor: Colors.blue,
        strokeWidth: 3,
        fillColor: Colors.blue.withAlpha(50),
        onTap: (){print("Hello");},
      );
    });
  }

  Future _initLocationService() async {

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;


    if (!await location.serviceEnabled()) {
      if (!await location.requestService()) {
        return;
      }
    }

    var permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    current_latitude=_locationData.latitude!;
    current_longitude=_locationData.longitude!;
    updatecircle(_locationData);
    location.onLocationChanged.listen((event) {
      updatecircle(_locationData);
    });
  }

  Future<void> _inmarker(int i) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${markerlist[i].markerId.value}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('현재 ${markerlist[i].markerId.value} 에 들어오셨습니다. 10분 후 사진과 글을 등록하실 수 있습니다.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('네'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _endTimer(int i) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${markerlist[i].markerId.value}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('지금부터 ${markerlist[i].markerId.value}에 사진과 글을 등록하실 수 있습니다.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('네'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: true,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            initialCameraPosition: chungbuk_university,
            onMapCreated:  (GoogleMapController controller) {
              setState(() {
                addmap();
                mapController = controller;
                controller.setMapStyle('[{"featureType": "poi.park","elementType": "labels.icon","stylers": [{"visibility": "off"}]},{"featureType": "poi.business","elementType": "labels.icon","stylers": [{"visibility": "off"}]},{"featureType": "poi.government","elementType": "labels.icon","stylers": [{"visibility": "off"}]},{"featureType": "poi.place_of_worship","elementType": "labels.icon","stylers": [{"visibility": "off"}]},{"featureType": "poi.school","elementType": "labels.icon","stylers": [{"visibility": "off"}]},{"featureType": "poi.attraction","elementType": "labels.icon","stylers": [{"visibility": "off"}]},{"featureType": "poi.medical","elementType": "labels.icon","stylers": [{"visibility": "off"}]},{"featureType": "landscape.natural","elementType": "labels.icon","stylers": [{"visibility": "off"}]},]');
                location.onLocationChanged.listen((l)  async{
                  await Future.delayed(const Duration(seconds: 5),(){
                    _initLocationService();
                    for(int i=0;i<markerlist.length;i++){
                      final meter = distance.as(lat.LengthUnit.Meter, lat.LatLng(current_latitude,current_longitude), lat.LatLng(markerlist[i].position.latitude,markerlist[i].position.longitude));
                      if(meter<500){
                        if(markermap[markerlist[i]]){
                          markermap[markerlist[i]]=false;
                          _inmarker(i);
                          startTimer(i);
                        }
                      }
                    };
                  });
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
                await _initLocationService();
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

    );
  }
}

