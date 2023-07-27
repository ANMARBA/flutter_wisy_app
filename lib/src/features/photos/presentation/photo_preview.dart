import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';

import 'package:flutter_wisy_app/src/features/photos/application/providers.dart';
import 'package:flutter_wisy_app/src/routing/app_router.dart';

enum TypeImagePreview { imageUrl, imageFile }

class PhotoPreview extends ConsumerWidget {
  const PhotoPreview({
    Key? key,
    required this.imageUrl,
    required this.imageType,
    this.imageID,
    this.imageName,
  }) : super(key: key);
  final String imageUrl;
  final String imageType;
  final String? imageID;
  final String? imageName;

  void goToHome(BuildContext context) {
    Navigator.of(context).popUntil(
      (route) => route.settings.name == AppRoute.home.name,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent.withOpacity(0.6),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _customIcon(onTap: () => context.pop(), icon: Icons.clear),
            if (imageType == TypeImagePreview.imageFile.name)
              _customIcon(
                onTap: () async {
                  await ref
                      .read(photosNotifierProvider.notifier)
                      .uploadPhoto(file: File(imageUrl));
                  if (context.mounted) {
                    goToHome(context);
                  }
                },
                icon: Icons.file_upload_outlined,
              )
            else
              _customIcon(
                  onTap: () async {
                    await ref
                        .read(photosNotifierProvider.notifier)
                        .deletePhoto(imageID: imageID!, imageName: imageName!);
                    if (context.mounted) {
                      goToHome(context);
                    }
                  },
                  icon: Icons.delete),
          ],
        ),
      ),
      body: _photoView(
        imageProvider: imageType == TypeImagePreview.imageUrl.name
            ? NetworkImage(imageUrl)
            : FileImage(File(imageUrl)),
      ),
    );
  }

  Widget _photoView({required imageProvider}) {
    return PhotoView(imageProvider: imageProvider);
  }

  Widget _customIcon({
    required IconData icon,
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent.withOpacity(0.3),
        ),
        child: Icon(icon),
      ),
    );
  }
}
