import 'package:flutter/material.dart';
import 'package:movie_app/data/api_service.dart';
import 'package:movie_app/ui/movie_detail.dart';
import 'package:movie_app/widgets/movie_card.dart';

import '../size_config.dart';

class SearchedMovies extends StatefulWidget {
  const SearchedMovies({Key? key, required this.query}) : super(key: key);

  final String query;

  @override
  State<SearchedMovies> createState() => _SearchedMoviesState();
}

class _SearchedMoviesState extends State<SearchedMovies> {
  Future<List?>? future = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = ApiService().getSearchQuery(widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List?>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 5 * SizeConfig.widthMultiplier!),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.5 * SizeConfig.heightMultiplier!,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.chevron_left,
                            size: 7.5 * SizeConfig.widthMultiplier!,
                          )),
                      SizedBox(
                        height: 5.9 * SizeConfig.heightMultiplier!,
                      ),
                      Text(
                        'Results for ${widget.query}',
                        softWrap: false,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: 5 * SizeConfig.heightMultiplier!,
                      ),
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => MovieDetail(
                                              movieSnapshot: snapshot,
                                              index: index)));
                                },
                                child:
                                    MovieCard(snapshot: snapshot, index: index),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 5 * SizeConfig.heightMultiplier!,
                              );
                            },
                            itemCount: snapshot.data!.length),
                      ),
                    ],
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
