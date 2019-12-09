import 'dart:convert';

import '../../models/media_streams/video_meta_info.dart';

import 'adaptive_stream_info_parser.dart';
import 'muxed_stream_info_parser.dart';

class VideoMetaParser {
  dynamic _root;

  VideoMetaParser(this._root);

  static VideoMetaParser initialize(dynamic raw) {
    var root = raw;
    return VideoMetaParser(root);
  }

  String get title => _root["videoDetails"]["title"];

  int get duration => int.parse(_root["videoDetails"]["lengthSeconds"]);

  String get channelId => _root["videoDetails"]["channelId"];
  String get description => _root["videoDetails"]["shortDescription"];

  int _compareThumbnail(dynamic t1, dynamic t2) {
    return -t1["width"].compareTo(t2["width"]);
  }

  String get thumbnail {
    var tmp = _root["videoDetails"]["thumbnail"]["thumbnails"]
      ..sort(_compareThumbnail);
    return tmp.first["url"];
  }

  double get rating => _root["videoDetails"]["averageRating"];
  String get channelTitle => _root["videoDetails"]["author"];
  int get views => int.parse(_root["videoDetails"]["viewCount"]);

  DateTime get publishDate => DateTime.parse(
      _root["microformat"]["playerMicroformatRenderer"]["publishDate"]);

  VideoMetaInfo toEntity() {
    return new VideoMetaInfo(
      title: title,
      duration: Duration(seconds: duration),
      channelId: channelId,
      description: description,
      thumbnail: thumbnail,
      rating: rating,
      channelTitle: channelTitle,
      views: views,
      publishDate: publishDate,
    );
  }
}
