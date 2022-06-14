


import 'package:flutter/material.dart';
import 'package:hmssdk_flutter/hmssdk_flutter.dart';


class VideoView extends StatefulWidget {

  final HMSVideoTrack track;
  final String name;
  const VideoView(this.track,this.name,{Key? key}) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  @override
  Widget build(BuildContext context) {
    return HMSVideoView(
      track: widget.track,
      matchParent: true,
    );
  }
}
