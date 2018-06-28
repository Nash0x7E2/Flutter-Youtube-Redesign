import 'package:flutter/material.dart';

class YoutubeCardContent {
  YoutubeCardContent({
    @required this.videoThumbnailUrl,
    @required this.channelThumbnailUrl,
    @required this.trendingPosition,
    @required this.title,
    @required this.channelName,
    @required this.views,
    @required this.createdAt,
  });

  final String videoThumbnailUrl;
  final String channelThumbnailUrl;
  final int trendingPosition;
  final String title;
  final String channelName;
  final int views;
  final String createdAt;
}
