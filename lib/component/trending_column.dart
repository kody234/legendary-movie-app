import 'package:flutter/material.dart';
import 'package:movie_app/data/api_service.dart';
import 'package:movie_app/size_config.dart';
import 'package:movie_app/ui/movie_detail.dart';

import '../widgets/movie_card.dart';

class TrendingMovies extends StatefulWidget {
  const TrendingMovies({Key? key}) : super(key: key);

  @override
  _TrendingMoviesState createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  Future<List?>? future = null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = ApiService().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List?>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 2.9 * SizeConfig.heightMultiplier!),
                child: Scrollbar(
                  showTrackOnHover: true,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => MovieDetail(
                                          movieSnapshot: snapshot,
                                          index: index,
                                        )));
                          },
                          child: MovieCard(
                            snapshot: snapshot,
                            index: index,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 2.9 * SizeConfig.heightMultiplier!,
                        );
                      },
                      itemCount: snapshot.data!.length),
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
