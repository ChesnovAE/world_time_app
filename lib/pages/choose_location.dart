import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Тут нам не надо использовать виджет SafeArea, потому что он
      // уже был использован ранее и теперь перенесется сюда
      // если я правильно все понял, конечно же...
      body: Text('Choose location screen'),
    );
  }
}