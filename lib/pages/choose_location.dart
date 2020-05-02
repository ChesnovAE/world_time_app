import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  @override
  Widget build(BuildContext context) {

    List<WorldTime> locations = [
      WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
      WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
      WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
      WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
      WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
      WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
      WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
      WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
      WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'russia.jpg')
    ];

    void updateTime(index) async {
      WorldTime wt_instance = locations[index];
      await wt_instance.getTime();
      // Navigate to home screen
      /**
       * При переходе на экран выбора локации он кладется сверху, а home лежит внизу
       * Поэтому нам надо всего лишь сделать pop, чтобы убрать этот экран и
       * пробросить данные в home
       * Это же делает стрелочка в AppBar
       */
      Navigator.pop(context, {
        'time': wt_instance.time,
        'location': wt_instance.location,
        'flag': wt_instance.flag,
        'isDayTime': wt_instance.isDayTime,
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      /**
       * AppBar может многое, например,
       * задает нормальные границы, чтобы ничего никуда не вылезло
       * автоматически может вернуть на предыдущий экран (OMG!)
       * и даже обрабатывает свайп для возвращения на предыдущий экран
       */
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
