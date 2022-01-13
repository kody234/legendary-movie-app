import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomcCircleAvatar extends StatelessWidget {
  const CustomcCircleAvatar({
    Key? key,
    required this.snapshot,
    required this.index,
    required this.url,
  }) : super(key: key);

  final AsyncSnapshot snapshot;
  final int index;
  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(300),
      child: CachedNetworkImage(
        height: 70,
        width: 70,
        imageUrl: url,
        errorWidget: (context, string, d) => Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Icon(Icons.person)),
        placeholder: (context, url) => Center(
          child: Icon(Icons.person),
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
