import 'dart:io';

import 'package:flutter_wisy_app/src/features/photos/domain/entities/photo.dart';
import 'package:flutter_wisy_app/src/features/photos/domain/repositories/photos_repository.dart';
import 'package:flutter_wisy_app/src/features/photos/infrastructure/data/datasourcers/photos_data_source.dart';
import 'package:flutter_wisy_app/src/features/photos/infrastructure/mapper/mapper_domain.dart';

/// This is the implementation of our [PhotosRepository]
class PhotosRepositoryImpl implements PhotosRepository {
  const PhotosRepositoryImpl(this._photosDataSource);

  final PhotosDataSource _photosDataSource;

  @override
  Future<List<Photo>> fetchPhotos() async {
    final response = await _photosDataSource.fetchPhotos();
    return response.toDomain();
  }

  @override
  Future<void> uploadPhoto({required File file}) async {
    await _photosDataSource.uploadPhoto(file: file);
  }

  @override
  Future<void> deletePhoto({
    required String imageID,
    required String imageName,
  }) async {
    await _photosDataSource.deletePhoto(imageID: imageID, imageName: imageName);
  }
}
