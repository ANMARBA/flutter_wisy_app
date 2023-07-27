import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_wisy_app/src/common_widgets/async_value_widget.dart';
import 'package:flutter_wisy_app/src/features/photos/application/providers.dart';
import 'package:flutter_wisy_app/src/features/photos/domain/entities/photo.dart';
import 'package:flutter_wisy_app/src/features/photos/presentation/photo_container.dart';
import 'package:flutter_wisy_app/src/localization/string_hardcoded.dart';
import 'package:flutter_wisy_app/src/routing/app_router.dart';

import 'photo_preview.dart';

/// A widget that displays the list of photos
class PhotosGrid extends ConsumerWidget {
  const PhotosGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(photosNotifierProvider, (_, next) {
      next.maybeWhen(
        orElse: () {},
        refresh: () {
          ref.invalidate(photosFutureProvider);
        },
      );
    });
    final photoListValue = ref.watch(photosFutureProvider);
    return AsyncValueWidget<List<Photo>>(
      data: (photos) => photos.isEmpty
          ? Center(
              child: Text(
                'No photos found'.hardcoded,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            )
          : PhotosLayoutGrid(
              itemCount: photos.length,
              itemBuilder: (_, index) {
                final photo = photos[index];
                return PhotoContainer(
                  photo: photo,
                  onPressed: () {
                    context.pushNamed(
                      AppRoute.photoPreview.name,
                      queryParams: {
                        'imageUrl': photo.imageUrl,
                        'imageID': photo.id,
                        'imageName': photo.description,
                        'imageType': TypeImagePreview.imageUrl.name,
                      },
                    );
                  },
                );
              },
            ),
      asyncValue: photoListValue,
    );
  }
}

class PhotosLayoutGrid extends StatelessWidget {
  const PhotosLayoutGrid({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  /// Total number of items to display.
  final int itemCount;

  /// Function used to build a widget for a given index in the grid.
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 12,
      itemCount: itemCount,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      itemBuilder: (context, i) => itemBuilder(context, i),
      staggeredTileBuilder: (i) {
        return StaggeredTile.count(1, i.isEven ? 1.2 : 1.8);
      },
    );
  }
}
