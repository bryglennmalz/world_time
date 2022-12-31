import 'package:flutter/material.dart';
import 'package:world_time_x/pages/choose_location.dart';
import 'package:world_time_x/pages/home.dart';
import 'package:world_time_x/pages/loading.dart';
import 'package:world_time_x/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));


}
