import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/component/cast_grid.dart';
import 'package:movie_app/component/rating_card.dart';
import 'package:movie_app/component/reccommended_movies.dart';
import 'package:movie_app/data/api_service.dart';

import '../size_config.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({
    Key? key,
    required this.movieSnapshot,
    required this.index,
  }) : super(key: key);

  final AsyncSnapshot movieSnapshot;
  final int index;

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  Future<List?>? future = null;
  Future<List?>? future2 = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    future =
        ApiService().getCast(widget.movieSnapshot.data[widget.index]['id']);

    future2 = ApiService()
        .getReccommendedMovies(widget.movieSnapshot.data[widget.index]['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List?>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                              7.4 * SizeConfig.heightMultiplier!)),
                      child: CachedNetworkImage(
                        errorWidget: (context, string, d) =>
                            Icon(Icons.image_not_supported),
                        placeholder: (context, url) => Center(
                          child: Icon(Icons.image_sharp),
                        ),
                        imageUrl:
                            'http://image.tmdb.org/t/p/original${widget.movieSnapshot.data![widget.index]['backdrop_path']}',
                        height: 40.4 * SizeConfig.heightMultiplier!,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 5.9 * SizeConfig.heightMultiplier!,
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 7.8 * SizeConfig.widthMultiplier!),
                      child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.movieSnapshot.data![widget.index]
                                          ['title'] ??
                                      widget.movieSnapshot.data![widget.index]
                                          ['original_name'],
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                SizedBox(
                                  height: 1.2 * SizeConfig.heightMultiplier!,
                                ),
                                Text(
                                  'Release Date: ${widget.movieSnapshot.data![widget.index]['release_date']}',
                                  softWrap: false,
                                  style: TextStyle(
                                      color: Color(0xFF9A9BB2),
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          2.4 * SizeConfig.textMultiplier!),
                                ),
                                SizedBox(
                                  height: 10.3 * SizeConfig.heightMultiplier!,
                                ),
                                Text(
                                  'Plot Summary',
                                  softWrap: false,
                                  style: TextStyle(
                                      color: const Color(0xFF12153D),
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          3.5 * SizeConfig.textMultiplier!),
                                ),
                                SizedBox(
                                  height: 2.4 * SizeConfig.heightMultiplier!,
                                ),
                                Text(
                                  widget.movieSnapshot.data![widget.index]
                                      ['overview'],
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                SizedBox(
                                  height: 5.9 * SizeConfig.heightMultiplier!,
                                ),
                              ],
                            ),
                            Text('Cast & crew',
                                overflow: TextOverflow.fade,
                                style: Theme.of(context).textTheme.headline4),
                            CastGrid(snapshot: snapshot),
                            SizedBox(
                              height: 2.9 * SizeConfig.heightMultiplier!,
                            ),
                            Text('Recommendations',
                                overflow: TextOverflow.fade,
                                style: Theme.of(context).textTheme.headline4),
                            SizedBox(
                              height: 2.9 * SizeConfig.heightMultiplier!,
                            ),
                            ReccommendedMovies(
                              future2: future2,
                            ),
                            SizedBox(
                              height: 2.9 * SizeConfig.heightMultiplier!,
                            )
                          ]),
                    ),
                  )
                ],
              ),
              RatingCard(snapshot: widget.movieSnapshot, index: widget.index),
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    ));
  }
}
