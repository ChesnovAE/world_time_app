import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    // Принимает Мапу данных из load_screen
    data = ModalRoute.of(context).settings.arguments;
    print(data);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Делаем кнопочку для выброа местоположения
            FlatButton.icon(
              onPressed: () {
                /**
                 * Это функция для того, чтобы
                 * Вытолкнуть какой-нибудь экран вперед
                 * pushed choosen screen on top
                 */  
                Navigator.pushNamed(context, '/location');
              },
              icon: Icon(Icons.edit_location),
              label: Text('Edit location')
            )
          ],
        )
      )
    );
  }
}