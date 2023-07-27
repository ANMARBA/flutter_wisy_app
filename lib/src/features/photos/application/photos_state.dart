import 'package:freezed_annotation/freezed_annotation.dart';

part 'photos_state.freezed.dart';

@freezed
class PhotosState with _$PhotosState {
  const PhotosState._();

  const factory PhotosState.initial() = _Initial;

  const factory PhotosState.loading() = _Loading;

  const factory PhotosState.refresh() = _Refresh;
}
