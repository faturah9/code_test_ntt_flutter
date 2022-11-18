import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:faturcodetestnttflutter/bloc/get_movie_videos_bloc.dart';
import 'package:faturcodetestnttflutter/bloc/get_persons_bloc.dart';
import 'package:faturcodetestnttflutter/injection_container.dart';
import 'package:faturcodetestnttflutter/model/person_model/person.dart';
import 'package:faturcodetestnttflutter/model/video_model/video_response.dart';
import 'package:faturcodetestnttflutter/pages/movie_genre_page/sliver_fab.page.dart';
import 'package:faturcodetestnttflutter/style/theme.dart' as Style;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPersonPage extends StatefulWidget {
  final PersonModel? person;
  const DetailPersonPage({Key? key, this.person}) : super(key: key);

  @override
  State<DetailPersonPage> createState() => _DetailPersonPageState();
}

class _DetailPersonPageState extends State<DetailPersonPage> {
  @override
  void initState() {
    super.initState();
    sl<PersonsListBloc>().getPersons();
  }

  @override
  void dispose() {
    super.dispose();
    sl<PersonsListBloc>().drainStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      body: Builder(
        builder: (context) {
          return SliverFab(
            topScalingEdge: 96.0,
            floatingPosition: const FloatingPosition(right: 20),
            floatingWidget: StreamBuilder<VideoResponse>(
              stream: sl<MovieVideosBloc>().subject.stream,
              builder: (context, AsyncSnapshot<VideoResponse> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.error.isNotEmpty) {
                    return _buildErrorWidget(snapshot.data!.error);
                  }
                  return _buildVideoWidget(snapshot.data!);
                } else if (snapshot.hasError) {
                  return _buildErrorWidget(snapshot.error.toString());
                } else {
                  return _buildLoadingWidget();
                }
              },
            ),
            expandedHeight: 200.0,
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Style.Colors.mainColor,
                expandedHeight: 200.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      widget.person!.name.length > 40
                          ? "${widget.person!.name.substring(0, 37)}..."
                          : widget.person!.name,
                      style: const TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.normal),
                    ),
                    background: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/original/${widget.person!.profileImg}")),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5)),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: const [
                                  0.1,
                                  0.9
                                ],
                                colors: [
                                  Colors.black.withOpacity(0.9),
                                  Colors.black.withOpacity(0.0)
                                ]),
                          ),
                        ),
                      ],
                    )),
              ),
              SliverPadding(
                  padding: const EdgeInsets.all(0.0),
                  sliver: SliverList(
                      delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            widget.person!.popularity.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          RatingBar(
                            itemSize: 10.0,
                            initialRating: widget.person!.popularity / 2,
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
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 20.0),
                      child: Text(
                        "OVERVIEW",
                        style: TextStyle(
                            color: Style.Colors.titleColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        widget.person!.known.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 12.0, height: 1.5),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ])))
            ],
          );
        },
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [],
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

  Widget _buildVideoWidget(VideoResponse videoResponse) {
    return Text(widget.person!.name);
  }
}
