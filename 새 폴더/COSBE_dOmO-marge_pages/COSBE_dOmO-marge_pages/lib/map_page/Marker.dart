import 'package:google_maps_flutter/google_maps_flutter.dart';

Set<Marker> markerArray={
  Marker(markerId: MarkerId("수암골"),position: LatLng(36.647285284464225,127.49434448449536),infoWindow: InfoWindow(title: "수암골"),),
  Marker(markerId: MarkerId("국립청주박물관"),position: LatLng(36.649679580130616,127.51204891019077),infoWindow: InfoWindow(title: "국립청주박물관")),
  Marker(markerId: MarkerId("상당산성"),position: LatLng(36.66149149835429,127.54000564227401),infoWindow: InfoWindow(title: "상당산성")),
  Marker(markerId: MarkerId("청주동물원"),position: LatLng(36.65221783395567,127.52308996996759),infoWindow: InfoWindow(title: "청주동물원")),
  Marker(markerId: MarkerId("용화사"),position: LatLng(36.64149703807482,127.48188419973866),infoWindow: InfoWindow(title: "용화사")),
  Marker(markerId: MarkerId("청주랜드"),position: LatLng(36.65178405550622,127.51821939310098),infoWindow: InfoWindow(title: "청주랜드")),
  Marker(markerId: MarkerId("청주가로수길"),position: LatLng(36.62432685690083,127.40938084895537),infoWindow: InfoWindow(title: "청주가로수길")),
  Marker(markerId: MarkerId("성안길"),position: LatLng(36.635856190279924,127.48901905931098),infoWindow: InfoWindow(title: "성안길")),
  Marker(markerId: MarkerId("청주고인쇄박물관"),position: LatLng(36.64402583483257,127.4714667204914 ),infoWindow: InfoWindow(title: "청주고인쇄박물관")),
  Marker(markerId: MarkerId("청주중앙공원"),position: LatLng( 36.6327083252033,127.48753448066267),infoWindow: InfoWindow(title: "청주중앙공원")),
  Marker(markerId: MarkerId("청남대"),position: LatLng(36.46284154647341,127.49177091297958),infoWindow: InfoWindow(title: "청남대")),
  Marker(markerId: MarkerId("정북동 토성"),position: LatLng(36.68914412133723,127.4561081889201),infoWindow: InfoWindow(title: "정북동 토성")),
  Marker(markerId: MarkerId("명암유원지"),position: LatLng(36.652065856423874,127.51920823396),infoWindow: InfoWindow(title: "명암유원지")),
  Marker(markerId: MarkerId("삼일공원"),position: LatLng(36.64197298145426,127.49546788975228),infoWindow: InfoWindow(title: "삼일공원")),
};

List<Marker> markerlist = markerArray.toList();

Map<String,bool> markermap = {
  "수암골":true,
  "국립청주박물관":true,
  "상당산성":true,
  "청주동물원":true,
  "용화사":true,
  "청주랜드":true,
  "청주가로수길":true,
  "성안길":true,
  "청주고인쇄박물관":true,
  "청주중앙공원":true,
  "청남대":true,
  "정북동 토성":true,
  "명암유원지":true,
  "삼일공원":true,
};
