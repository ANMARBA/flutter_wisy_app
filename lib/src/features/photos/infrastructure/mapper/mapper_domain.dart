import 'package:flutter_wisy_app/src/features/photos/domain/entities/photo.dart';
import 'package:flutter_wisy_app/src/features/photos/infrastructure/data/models/photo_dto.dart';

/// Mapper to handle conversion between DTO List and Entities List
extension MapperListPhotoDTO on List<PhotoDTO> {
  /// List of DTO to List of Entity
  List<Photo> toDomain() => map((item) => item.toDomain()).toList();
}

/// Mapper to handle conversion between DTO and Entities
extension MapperPhotoDTO on PhotoDTO {
  /// DTO to Entity
  Photo toDomain() => Photo(
        id: id,
        description: description,
        imageUrl: imageUrl,
      );
}
