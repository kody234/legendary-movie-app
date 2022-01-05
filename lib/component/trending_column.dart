import 'package:flutter/material.dart';
import 'package:movie_app/data/api_service.dart';

import 'movie_card.dart';

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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return MovieCard(
                        snapshot: snapshot,
                        index: index,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: snapshot.data!.length),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
