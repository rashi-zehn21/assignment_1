import 'package:assignment_1/store_page.dart';
import 'package:flutter/material.dart';
import 'video_player.dart';
import 'home_page.dart';
// import 'motion_tab_bar.dart';
// import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'notification_icon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Strength Training',
      debugShowCheckedModeBanner: false,
      home: VideoPlayerScreen(),
    );
    
  }
}
