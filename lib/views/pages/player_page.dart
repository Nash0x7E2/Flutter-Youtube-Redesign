import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import 'package:youtube_redesign/models/youtube_card_content.dart';
//References :
//  https://you-link.herokuapp.com/?url=[FULL YOUTUBE URL]
//  https://you-link.herokuapp.com/?url=https://www.youtube.com/watch?v=[VIDEO ID]
//Example:
//  https://you-link.herokuapp.com/?url=https://www.youtube.com/watch?v=mOfg50NCde4

class PlayerPage extends StatefulWidget {
  PlayerPage({@required this.video});

  final YoutubeCardContent video;

  static Route<PlayerPage> route({@required YoutubeCardContent video}) =>
      MaterialPageRoute(
        builder: (context) => new PlayerPage(video: video),
      );

  static void routeTo({
    @required BuildContext context,
    @required YoutubeCardContent video,
  }) =>
      Navigator.of(context).push(PlayerPage.route(video: video));

  PlayerPageState createState() => new PlayerPageState();
}

class PlayerPageState extends State<PlayerPage> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        "https://r3---sn-p5qs7nes.googlevideo.com/videoplayback?c=WEB&key=yt6&ei=GGUsW7mALYr1hgaWwonYBw&ipbits=0&clen=495238&source=youtube&signature=026A74D0EFB45B2DFF08006B3783023AF04C80A0.9872B6B1B7A5402C9D1E80BECF87A63A557F187A&expire=1529657720&ratebypass=yes&lmt=1480396509166174&requiressl=yes&gir=yes&mime=video%2Fmp4&fvip=3&fexp=23709359&sparams=clen%2Cdur%2Cei%2Cgir%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cexpire&id=o-ADm1_V70BCrJ3acV4vo59vv3wVjMw5ErK2HXjRO4i9mT&mt=1529635598&mv=u&dur=10.704&itag=18&ms=au%2Crdu&ip=54.80.158.253&mm=31%2C29&mn=sn-p5qs7nes%2Csn-p5qlsnd6&pl=17");
    _controller.initialize().then((_) => setState(() {
          _controller.setVolume(0.8);
          _controller.play();
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 300.0,
        height: 300.0,
        color: Colors.black26,
        child: (_controller.value.initialized)
            ? CircularProgressIndicator()
            : VideoPlayer(_controller),
      ),
    );
  }
}
