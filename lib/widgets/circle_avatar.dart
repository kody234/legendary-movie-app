import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

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
        height: 10.3 * SizeConfig.heightMultiplier!,
        width: 17.1 * SizeConfig.widthMultiplier!,
        imageUrl: url,
        errorWidget: (context, string, d) => Container(
            height: 14.7 * SizeConfig.heightMultiplier!,
            width: 24.3 * SizeConfig.widthMultiplier!,
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
