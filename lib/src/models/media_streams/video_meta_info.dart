class VideoMetaInfo {
  String title;
  Duration duration;
  String channelId;
  String description;
  String thumbnail;
  double rating;
  String channelTitle;
  int views;
  DateTime publishDate;

  VideoMetaInfo({this.title, this.duration, this.channelId, this.description, this.thumbnail, this.rating, this.channelTitle, this.views, this.publishDate});

  @override
  String toString() => 'VideoMetaInfo ($title - $channelId)';
}
