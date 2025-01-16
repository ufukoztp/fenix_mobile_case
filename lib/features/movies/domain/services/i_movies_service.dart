import 'package:fenix_mobile_case/core/base/model/base_result.dart';
import 'package:fenix_mobile_case/features/movies/data/model/movie_list/movie_list_model.dart';

abstract class IMoviesService{
  Future<Result<MovieListModel,AppException>>getMovies({String? searchText = ""});
}
