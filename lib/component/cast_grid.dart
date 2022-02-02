import 'package:flutter/material.dart';
import 'package:movie_app/widgets/circle_avatar.dart';

import '../size_config.dart';

class CastGrid extends StatelessWidget {
  const CastGrid({
    Key? key,
    required this.snapshot,
  }) : super(key: key);
  final AsyncSnapshot<List?> snapshot;

  int length() {
    if (snapshot.data!.length > 9) {
      return 9;
    }
    return snapshot.data!.length;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: length(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 7.3 * SizeConfig.widthMultiplier!,
            crossAxisSpacing: 1.5 * SizeConfig.textMultiplier!),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomcCircleAvatar(
                snapshot: snapshot,
                index: index,
                url:
                    'http://image.tmdb.org/t/p/original${snapshot.data![index]['profile_path']}',
              ),
              Expanded(
                child: Text(
                    snapshot.data![index]['name'] ??
                        snapshot.data![index]['original_name'],
                    overflow: TextOverflow.fade,
                    style: Theme.of(context).textTheme.headline1),
              ),
              Expanded(
                child: Text(snapshot.data![index]['character'],
                    style: Theme.of(context).textTheme.headline1),
              ),
            ],
          );
        });
  }
}
