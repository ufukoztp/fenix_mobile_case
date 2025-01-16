import 'package:fenix_mobile_case/common/init/service_locator/service_locator.dart';
import 'package:fenix_mobile_case/common/utils/validators/text_input_validator.dart';
import 'package:fenix_mobile_case/features/movies/presentation/cubit/movies_cubit.dart';
import 'package:fenix_mobile_case/features/movies/presentation/view/movies_view.dart';
import 'package:flutter/cupertino.dart';

mixin MoviesViewMixin on State<MoviesView>{

  Future onSearch(String text)async{
    if(text.minLenghtValidator(length: 2) == null){
      await getServiceLocator<MoviesCubit>().getMovies(text);
   }
  }

}
