import 'package:flutter/material.dart';
import 'package:movie_app/widgets/circle_avatar.dart';

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
            crossAxisCount: 3, mainAxisSpacing: 30, crossAxisSpacing: 10),
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
                  style: const TextStyle(
                      color: Color(0xFF12153D),
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
              Expanded(
                child: Text(
                  snapshot.data![index]['character'],
                  style: const TextStyle(
                      color: Color(0xFF12153D),
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
            ],
          );
        });
  }
}
