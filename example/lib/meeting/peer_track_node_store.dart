import 'package:hmssdk_flutter/hmssdk_flutter.dart';
import 'package:mobx/mobx.dart';

part 'peer_track_node_store.g.dart';

class PeerTrackNodeStore = PeerTracKNodeStoreBase with _$PeerTrackNodeStore;


abstract class PeerTracKNodeStoreBase with Store{

  @observable
  HMSPeer? peer;

  @observable
  HMSTrack? track;

  @observable
  HMSTrack? audioTrack;

  PeerTracKNodeStoreBase({this.peer, this.track, this.audioTrack});



  @override
  String toString() {
    return 'PeerTracKNode{peerId: ${peer?.peerId}, name: ${peer?.name}, track: $track}';
  }

  @override
  int get hashCode => peer?.peerId.hashCode??0;
}
