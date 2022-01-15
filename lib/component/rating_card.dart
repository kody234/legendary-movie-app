import 'package:flutter/material.dart';
import 'package:movie_app/ui/reviews_page.dart';
import 'package:provider/provider.dart';

import '../view_layer.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({
    Key? key,
    required this.snapshot,
    required this.index,
  }) : super(key: key);

  final AsyncSnapshot snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    ViewLayer provider = Provider.of<ViewLayer>(context, listen: false);
    return Positioned(
      top: 200,
      height: 109,
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: EdgeInsets.only(left: 20),
        height: 109,
        decoration: BoxDecoration(
          color: provider.containerColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), //color of shadow
              spreadRadius: 1, //spread radius
              blurRadius: 1, // blur radius
              offset: Offset(0, 1), // changes position of shadow
              //first paramerter of offset is left-right
              //second parameter is top to down
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 21),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.star,
                    color: Color(0xFFcea200),
                    size: 45,
                  ),
                  Text(' ${snapshot.data![index]['vote_average']}/10',
                      style: Theme.of(context).textTheme.headline3),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.star_outline_outlined,
                    size: 45,
                  ),
                  Text('Rate This',
                      style: Theme.of(context).textTheme.headline5),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ReviewPage(
                                index: index,
                                movieSnapshot: snapshot,
                              )));
                },
                child: Text('Reviews >',
                    style: Theme.of(context).textTheme.headline5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
