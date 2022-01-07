import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/component/cast_grid.dart';
import 'package:movie_app/component/rating_card.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({
    Key? key,
    required this.firstSnapshot,
    required this.index,
  }) : super(key: key);

  final AsyncSnapshot firstSnapshot;
  final int index;

  Future<List?> getCast(int movieId) async {
    http.Response apiResponse = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=79ce9c64e2645e9baff2e363b9869940&language=en-US'));
    try {
      if (apiResponse.statusCode == 200) {
        var response = apiResponse.body;
        var body = jsonDecode(response);
        print('Cast $body');
        return body['cast'];
      }
    } catch (e) {
      print('Exception $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<List?>(
          future: getCast(firstSnapshot.data[index]['id']),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(50)),
                        child: Image(
                          image: NetworkImage(
                              'http://image.tmdb.org/t/p/original${firstSnapshot.data![index]['backdrop_path']}'),
                        ),
                      ),
                      SizedBox(
                        height: 60,
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
                                      firstSnapshot.data![index]['title'] ??
                                          firstSnapshot.data![index]
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
                                      'Release Date: ${firstSnapshot.data![index]['release_date']}',
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
                                      firstSnapshot.data![index]['overview'],
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
                  RatingCard(snapshot: firstSnapshot, index: index),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
