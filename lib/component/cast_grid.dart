import 'package:flutter/material.dart';

class CastGrid extends StatelessWidget {
  const CastGrid({
    Key? key,
    required this.snapshot,
  }) : super(key: key);
  final AsyncSnapshot<List?> snapshot;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: snapshot.data!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 30, crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    'http://image.tmdb.org/t/p/original${snapshot.data![index]['profile_path']}'),
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
              SizedBox(
                height: 10,
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
