import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

@freezed
class Photo with _$Photo {
  /// Empty constructor
  const Photo._();

  const factory Photo({
    final String? id,
    required String imageUrl,
    required String description,
  }) = _Photo;
}
