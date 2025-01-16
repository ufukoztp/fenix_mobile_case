part of 'movies_cubit.dart';

@Freezed(equal: false)
class MoviesState with _$MoviesState {
  const factory MoviesState.initial() = _Initial;
  const factory MoviesState.loading() = _Loading;
  const factory MoviesState.success(MovieListModel movies) = _Success;
  const factory MoviesState.emptyResult() = _EmptyResult;
  const factory MoviesState.error(String excp) = _Error;
}
