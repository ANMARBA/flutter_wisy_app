import 'dart:io';

import 'package:flutter_wisy_app/src/features/photos/domain/entities/photo.dart';

abstract class PhotosRepository {
  Future<List<Photo>> fetchPhotos();
  Future<void> uploadPhoto({required File file});
  Future<void> deletePhoto({
    required String imageID,
    required String imageName,
  });
}
