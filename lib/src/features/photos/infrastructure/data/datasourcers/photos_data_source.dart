import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter_wisy_app/src/features/photos/infrastructure/data/models/photo_dto.dart';

abstract class PhotosDataSource {
  Future<List<PhotoDTO>> fetchPhotos();
  Future<void> uploadPhoto({required File file});
  Future<void> deletePhoto({
    required String imageID,
    required String imageName,
  });
}

/// This is the implementation of our [PhotosDataSource]
class PhotosDataSourceImpl implements PhotosDataSource {
  final instanceStorage = FirebaseStorage.instance;
  final instanceStore = FirebaseFirestore.instance;
  @override
  Future<List<PhotoDTO>> fetchPhotos() async {
    final response = await instanceStore.collection("images").get();

    final photos = response.docs.map<PhotoDTO>((e) {
      final data = e.data();
      return PhotoDTO.fromJson({
        'id': e.id,
        'imageUrl': data['imageUrl'],
        'description': data['description'],
      });
    }).toList();

    return photos;
  }

  @override
  Future<void> uploadPhoto({required File file}) async {
    final String imageName = file.path.split('/').last;
    final reference = instanceStorage.ref().child('images/$imageName');
    final uploadTask = reference.putFile(file);
    final taskSnapshot = await uploadTask;
    String imageUrl = await taskSnapshot.ref.getDownloadURL();

    final data = PhotoDTO(imageUrl: imageUrl, description: imageName);

    await instanceStore.collection("images").add(data.toJson());
  }

  @override
  Future<void> deletePhoto({
    required String imageID,
    required String imageName,
  }) async {
    await instanceStore.collection("images").doc(imageID).delete();
    final desertRef = instanceStorage.ref().child("images/$imageName");
    await desertRef.delete();
  }
}
