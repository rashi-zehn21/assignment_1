// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:assignment_1/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:google_fonts/google_fonts.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String url;
  final String Training_Name;
  final String Duration;
  final String Ratings;
  final String Description;
  VideoPlayerScreen(
      {Key? key,
      required this.url,
      required this.Training_Name,
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

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.url);

    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);

    super.initState();
  }

  void downloadData() {
    Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      setState(() {
        if (_value >= 4) {
          _value = 0;
        }
        _value = _value + 0.4;

        // if (_value == 1) {
        //   timer.cancel();
        // } else {
        //   _value = _value + 1;
        // }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String url = widget.url;
    String Training_Name = widget.Training_Name;
    String Ratings = widget.Ratings;
    String Description = widget.Description;
    String Duration = widget.Duration;
    final isMuted = _controller.value.volume == 0;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
          // Container(
          Stack(
            children: [
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return _controller.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          )
                        : Container(
                            height: 100,
                            width: double.infinity,
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                                child: CircularProgressIndicator(
                              color: Color(0xff239C91),
                              strokeWidth: 3,
                            )));
                  } else {
                    return Container(
                      height: 100,
                      width: double.infinity,
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: CircularProgressIndicator(
                        color: Color(0xff239C91),
                        strokeWidth: 3,
                      )),
                    );
                  }
                },
              ),
              Positioned(
                  left: 10,
                  bottom: 10,
                  child: _controller.value.isInitialized
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              // pause
                              if (_controller.value.isPlaying) {
                                _controller.pause();
                              } else {
                                // play
                                _controller.play();
                                downloadData();
                              }
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xff239C91)),
                            child: Icon(
                              color: Colors.white,
                              size: 34,
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                          ),
                        )
                      : Container(
                          height: 0,
                        )),
              Positioned(
                  bottom: 20,
                  width: 225,
                  left: 70,
                  height: 15,
                  child: _controller.value.isInitialized
                      ? Container(
                          width: 220,
                          height: 10,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(const Radius.circular(20.0)),
                            child: VideoProgressIndicator(
                              _controller,
                              allowScrubbing: false,
                              colors: VideoProgressColors(
                                  //backgroundColor: Colors.white,
                                  bufferedColor: Colors.grey,
                                  playedColor: Color(0xff239C91)),
                            ),
                          ),
                        )
                      : Container(
                          height: 0,
                        )),
              Positioned(
                left: 310,
                bottom: 14,
                child: Icon(
                    color: Colors.white,
                    size: 28,
                    _controller.value.isPlaying
                        ? Icons.volume_down
                        : Icons.volume_off),
              ),
              Positioned(
                  left: 350,
                  bottom: 14,
                  child: Icon(
                      color: Colors.white,
                      size: 28,
                      _controller.value.isPlaying
                          ? Icons.fullscreen_exit_rounded
                          : Icons.fullscreen_sharp))
            ],
          ),
          // ),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              widget.Training_Name,
              style: TextStyle(
                  fontSize: 29,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              widget.Duration,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Montserrat-Bold",
                  fontSize: 19.0),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: MediaQuery.of(context).size.height / 15,
            margin: EdgeInsets.only(left: 18),
            alignment: Alignment.topLeft,
            child: ElevatedButton(
              onPressed: () {},
              // ignore: sort_child_properties_last
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.white,
                  ),
                  Text(widget.Ratings),
                ],
              ),
              style: ElevatedButton.styleFrom(
                  primary: Color(0xff239C91), shape: const StadiumBorder()),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  widget.Description,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 12,
                  width: MediaQuery.of(context).size.height / 2,
                  child: ElevatedButton(
                      child: Text('Attend Training'),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                            height: 1,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        primary: Color(0xff239C91),
                        onPrimary: Colors.white,
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                      ),
                      onPressed: () {
                        print('Pressed');
                      }),
                ),
              ]),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
