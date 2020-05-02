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
    print(wt_instance.time);
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
      body: Text('Loading screen')
    );
  }
}