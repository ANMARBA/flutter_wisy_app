import 'package:go_router/go_router.dart';

import 'package:flutter_wisy_app/src/features/camera/camera_page.dart';
import 'package:flutter_wisy_app/src/features/not_found/not_found_page.dart';
import 'package:flutter_wisy_app/src/features/photos/presentation/photo_preview.dart';
import 'package:flutter_wisy_app/src/features/photos/presentation/photos_list_page.dart';

enum AppRoute {
  home,
  camera,
  photoPreview,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (_, __) => const PhotosListPage(),
      routes: [
        GoRoute(
          path: 'camera',
          name: AppRoute.camera.name,
          builder: (_, __) => const CameraPage(),
        ),
        GoRoute(
          path: 'photoPreview',
          name: AppRoute.photoPreview.name,
          builder: (_, state) {
            final imageUrl = state.queryParams['imageUrl']!;
            final imageType = state.queryParams['imageType']!;
            String? imageID = state.queryParams['imageID'];
            String? imageName = state.queryParams['imageName'];
            return PhotoPreview(
              imageUrl: imageUrl,
              imageType: imageType,
              imageID: imageID,
              imageName: imageName,
            );
          },
        ),
      ],
    ),
  ],
  errorBuilder: (_, __) => const NotFoundPage(),
);
