import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime wt_instance = WorldTime(
      location: 'Moscow',
      flag: '',
      url: 'Europe/Moscow'
    );
    await wt_instance.getTime();
    // Убирает текущий экран со стека и кладет туда '/home'
    // А еще пробрасываем необходимые данные в другой экран
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': wt_instance.time,
      'location': wt_instance.location,
      'flag': wt_instance.flag
    });
  }

  @override
  void initState() {
    super.initState();
    // Данная функция не блокируется
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Loading'))
    );
  }
}