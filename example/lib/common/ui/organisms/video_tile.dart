

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hmssdk_flutter/hmssdk_flutter.dart';
import 'package:hmssdk_flutter_example/common/ui/organisms/change_track_options.dart';
import 'package:hmssdk_flutter_example/common/ui/organisms/peer_item_organism.dart';
import 'package:hmssdk_flutter_example/meeting/meeting_store.dart';
import 'package:hmssdk_flutter_example/meeting/peer_track_node_store.dart';
//import 'package:hmssdk_flutter_example/meeting/peerTrackNode.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoTile extends StatefulWidget {
  PeerTrackNodeStore peerTrackNodeStore;

  VideoTile(this.peerTrackNodeStore); //  final tileIndex;
 // // final List<PeerTracKNode> filteredList;
 //  final double itemHeight;
 //  final double itemWidth;
 //  final Map<String, HMSTrackUpdate> trackStatus;
 //  final Map<String, String> observerMap;
 //  final bool audioView;
 //  VideoTile({
 //    Key? key,
 //    required this.tileIndex,
 //    required this.filteredList,
 //    this.itemHeight = 200.0,
 //    this.itemWidth = 200.0,
 //    required this.trackStatus,
 //    required this.observerMap,
 //    required this.audioView,
 //  }) : super(key: key);

  @override
  State<VideoTile> createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {


  @override
  Widget build(BuildContext context) {
    // MeetingStore _meetingStore = context.read<MeetingStore>();
    // var index = widget.tileIndex;
    // var filteredList = widget.filteredList;
    //
    // if (index >= filteredList.length) return SizedBox();


    return Observer(builder: (_){
      print("rebuilding ${widget.peerTrackNodeStore.peer?.name}");
      return Text(widget.peerTrackNodeStore.peer?.name??"");
    });
  }
}
