import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  @override
  Widget build(BuildContext context) {
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
      body: Text('Choose location screen'),
    );
  }
}