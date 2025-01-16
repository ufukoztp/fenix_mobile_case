import 'dart:developer';

import 'package:fenix_mobile_case/common/constants/network/http_client_api_url.dart';
import 'package:fenix_mobile_case/core/base/enum/http_call_type/http_call_type.dart';
import 'package:fenix_mobile_case/core/base/model/base_result.dart';
import 'package:fenix_mobile_case/core/network/manager/network_client.dart';
import 'package:fenix_mobile_case/features/movies/data/model/movie_list/movie_list_model.dart';
import 'package:fenix_mobile_case/features/movies/domain/services/i_movies_service.dart';

class MoviesService implements IMoviesService {
  MoviesService(this._client);

  NetworkClient _client;

  @override
  Future<Result<MovieListModel,AppException>>getMovies({String? searchText}) async {
    return await _client.call(
      queryParameters: {
        "query":searchText
      },
        path: HttpClientEndPoints.Movies.URL,
        callType: HttpCallType.GET,
        mapper: (json) {
        return MovieListModel.fromJson(json);
        });
  }
}
