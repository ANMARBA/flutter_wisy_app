import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_wisy_app/src/features/photos/presentation/photos_grid.dart';
import 'package:flutter_wisy_app/src/routing/app_router.dart';

class PhotosListPage extends StatelessWidget {
  const PhotosListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisy App'),
        forceMaterialTransparency: true,
      ),
      body: const PhotosGrid(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(AppRoute.camera.name),
        child: const Icon(Icons.camera, size: 30),
      ),
    );
  }
}
