import 'location_screen.dart';
import 'package:flutter/material.dart';
import 'location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}



class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    currLocation();
  }
  double lat;
  double long;
  String city;
  List<int> winfo;
  void currLocation() async {
    Location location = Location();
    lat = await location.getlocationlat();
    long = await location.getlocationlong();
    print(lat);
    print(long);
    Transferclass wdata = Transferclass();
    String data=await wdata.getData(lat, long);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LocationScreen(data)));
  }

  @override
  Widget build(BuildContext context) {
    print("hello");
    return Scaffold(
        body: Center(
      child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 50,
      ),
    ));
  }
}
