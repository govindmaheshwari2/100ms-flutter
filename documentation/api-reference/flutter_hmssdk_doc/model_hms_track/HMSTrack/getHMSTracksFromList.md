


# getHMSTracksFromList method




    *[<Null safety>](https://dart.dev/null-safety)*




[List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[HMSTrack](../../model_hms_track/HMSTrack-class.md)> getHMSTracksFromList
({required [List](https://api.flutter.dev/flutter/dart-core/List-class.html) listOfMap, [HMSPeer](../../model_hms_peer/HMSPeer-class.md)? peer})








## Implementation

```dart
static List<HMSTrack> getHMSTracksFromList(
    {required List listOfMap, HMSPeer? peer}) {
  List<HMSTrack> tracks = [];

  listOfMap.forEach((each) {
    tracks.add(HMSTrack.fromMap(map: each, peer: peer));
  });

  return tracks;
}
```






