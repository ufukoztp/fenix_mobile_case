import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fenix_mobile_case/core/base/model/base_result.dart';
import 'package:fenix_mobile_case/features/movies/data/model/movie_list/movie_list_model.dart';
import 'package:fenix_mobile_case/features/movies/domain/repository/i_movies_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_state.dart';
part 'movies_cubit.freezed.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this._moviesRepository) : super(const MoviesState.initial());
  IMoviesRepository _moviesRepository;


  Future getMovies(String searchedText)async{
    emit(const MoviesState.loading());
   final result = await _moviesRepository.getMovies(searchText: searchedText);

   final value = switch (result) {
     Success(value: MovieListModel result) => {
       if(result.results?.length ==0){
         emit(const MoviesState.emptyResult())
       }else{
         emit(MoviesState.success(result))
       }

     },
     Failure(exception: final exception) => {
       emit(MoviesState.error(exception.exceptionType.name))
     },
   };

  }
}
