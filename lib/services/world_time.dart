
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  
  String location;
  String time;
  String flag; // URL for image
  String url; // Country/City

  WorldTime ({
    this.location,
    this.flag,
    this.url
  });

  // async -- в данной функции есть асинхронный код
  // Future используем для того, чтобы при вызове могли использовать await
  Future<void> getTime() async {
    try {
      // Make a request
      Response response = await get('http://worldtimeapi.org/api/timezone/${url}');
      Map data = jsonDecode(response.body);

      // Get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // Create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // Set the time property
      time = now.toString();
    }
    catch (e) {
      print('Caught error: $e');
      time = 'could not get timedata';
    }
  }

}