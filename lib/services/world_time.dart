import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  
  String location;
  String time;
  String flag; // URL for image
  String url; // Country/City
  bool isDayTime; // true or false if day time or not

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

      isDayTime = (now.hour > 6) && (now.hour < 20) ? true : false;
      // Set the time property
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('Caught error: $e');
      time = 'could not get timedata';
    }
  }

}