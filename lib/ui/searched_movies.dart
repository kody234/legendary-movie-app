import 'package:flutter/material.dart';
import 'package:movie_app/component/movie_card.dart';
import 'package:movie_app/data/api_service.dart';
import 'package:movie_app/ui/movie_detail.dart';

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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.chevron_left,
                            size: 30,
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Results for ${widget.query}',
                        softWrap: false,
                        style: const TextStyle(
                            color: Color(0xFF12153D),
                            fontWeight: FontWeight.w600,
                            fontSize: 26),
                      ),
                      SizedBox(
                        height: 20,
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
                                              firstSnapshot: snapshot,
                                              index: index)));
                                },
                                child:
                                    MovieCard(snapshot: snapshot, index: index),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 20,
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
