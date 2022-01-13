import 'package:flutter/material.dart';
import 'package:movie_app/data/api_service.dart';
import 'package:movie_app/ui/movie_detail.dart';

import '../widgets/movie_card.dart';

class TopRatedMovies extends StatefulWidget {
  const TopRatedMovies({Key? key}) : super(key: key);

  @override
  _TopRatedMoviesState createState() => _TopRatedMoviesState();
}

class _TopRatedMoviesState extends State<TopRatedMovies> {
  Future<List?>? future = null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = ApiService().getTopRatedMovies();
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
                        return const SizedBox(
                          height: 20,
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
