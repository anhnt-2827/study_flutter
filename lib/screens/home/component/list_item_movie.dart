import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/home/component/item_movie.dart';
import 'package:untitled/view_model/popular_movie_viewModel.dart';
import 'package:untitled/view_model/ui.dart';

class ListItemMovie extends StatelessWidget {
  const ListItemMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PopularMovieViewModel>(
        builder: (context, popularMovieViewModel, child) {
      return Consumer<UI>(
        builder: (context, ui, child) {
          if (popularMovieViewModel.loading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          }
          if (popularMovieViewModel.listMovie.isEmpty) {
            return Center(
              child: RichText(
                text: TextSpan(
                  text: 'No data',
                  style: TextStyle(fontSize: ui.fontSize, color: Colors.black),
                ),
              ),
            );
          }
          return Scaffold(
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                CupertinoSliverRefreshControl(
                  onRefresh: () {
                    Future.delayed(const Duration(milliseconds: 10000));
                    // ignore: void_checks
                    return Future.value(true);
                  },
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Consumer<PopularMovieViewModel>(
                        builder: (context, model, child) {
                      return ItemMovie(movie: model.listMovie[index]);
                    }),
                    childCount: popularMovieViewModel.listMovie.length,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
