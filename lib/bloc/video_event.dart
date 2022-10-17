//part of 'login_bloc.dart';
part of 'video_bloc.dart';
//import 'package:flutter/material.dart';

abstract class VideoEvent {
  const VideoEvent();
}

class VideoScreenPressed extends VideoEvent {
  String? url;
  //String? password;

  VideoScreenPressed({
     this.url, required Type Url,
    //@required this.password,
  });

  @override
  List<Object> get props => [url!];

  @override
  String toString() => ' VideoScreenPressed { url: $url}';
}
