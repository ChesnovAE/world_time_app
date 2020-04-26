import 'package:flutter/material.dart';
import 'package:worldtime/pages/home_screen.dart';
import 'package:worldtime/pages/choose_location.dart';
import 'package:worldtime/pages/loading_screen.dart';

void main() => runApp(MaterialApp(
    /**
     * С помощью этого мы можем задать, что из routes
     * будет загружаться первым, когда мы открываем приложение
     */
    initialRoute: '/home',
    // Штука для передвижения по экранам
    routes: {
      // Немного про context
      /**
       * context-это экземпляр BuildContext, 
       * который передается построителю виджета, 
       * чтобы он знал, где находится внутри дерева виджетов вашего приложения.
       * Одним из распространенных применений является
       * передача его в метод при использовании унаследованного виджета.
       * Вызов Something.of(context), например,
       * возвращает что-то относительно ближайшего виджета в дереве,
       * который может предоставить вам это что-то.
       */
      /**
       * Это срабатывает при запуске приложения
       * То есть задает базовый экран для приложения
       * При этом может выдвать ошибку, если задан параметр home для MAterialApp
       * Если приложение много экранное, то надо задавать routes
       * Если только один экран, то можно просто задать home
       */ 
      '/': (context) => Loading(), // возвращает виджет Loading()
      // Это для экрана домой
      '/home': (context) => Home(), // возвращает виджет Home()
      // Это для выбора локации
      '/location': (context) => ChooseLocation() // возвращает виджет ChooseLocation()
    },
  )
);
