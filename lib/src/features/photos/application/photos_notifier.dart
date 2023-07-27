import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_wisy_app/src/features/photos/application/photos_state.dart';
import 'package:flutter_wisy_app/src/features/photos/domain/repositories/photos_repository.dart';

class PhotosNotifier extends StateNotifier<PhotosState> {
  PhotosNotifier(this._photosRepository) : super(const PhotosState.initial());

  final PhotosRepository _photosRepository;

  Future<void> uploadPhoto({required File file}) async {
    state = const PhotosState.loading();
    await _photosRepository.uploadPhoto(file: file);
    state = const PhotosState.refresh();
  }

  Future<void> deletePhoto({
    required String imageID,
    required String imageName,
  }) async {
    state = const PhotosState.loading();
    await _photosRepository.deletePhoto(imageID: imageID, imageName: imageName);
    state = const PhotosState.refresh();
  }
}
