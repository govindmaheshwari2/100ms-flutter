import 'package:hmssdk_flutter/hmssdk_flutter.dart';
import 'package:mobx/mobx.dart';

@observable
class PeerTracKNode {
  String peerId;
  String name;
  @observable
  HMSTrack? track;
  HMSTrack? audioTrack;
  PeerTracKNode({
    required this.peerId,
    this.track,
    this.name = "",
    this.audioTrack,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeerTracKNode &&
          runtimeType == other.runtimeType &&
          peerId == other.peerId;

  @override
  String toString() {
    return 'PeerTracKNode{peerId: $peerId, name: $name, track: $track}';
  }

  @override
  int get hashCode => peerId.hashCode;
}