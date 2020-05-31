import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'location.dart';
import 'package:clima/services/networking.dart';
import 'dart:convert';

class LocationScreen extends StatefulWidget {
  LocationScreen(this.data);
  final data;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel model = WeatherModel();
  var temp;
  var code;
  var city;

  void updateUI(String loc) async {
    if(loc!=null){
    setState(() {
    temp = jsonDecode(loc)["main"]["temp"];
    code = jsonDecode(loc)["weather"][0]["id"];
    city = jsonDecode(loc)["name"];
    });
    }
     else{
       temp=0;
       code=null;
       city="Not found";
     }
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async{
                       Location location = Location();
                      double lat = await location.getlocationlat();
                      double long = await location.getlocationlong();
                      // Location location = Location();
                      Transferclass wdata = Transferclass();
                      String data = await wdata.getData(lat, long);
                      updateUI(data);  
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async{
                      String received =await Navigator.push(context, MaterialPageRoute(builder: (context)=>CityScreen()));
                      if(received!=null){
                        updateUI(received);
                      }
                      else return;
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${temp.toInt()}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '${model.getWeatherIcon(code)}',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${model.getMessage(temp.toInt())} in $city!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
