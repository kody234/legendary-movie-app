import 'package:flutter/material.dart';
import 'package:movie_app/component/rating_card.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({
    Key? key,
    required this.snapshot,
    required this.index,
  }) : super(key: key);

  final AsyncSnapshot snapshot;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50)),
                child: Image(
                  image: NetworkImage(
                      'http://image.tmdb.org/t/p/original${snapshot.data![index]['backdrop_path']}'),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data![index]['title'] ??
                              snapshot.data![index]['original_name'],
                          style: const TextStyle(
                              color: Color(0xFF12153D),
                              fontWeight: FontWeight.w800,
                              fontSize: 32),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Release Date: ${snapshot.data![index]['release_date']}',
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
                          snapshot.data![index]['overview'],
                          style: const TextStyle(
                              color: Color(0xFF737599),
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          RatingCard(snapshot: snapshot, index: index),
        ],
      ),
    );
  }
}
