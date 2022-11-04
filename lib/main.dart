

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Widget/video_player.dart';
import 'home_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Widget/notification_icon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Strength Training',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
