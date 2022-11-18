import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:faturcodetestnttflutter/bloc/get_movies_bloc.dart';
import 'package:faturcodetestnttflutter/injection_container.dart';
import 'package:faturcodetestnttflutter/model/movie_model/movie.dart';
import 'package:faturcodetestnttflutter/model/movie_model/movie_response.dart';
import 'package:faturcodetestnttflutter/pages/movie_genre_page/detail_screen.dart';
import 'package:faturcodetestnttflutter/style/theme.dart' as Style;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BestMoviePage extends StatefulWidget {
  const BestMoviePage({Key? key}) : super(key: key);

  @override
  State<BestMoviePage> createState() => _BestMoviePageState();
}

class _BestMoviePageState extends State<BestMoviePage> {
  @override
  void initState() {
    super.initState();
    sl<MoviesListBloc>().getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 10.0, top: 20.0),
          child: Text(
            "BEST POPULAR MOVIES",
            style: TextStyle(
                color: Style.Colors.titleColor,
                fontWeight: FontWeight.w500,
                fontSize: 12.0),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        StreamBuilder<MovieResponse>(
          stream: sl<MoviesListBloc>().subject.stream,
          builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.error.isNotEmpty) {
                return _buildErrorWidget(snapshot.data!.error);
              }
              return _buildHomeWidget(snapshot.data!);
            } else if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error.toString());
            } else {
              return _buildLoadingWidget();
            }
          },
        )
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(
          height: 25.0,
          width: 25.0,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 4.0,
          ),
        )
      ],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget _buildHomeWidget(MovieResponse data) {
    List<MovieModel> movies = data.movies;
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
      return Container(
        height: 270.0,
        padding: const EdgeInsets.only(left: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MovieDetailScreen(movie: movies[index]),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: movies[index].id,
                      child: Container(
                          width: 120.0,
                          height: 180.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(2.0)),
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w200/${movies[index].poster}")),
                          )),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        movies[index].title,
                        maxLines: 2,
                        style: const TextStyle(
                            height: 1.4,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 11.0),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          movies[index].rating.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        RatingBar(
                          ratingWidget: RatingWidget(
                            empty: const Icon(
                              EvaIcons.star,
                              color: Style.Colors.secondColor,
                            ),
                            full: const Icon(
                              EvaIcons.star,
                              color: Style.Colors.secondColor,
                            ),
                            half: const Icon(
                              EvaIcons.star,
                              color: Style.Colors.secondColor,
                            ),
                          ),
                          itemSize: 8.0,
                          initialRating: movies[index].rating / 2,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                          onRatingUpdate: (rating) {
                            if (kDebugMode) {
                              print(rating);
                            }
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
