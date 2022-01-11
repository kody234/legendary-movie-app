import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/component/cast_grid.dart';
import 'package:movie_app/component/rating_card.dart';
import 'package:movie_app/data/api_service.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({
    Key? key,
    required this.firstSnapshot,
    required this.index,
  }) : super(key: key);

  final AsyncSnapshot firstSnapshot;
  final int index;

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  Future<List?>? future = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    future =
        ApiService().getCast(widget.firstSnapshot.data[widget.index]['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                              bottomLeft: Radius.circular(50)),
                          child: CachedNetworkImage(
                            errorWidget: (context, string, d) =>
                                Icon(Icons.image_not_supported),
                            placeholder: (context, url) => Center(
                              child: Icon(Icons.image_sharp),
                            ),
                            imageUrl:
                                'http://image.tmdb.org/t/p/original${widget.firstSnapshot.data![widget.index]['backdrop_path']}',
                            height: 275,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      Flexible(
                        child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.firstSnapshot.data![widget.index]
                                              ['title'] ??
                                          widget.firstSnapshot
                                                  .data![widget.index]
                                              ['original_name'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Color(0xFF12153D),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 32),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'Release Date: ${widget.firstSnapshot.data![widget.index]['release_date']}',
                                      softWrap: false,
                                      style: const TextStyle(
                                          color: Color(0xFF9A9BB2),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 70,
                                    ),
                                    const Text(
                                      'Plot Summary',
                                      softWrap: false,
                                      style: const TextStyle(
                                          color: Color(0xFF12153D),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 24),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      widget.firstSnapshot.data![widget.index]
                                          ['overview'],
                                      style: const TextStyle(
                                          color: Color(0xFF737599),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 32),
                                child: Text(
                                  'Cast & crew',
                                  overflow: TextOverflow.fade,
                                  style: const TextStyle(
                                      color: Color(0xFF12153D),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24),
                                ),
                              ),
                              CastGrid(snapshot: snapshot)
                            ]),
                      )
                    ],
                  ),
                  RatingCard(
                      snapshot: widget.firstSnapshot, index: widget.index),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
