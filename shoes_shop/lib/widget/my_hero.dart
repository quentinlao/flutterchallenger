import 'package:flutter/material.dart';

class MyHero extends StatelessWidget {
  final String url;
  final String path;
  final ImageProvider provider;

  final BoxFit fit;

  const MyHero(
      {Key key, this.url, this.path, this.fit = BoxFit.cover, this.provider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (provider != null) {
      return Hero(
          tag: provider,
          child: Image(
            image: provider,
            fit: fit,
          ));
    } else {
      return Hero(
        tag: path ?? url,
        child: (path == null)
            ? Image.network(
          url,
          fit: fit,
        )
            : Image.asset(
          path,
          fit: fit,
        ),
      );
    }
  }
}
