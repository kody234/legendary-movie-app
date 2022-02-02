import 'package:flutter/material.dart';
import 'package:movie_app/size_config.dart';
import 'package:provider/provider.dart';

import '../view_layer.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.snapshot,
    required this.index,
  }) : super(key: key);
  final AsyncSnapshot snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    ViewLayer provider = Provider.of<ViewLayer>(context, listen: false);
    return Container(
      height: 29.4 * SizeConfig.heightMultiplier!,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: provider.containerColor,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              width: 21.2 * SizeConfig.widthMultiplier!,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'http://image.tmdb.org/t/p/w185${snapshot.data![index]['poster_path']}'))),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 3.7 * SizeConfig.widthMultiplier!,
                  vertical: 2.2 * SizeConfig.heightMultiplier!),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      snapshot.data![index]['title'] ??
                          snapshot.data![index]['original_name'],
                      style: Theme.of(context).textTheme.headline1)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
