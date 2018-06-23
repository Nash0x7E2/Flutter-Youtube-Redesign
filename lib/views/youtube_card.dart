import 'package:flutter/material.dart';
import 'package:youtube_redesign/main.dart';
import 'package:youtube_redesign/models/youtube_card_content.dart';


class YoutubeCard extends StatelessWidget {
  YoutubeCard({@required this.content});

  final YoutubeCardContent content;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
      child: Material(
        color: Color(0XFFFFFFFF),
        elevation: 2.0,
        borderRadius: BorderRadius.circular(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //Container which video tumbnail
            Container(
              padding: EdgeInsets.only(
                  left: 12.0, right: 12.0, top: 12.0, bottom: 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  content.videoThumbnailUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            //Row which contain channel tumbnail along with video information
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Container of Channel Tubmnail
                  Image.network(
                    content.channelThumbnailUrl,
                    width: 90.0,
                    height: 90.0,
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: 8.0),
                        Text(
                          '#${content.trendingPosition} ON TRENDING ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          content.title.toUpperCase(),
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.5,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          content.channelName.toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0XFF646464),
                            fontSize: 13.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '${content.views}M views · ${content.createdAt}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0XFFBBBBBB),
                            fontWeight: FontWeight.w800,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
