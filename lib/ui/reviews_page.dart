import 'package:flutter/material.dart';
import 'package:movie_app/data/api_service.dart';
import 'package:movie_app/widgets/circle_avatar.dart';
import 'package:provider/provider.dart';

import '../view_layer.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key, required this.movieSnapshot, required this.index})
      : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();

  final AsyncSnapshot movieSnapshot;
  final int index;
}

class _ReviewPageState extends State<ReviewPage> {
  Future<List?>? future = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    future = ApiService()
        .getMovieReviews(widget.movieSnapshot.data[widget.index]['id']);
  }

  @override
  Widget build(BuildContext context) {
    ViewLayer provider = Provider.of<ViewLayer>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List?>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: provider.containerColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.5), //color of shadow
                                    spreadRadius: 1, //spread radius
                                    blurRadius: 1, // blur radius
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                    //first paramerter of offset is left-right
                                    //second parameter is top to down
                                  ),
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.5), //color of shadow
                                    spreadRadius: 1, //spread radius
                                    blurRadius: 1, // blur radius
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                    //first paramerter of offset is left-right
                                    //second parameter is top to down
                                  )
                                ],
                              ),
                              child: Wrap(
                                direction: Axis.horizontal,
                                children: [
                                  CustomcCircleAvatar(
                                    index: index,
                                    snapshot: snapshot,
                                    url:
                                        'http://image.tmdb.org/t/p/original${snapshot.data![index]['author_details']['avatar_path']}',
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'A review by ${snapshot.data![index]['author']}',
                                          softWrap: true,
                                          overflow: TextOverflow.fade,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(snapshot.data![index]['content'],
                                          softWrap: true,
                                          overflow: TextOverflow.clip,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1),
                                    ],
                                  )
                                ],
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
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
