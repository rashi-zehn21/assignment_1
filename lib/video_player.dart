// ignore_for_file: unnecessary_this, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:assignment_1/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'asset_widget_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String url;
  final String Trainig_Name;
  final String Duration;
  final String Ratings;
  final String Description;
  VideoPlayerScreen(
      {Key? key,
      required this.url,
      required this.Trainig_Name,
      required this.Duration,
      required this.Description,
      required this.Ratings})
      : super(key: key);

  @override
  // VideoPlayerScreenState createState() => VideoPlayerScreenState();
  State<StatefulWidget> createState() {
    return VideoPlayerScreenState();
  }
}

class VideoPlayerScreenState extends State<VideoPlayerScreen> {
  double _value = 0;
  void downloadData() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_value == 1) {
          timer.cancel();
        } else {
          _value = _value + 0.1;
        }
      });
    });
  }

  // void update() {
  //   Timer.periodic(Duration(milliseconds: 100), (timer) {
  //     setState(() {});
  //   });
  // }

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.url);

    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String url = widget.url;
    String Trainig_Name = widget.Trainig_Name;
    String Ratings = widget.Ratings;
    String Description = widget.Description;
    String Duration = widget.Duration;
    final isMuted = _controller.value.volume == 0;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 35,
                height: 95,
                child: IconButton(
                    onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ))
                        },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 30.0,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
          Stack(
            children: [
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 10, 169, 169),
                      strokeWidth: 3,
                      //backgroundColor: Color.fromARGB(255, 10, 169, 169),
                    ));
                  }
                },
              ),

              Positioned(
                top: 170,
                left: 10,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      // pause
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        // play
                        _controller.play();
                      }
                    });
                  },
                  child: Container(
                    height: 40,
                    // height: 95,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color.fromARGB(255, 10, 169, 169)),
                    //color: Color.fromARGB(255, 10, 169, 169),
                    child: Icon(
                      color: Colors.white,
                      size: 34,
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 40,
                child: Container(
                    height: 175,
                    width: 235,
                    alignment: Alignment.bottomRight,
                    margin: const EdgeInsets.all(25),
                    child: const LinearProgressIndicator(
                      value: 0.5,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(255, 10, 169, 169)),
                      backgroundColor: Colors.grey,
                      minHeight: 10,
                    )),
              ),

              // SizedBox(
              //   width: 250,
              //   height: 20,
              //   child: LinearProgressIndicator(
              //     value: this._value,
              //     backgroundColor: Colors.cyan[100],
              //valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
              //   ),
              // ),
              // SizedBox(width: 10, height: 10),
              // Text(
              //   "" + (this._value * 100).round().toString() + "",
              //   style: TextStyle(fontSize: 20),
              // ),

              // Positioned(

              //   child: Slider(
              //     min: 0.0,
              //     max: 100.0,
              //     value: _value,
              //     onChanged: (value) {
              //       setState(() {
              //         _value = value;
              //       });
              //     },
              //   ),
              // ),
              // Container(
              //   height: 350,
              //   width: double.maxFinite,
              //   child: CupertinoSlider(
              //     min: 0.0,
              //     max: 100.0,
              //     value: _value,
              //     onChanged: (value) {
              //       setState(() {
              //         _value = value;
              //       });
              //     },
              //   ),
              // ),

              Positioned(
                left: 310,
                top: 180,
                child: Icon(
                    color: Colors.white,
                    size: 28,
                    _controller.value.isPlaying
                        ? Icons.volume_down
                        : Icons.volume_off),
              ),
              Positioned(
                  left: 350,
                  top: 180,
                  child: Icon(
                      color: Colors.white,
                      size: 28,
                      _controller.value.isPlaying
                          ? Icons.fullscreen_exit_rounded
                          : Icons.fullscreen_sharp))
            ],
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.only(right: 150),
            child: Text(
              " Shoulders + Back",
              style: TextStyle(
                  fontSize: 29,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.only(right: 290),
            child: Positioned(
                child: Text(
              '10 mins ',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Montserrat-Bold",
                  fontSize: 19.0),
            )),
          ),
          const SizedBox(height: 5),
          Container(
            margin: EdgeInsets.only(left: 18),
            alignment: Alignment.topLeft,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // ignore: prefer_const_constructors
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.white,
                  ),
                  Text(" 4.8"),
                ],
              ),
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 10, 169, 169),
                  shape: const StadiumBorder()),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            child: const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                "They’re a delicate joint and a meeting place for a host of tendons and ligaments,tendon attaches into the labrum, a key piece of cartilage that lends your shoulder major stability shoulder and back and latpulldowns one arm distance chin up and pulls delicate joint and a meeting place for a host of tendons and.",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 325.0,
            height: 52.0,
            child: ElevatedButton(
                child: Text('Attend Training'),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  primary: Color.fromARGB(255, 5, 147, 147),
                  onPrimary: Colors.white,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                ),
                onPressed: () {
                  print('Pressed');
                }),
          )
        ],
      ),
    );
  }
}
