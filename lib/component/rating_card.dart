import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../size_config.dart';
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
      top: 29.4 * SizeConfig.heightMultiplier!,
      height: 16.02 * SizeConfig.heightMultiplier!,
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: EdgeInsets.only(left: 5 * SizeConfig.widthMultiplier!),
        height: 109,
        decoration: BoxDecoration(
          color: provider.containerColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7.4 * SizeConfig.heightMultiplier!),
              bottomLeft: Radius.circular(7.4 * SizeConfig.heightMultiplier!)),
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
          padding: EdgeInsets.symmetric(
              horizontal: 12.2 * SizeConfig.widthMultiplier!,
              vertical: 3.1 * SizeConfig.heightMultiplier!),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(' ${snapshot.data![index]['vote_average']}/10',
                    style: Theme.of(context).textTheme.headline3),
              ),
              Text('Rate This', style: Theme.of(context).textTheme.headline5),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => ReviewPage(
                  //               index: index,
                  //               movieSnapshot: snapshot,
                  //             )));
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
