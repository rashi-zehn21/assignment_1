// import 'package:flutter/material.dart';
// import 'package:video_example/widget/video_player_widget.dart';
// import 'package:video_player/video_player.dart';

// class AssetPlayerWidget extends StatefulWidget {
//   @override
//   _AssetPlayerWidgetState createState() => _AssetPlayerWidgetState();
// }

// class _AssetPlayerWidgetState extends State<AssetPlayerWidget> {
//   final asset = 'assets/video.mp4';
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset(asset)
//       ..addListener(() => setState(() {}))
//       ..setLooping(true)
//       ..initialize().then((_) => _controller.play());
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isMuted = _controller.value.volume == 0;

//     return Column(
//       children: [
//         VideoPlayerWidget(controller: controller),
//         const SizedBox(height: 32),
//         if (controller != null && controller.value.initialized)
//           CircleAvatar(
//             radius: 30,
//             backgroundColor: Colors.red,
//             child: IconButton(
//               icon: Icon(
//                 isMuted ? Icons.volume_mute : Icons.volume_up,
//                 color: Colors.white,
//               ),
//               onPressed: () => controller.setVolume(isMuted ? 1 : 0),
//             ),
//           )
//       ],
//     );
//   }
// }