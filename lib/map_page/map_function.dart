import 'dart:async';
import 'package:cosbe_domo/bottom_bar/bottom_bar.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong2/latlong.dart' as lat;
import 'package:async/async.dart';
import 'Marker.dart';
import 'map_page.dart';

double current_latitude=0;
double current_longitude=0;
Location location = new Location();
GoogleMapController? mapController;
final lat.Distance distance = lat.Distance();
AsyncMemoizer asyncMemoizer = AsyncMemoizer();
int a = markerlist.length;
Map<String,int> start= new Map();
Timer? _timer;

void startTimer(int i) {
  int count=10;
  const oneSec = const Duration(seconds: 1);
  _timer = new Timer.periodic(
    oneSec,
        (Timer timer) {
      if (count== 0) {
        timer.cancel();
        endTimer(i);
      }
      else {
        count--;
      }
    },
  );
}


Circle circles= Circle(
  circleId: CircleId("my"),
  center: LatLng(36.6327083252033,127.48753448066267),
  radius: 500,
);

void addmap(){
  for(int i=0;i<markerArray.length;i++) {
    start[markerlist[i].markerId.value]=10;
  }
}


Future initLocationService(Location location) async {
  location.changeSettings(interval: 10000,distanceFilter: 5);
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
}

Future<void> inmarker(int i) async {
  return print('현재 ${markerlist[i].markerId.value} 에 들어오셨습니다. 10분 후 사진과 글을 등록하실 수 있습니다.');
}

Future<void> marker_search()async {
  for(int i=0;i<markerlist.length;i++){
    final meter = distance.as(lat.LengthUnit.Meter, lat.LatLng(current_latitude,current_longitude), lat.LatLng(markerlist[i].position.latitude,markerlist[i].position.longitude));
    if(meter<500){
      if(markermap[markerlist[i].markerId.value]==true){
        markermap[markerlist[i].markerId.value]=false;
        inmarker(i);
        startTimer(i);
      }
    }
  };
}



Future<void> endTimer(int i) async {
  return print('지금부터 ${markerlist[i].markerId.value}에 사진과 글을 등록하실 수 있습니다.');
}