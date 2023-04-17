import 'package:flutter/material.dart';

class CachedImage extends StatefulWidget {
  const CachedImage({super.key, required this.imagePath});
  final String imagePath;

  @override
  State<CachedImage> createState() => _CachedImageState();
}

class _CachedImageState extends State<CachedImage> {
  late final ImageProvider imageProvider;

  @override
  void initState() {
    imageProvider = AssetImage(widget.imagePath);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(imageProvider, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      image: imageProvider,
      fit: BoxFit.contain,
    );
  }
}
