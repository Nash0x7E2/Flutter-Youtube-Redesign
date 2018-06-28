import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_redesign/models/example_content.dart';
import 'package:youtube_redesign/views/youtube_card.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );
  SystemUiOverlayStyle(statusBarColor: Colors.amber);
  SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
      label: 'YouTube', primaryColor: 0XFFff5a5f));
  runApp(
    YouTube(),
  );
}

class YouTube extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Image.asset('assets/logo.png'),
          ),
          elevation: 0.5,
          title: Text(
            'Home',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.search, color: Colors.black),
            ),
          ],
        ),
        body: YoutubeBody(),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.red,
            iconSize: 24.0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.whatshot),
                title: Text('Trending'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text('Subscriptions'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                title: Text('Activity'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.folder),
                title: Text('Library'),
              ),
            ]),
      ),
    );
  }
}

class YoutubeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/Home_clean.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        ListView.builder(
          cacheExtent: MediaQuery.of(context).size.height,
          itemCount: ExampleContent.exampleVideos.length,
          itemBuilder: (BuildContext context, int index) {
            return InkResponse(
              onTap: () => Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(ExampleContent.exampleVideos[index].title),
                  )),
              child: YoutubeCard(content: ExampleContent.exampleVideos[index]),
            );
          },
        ),
      ],
    );
  }
}
