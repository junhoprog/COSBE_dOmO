import 'dart:async';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong2/latlong.dart' as lat;
import 'package:async/async.dart';
import '../csv_list.dart';
import 'Marker.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

double current_latitude=0;
double current_longitude=0;
Location location = new Location();
GoogleMapController? mapController;
final lat.Distance distance = lat.Distance();
AsyncMemoizer asyncMemoizer = AsyncMemoizer();
int a = markerlist.length;
Map<String,int> start= new Map();


Circle circles= Circle(
  circleId: CircleId("my"),
  center: LatLng(36.6327083252033,127.48753448066267),
  radius: 500,
);

Future initLocationService(Location location) async {
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
  if(markerlist[i].position.latitude!=0.0) {
    return inNotification(markerlist[i].markerId.value);
  }
}

Future<void> marker_search()async {
  for(int i=0;i<markerlist.length;i++){
    final meter = distance.as(lat.LengthUnit.Meter, lat.LatLng(current_latitude,current_longitude), lat.LatLng(markerlist[i].position.latitude,markerlist[i].position.longitude));
    if(meter<500){
      if(marker_map[marker_array.elementAt(i).markerId.value.toString()]==false){
        marker_map[marker_array.elementAt(i).markerId.value.toString()]=true;
        inmarker(i);
      }
    }
  };
}

final notifications = FlutterLocalNotificationsPlugin();

//1. 앱로드시 실행할 기본설정
Future initNotification() async {
  //안드로이드용 아이콘파일 이름
  var androidSetting = AndroidInitializationSettings('@drawable/domo_icon');

  var initializationSettings = InitializationSettings(
    android: androidSetting,
  );
  await notifications.initialize(
    initializationSettings,
    //알림 누를때 함수실행하고 싶으면
    //onSelectNotification: 함수명추가
  );
}

int in_groupcounter=1;
int res_groupcounter=10000;

Future inNotification(dynamic spot) async {
  String groupKey = "in_key";

  var androidDetails = AndroidNotificationDetails(
    'dOmO',
    'notification',
    priority: Priority.high,
    importance: Importance.max,
    color: Colors.black,
      icon: "@drawable/domo_icon",
    groupKey: groupKey,
  );
  var groupDetails = AndroidNotificationDetails(
      'domo',
      'notification',
    priority: Priority.high,
    importance: Importance.max,
    color: Colors.black,
    icon: "@drawable/domo_icon",
    groupKey: groupKey,
    setAsGroupSummary: true,
  );
  // 알림 id, 제목, 내용 맘대로 채우기
  notifications.show(
      in_groupcounter,
      '${spot}에 입장하셨습니다.',
      '${spot}에 사진과 글을 등록하실 수 있습니다.',
      NotificationDetails(android: androidDetails), // 부가정보
  );
  in_groupcounter++;
  notifications.show(-1, "", "", NotificationDetails(android: groupDetails));
}

Future add_marker()async{
  for(int i=0;i<csv_List.length;i++){
    for(int j=0;j<csv_List[i].length;j++){
      final _rawData = await rootBundle.loadString(csv_List[i][j]);
      List<List<dynamic>> _listData =
      const CsvToListConverter().convert(_rawData,eol: "\n",allowInvalid: true);
      for(int k=1;k<_listData.length;k++){
        marker_array.add(Marker(markerId: MarkerId("${_listData[k][1]}"),position: LatLng((_listData[k][4] as num).toDouble(),(_listData[k][5] as num).toDouble(),),infoWindow: InfoWindow(title: "${_listData[k][1]}")));
      }
    }
  }
}

Future add_marker_map()async{
  for(int i=0;i<marker_array.length;i++){
    marker_map[marker_array.elementAt(i).markerId.value.toString()]=false;
  }
}

Map<String,int> csv_level={};

Future add_level()async{
  final _rawData = await rootBundle.loadString("assets/csv_assets/level.csv");
  List<List<dynamic>> _listData =
  const CsvToListConverter().convert(_rawData,eol: "\n",allowInvalid: true);
  for(int i=1;i<_listData.length;i++){
    if(i<=30){
      csv_level[_listData[i][1]]=4;
    }
    else if(i<=60){
      csv_level[_listData[i][1]]=3;
    }
    else if(i<=100){
      csv_level[_listData[i][1]]=2;
    }
    else {
      csv_level[_listData[i][1]] =1;
    }
  }
}