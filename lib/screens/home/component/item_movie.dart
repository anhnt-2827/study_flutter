import 'package:flutter/material.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/main.dart';
import 'package:untitled/model/movie_model.dart';

class ItemMovie extends StatelessWidget {
  final Movie movie;
  const ItemMovie({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.movieDetail, arguments: movie.id);
      },
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 14, bottom: 15),
            width: 100,
            height: 160,
            child: Image.network('${Constants.urlAPI}${movie.posterPath}',
                fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(fontSize: 20),
                    maxLines: 1,
                  ),
                  Text(
                    movie.overview,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
