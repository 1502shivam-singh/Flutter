import 'package:http/http.dart' as http;

class Transferclass {
  Future<String> getData(double lat, double long) async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=&units=metric');  //App id removed here
    if (response.statusCode == 200) {
      String data = response.body;
      return data;
    } else {
      print(response.statusCode);
      return null;
    }
  }

  Future<String> getCityData(String city) async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=&units=metric');   //App id removed here
    if (response.statusCode == 200) {
      String data = response.body;
      return data;
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
