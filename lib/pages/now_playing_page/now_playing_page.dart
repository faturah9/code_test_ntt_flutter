import 'package:faturcodetestnttflutter/bloc/get_now_playing_bloc.dart';
import 'package:faturcodetestnttflutter/model/movie_model/movie_response.dart';
import 'package:faturcodetestnttflutter/pages/now_playing_page/widget/build_error_widget.dart';
import 'package:faturcodetestnttflutter/pages/now_playing_page/widget/build_home_widget.dart';
import 'package:faturcodetestnttflutter/pages/now_playing_page/widget/build_loading_widget.dart';
import 'package:flutter/material.dart';

class NowPlayingPage extends StatefulWidget {
  const NowPlayingPage({Key? key}) : super(key: key);

  @override
  State<NowPlayingPage> createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {
  @override
  void initState() {
    super.initState();
    nowPlayingMoviesBloc.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieResponse>(
      stream: nowPlayingMoviesBloc.subject.stream,
      builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.error.isNotEmpty) {
            return BuildErrorWidget(error: snapshot.data!.error);
          }
          return BuildHomeWidget(data: snapshot.data);
        } else if (snapshot.hasError) {
          return BuildErrorWidget(error: snapshot.error.toString());
        } else {
          return const BuildLoadingWidget();
        }
      },
    );
  }
}
