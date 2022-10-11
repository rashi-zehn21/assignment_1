// ignore_for_file: unnecessary_this, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'asset_widget_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
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
    _controller = VideoPlayerController.network(
        'https://player.vimeo.com/external/403637875.sd.mp4?s=203929c386ecb701b2d70b551df5450a45a38ec0&profile_id=164&oauth2_token_id=57447761');

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
    final isMuted = _controller.value.volume == 0;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100,
                child: IconButton(
                    onPressed: () => {Navigator.pop(context)},
                    icon: const Icon(Icons.arrow_back_ios_sharp,
                        size: 30.0, color: Colors.black)),
              ),
            ],
          ),
          //const SizedBox(height: ),
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
                    return const Center(child: LinearProgressIndicator());
                  }
                },
              ),

              Positioned(
                top: 170,
                left: 10,
                child: IconButton(
                    onPressed: () {
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
                    icon: Positioned(
                      child: Container(
                        height: 90,
                        // height: 95,
                        width: 95,
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
                    )),
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
                  fontFamily: "Roboto-Bold",
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
