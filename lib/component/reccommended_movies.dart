import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/ui/movie_detail.dart';

import '../size_config.dart';

class ReccommendedMovies extends StatefulWidget {
  const ReccommendedMovies({
    Key? key,
    required this.future2,
  }) : super(key: key);

  final Future<List?>? future2;

  @override
  State<ReccommendedMovies> createState() => _ReccommendedMoviesState();
}

class _ReccommendedMoviesState extends State<ReccommendedMovies> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List?>(
        future: widget.future2,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: 29.4 * SizeConfig.textMultiplier!,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  primary: false,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => MovieDetail(
                                    movieSnapshot: snapshot, index: index)));
                      },
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                  imageUrl:
                                      'http://image.tmdb.org/t/p/w185${snapshot.data![index]['poster_path']}')),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 5 * SizeConfig.widthMultiplier!,
                    );
                  },
                  itemCount: snapshot.data!.length),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
