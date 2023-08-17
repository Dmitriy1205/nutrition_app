part of 'cache_bloc.dart';

@freezed
class CacheEvent with _$CacheEvent {
  const factory CacheEvent.read() = _ReadEvent;
  const factory CacheEvent.write({
    required String name,
    required String image,
    required String recipeBody,
  }) = _WriteEvent;
}
