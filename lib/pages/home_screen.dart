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
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    // Set Back Ground image
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpeg';
    // Set BG Color
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          // READ DOCS!
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/${bgImage}'),
              fit: BoxFit.cover
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                // Делаем кнопочку для выброа местоположения
                FlatButton.icon(
                  onPressed: () async {
                    /**
                     * Это функция для того, чтобы
                     * Вытолкнуть какой-нибудь экран вперед
                     * pushed choosen screen on top
                     * А еще тут мы запуускаем большую асинхронную таску по выбору локации
                     * Мы ждем, когда выберем локацию и если выбрали что-то, то в results
                     * запишется результат
                     * Если нет, то запишется NULL
                     */  
                    dynamic results = await Navigator.pushNamed(context, '/location');
                    print(!(results is Null));
                    setState(() {
                      data = !(results is Null) ? results : data;
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit location',
                    style: TextStyle(
                      color: Colors.grey[300]
                    ),
                  )
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    Text(
                      '${data['location']}',
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white
                      ),
                    )
                  ]
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white
                  )
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}