import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/component/app_bar.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/view_model/popular_movie_viewModel.dart';
import 'package:untitled/view_model/ui.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      // run after render
      final id = (ModalRoute.of(context)?.settings.arguments);
      context.read<PopularMovieViewModel>().getMovieDetails(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UI>(
        builder: (context, ui, child) => Container(
          color: ui.colorGrey,
          child: Consumer<PopularMovieViewModel>(
            builder: (context, model, child) {
              if (model.loading) {
                return Center(
                  child: CircularProgressIndicator(color: ui.colorWhite),
                );
              }
              return Scaffold(
                appBar: CustomAppBar(
                    title: 'Movie detail',
                    isLeading: true,
                    onLeadingPress: () => Navigator.pop(context),
                    iconLeading: Icons.arrow_back_ios),
                body: SingleChildScrollView(
                  child: Consumer<PopularMovieViewModel>(
                    builder: (context, model, child) => Column(children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ClipPath(
                              clipper: CustomClipPath(),
                              child: Image.network(
                                '${Constants.urlAPI}${model.movieDetail!.backdropPath}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 15,
                            child: SizedBox(
                              width: 100,
                              height: 150,
                              child: Image.network(
                                '${Constants.urlAPI}${model.movieDetail!.posterPath}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    model.movieDetail!.title.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Stack(
                                  children: [
                                    CircularProgressIndicator(
                                      strokeWidth: 5,
                                      value:
                                          model.movieDetail!.voteAverage / 10,
                                      backgroundColor: ui.colorGrey,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          ui.colorBlack),
                                    ),
                                    Positioned(
                                      top: 10,
                                      left: 10,
                                      child: Text(
                                        model.movieDetail!.voteAverage
                                            .toString(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: ui.colorBlack,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Column(children: [
                                        Icon(
                                          Icons.chat_rounded,
                                          color: ui.colorWhite,
                                        ),
                                        const Text('Reviews')
                                      ]),
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  color: ui.colorBlack,
                                  width: 2,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Column(children: [
                                        Icon(
                                          Icons.play_circle_fill_rounded,
                                          color: ui.colorWhite,
                                        ),
                                        const Text('Trailers')
                                      ]),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            height: 2,
                            color: ui.colorBlack,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 15),
                                  child: Column(
                                    children: [
                                      const Text('Genre',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                      const SizedBox(height: 5),
                                      Text(model.movieDetail!.genres![0].name
                                          .toString()),
                                    ],
                                  ),
                                ),
                                VerticalDivider(
                                  color: ui.colorTransparent,
                                  width: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 15),
                                  child: Column(
                                    children: [
                                      const Text('Release',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                      const SizedBox(height: 5),
                                      Text(model.movieDetail!.releaseDate
                                          .toString()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            height: 2,
                            color: ui.colorBlack,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(model.movieDetail!.overview.toString()),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.75);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
