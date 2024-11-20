
import 'package:flutter/material.dart';
import 'package:world_time/packages/home.dart';
import 'package:world_time/packages/choose_location.dart';
import 'package:world_time/packages/loading.dart';



void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context)=>loading(),
      '/home':(context)=>home(),
      '/choose_location':(context)=>choose_location(),
    },
  ));
}

