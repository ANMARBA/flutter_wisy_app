import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:flutter_wisy_app/src/features/photos/domain/entities/photo.dart';

/// Used to show a single photo inside a containeer.
class PhotoContainer extends StatelessWidget {
  const PhotoContainer({
    Key? key,
    required this.photo,
    this.onPressed,
  }) : super(key: key);
  final Photo photo;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: CachedNetworkImageProvider(photo.imageUrl),
            fit: BoxFit.cover,
            placeholderErrorBuilder: (_, __, ___) {
              return const SizedBox.shrink();
            },
            imageErrorBuilder: (_, __, ___) {
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
