import 'package:faturcodetestnttflutter/model/movie_model/movie.dart';
import 'package:faturcodetestnttflutter/model/movie_model/movie_response.dart';
import 'package:faturcodetestnttflutter/pages/movie_genre_page/detail_screen.dart';
import 'package:faturcodetestnttflutter/style/theme.dart' as style;
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

class BuildHomeWidget extends StatelessWidget {
  final MovieResponse? data;

  const BuildHomeWidget({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController =
        PageController(viewportFraction: 1, keepPage: true);
    List<MovieModel> movies = data!.movies;
    if (movies.isEmpty) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: const <Widget>[
                Text(
                  "No More Movies",
                  style: TextStyle(color: Colors.black45),
                )
              ],
            )
          ],
        ),
      );
    } else {
      return SizedBox(
        height: 220.0,
        child: PageIndicatorContainer(
          align: IndicatorAlign.bottom,
          length: movies.take(5).length,
          indicatorSpace: 8.0,
          padding: const EdgeInsets.all(5.0),
          indicatorColor: style.Colors.titleColor,
          indicatorSelectorColor: style.Colors.secondColor,
          shape: IndicatorShape.circle(size: 5.0),
          child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: movies.take(5).length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MovieDetailScreen(movie: movies[index]),
                    ),
                  );
                },
                child: Stack(
                  children: <Widget>[
                    Hero(
                      tag: movies[index].id,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 220.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/original/${movies[index].backPoster}")),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: const [
                              0.0,
                              0.9
                            ],
                            colors: [
                              style.Colors.mainColor.withOpacity(1.0),
                              style.Colors.mainColor.withOpacity(0.0)
                            ]),
                      ),
                    ),
                    Positioned(
                      bottom: 30.0,
                      child: Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        width: 250.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              movies[index].title,
                              style: const TextStyle(
                                  height: 1.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
