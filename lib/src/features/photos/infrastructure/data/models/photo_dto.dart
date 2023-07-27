import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_dto.freezed.dart';
part 'photo_dto.g.dart';

@freezed
class PhotoDTO with _$PhotoDTO {
  const factory PhotoDTO({
    String? id,
    required String imageUrl,
    required String description,
  }) = _PhotoDTO;

  factory PhotoDTO.fromJson(Map<String, dynamic> json) =>
      _$PhotoDTOFromJson(json);
}
