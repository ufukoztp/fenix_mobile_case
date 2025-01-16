import 'package:fenix_mobile_case/core/base/model/base_result.dart';
import 'package:fenix_mobile_case/features/movies/data/model/movie_list/movie_list_model.dart';
import 'package:fenix_mobile_case/features/movies/domain/repository/i_movies_repository.dart';
import 'package:fenix_mobile_case/features/movies/domain/services/i_movies_service.dart';

class MoviesRepository implements IMoviesRepository{
  MoviesRepository(this._moviesService);
  IMoviesService _moviesService;

  @override
  Future<Result<MovieListModel, AppException>> getMovies({String? searchText}) async {
    final response = await _moviesService.getMovies(searchText: searchText);

   return switch (response) {
      Success(value: MovieListModel result) => Success(result),
      Failure(exception: final AppException exception) => Failure(exception),
    };

  }

}
