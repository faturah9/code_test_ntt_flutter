import 'package:faturcodetestnttflutter/pages/best_movie_page/best_movie_page.dart';
import 'package:faturcodetestnttflutter/pages/genres_page/genres_page.dart';
import 'package:faturcodetestnttflutter/pages/now_playing_page/now_playing_page.dart';
import 'package:faturcodetestnttflutter/pages/person_page/person_page.dart';
import 'package:faturcodetestnttflutter/style/theme.dart' as Style;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDescending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        title: const Text("PilemQue",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        children: const <Widget>[
          NowPlayingPage(),
          GenresPage(),
          PersonPage(),
          BestMoviePage(),
        ],
      ),
    );
  }
}
