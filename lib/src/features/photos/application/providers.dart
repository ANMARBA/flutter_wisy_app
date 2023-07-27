import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_wisy_app/src/features/photos/application/photos_notifier.dart';
import 'package:flutter_wisy_app/src/features/photos/application/photos_state.dart';
import 'package:flutter_wisy_app/src/features/photos/domain/entities/photo.dart';
import 'package:flutter_wisy_app/src/features/photos/domain/repositories/photos_repository.dart';
import 'package:flutter_wisy_app/src/features/photos/infrastructure/data/datasourcers/photos_data_source.dart';
import 'package:flutter_wisy_app/src/features/photos/infrastructure/data/repositories/photos_repository_impl.dart';

final photosDataSourceProvider =
    Provider<PhotosDataSource>((_) => PhotosDataSourceImpl());

final photosRepositoryProvider = Provider<PhotosRepository>(
    (ref) => PhotosRepositoryImpl(ref.watch(photosDataSourceProvider)));

final photosFutureProvider = FutureProvider.autoDispose<List<Photo>>((ref) {
  final photosRepository = ref.watch(photosRepositoryProvider);
  return photosRepository.fetchPhotos();
});

final photosNotifierProvider =
    StateNotifierProvider<PhotosNotifier, PhotosState>(
  (ref) => PhotosNotifier(ref.watch(photosRepositoryProvider)),
);
