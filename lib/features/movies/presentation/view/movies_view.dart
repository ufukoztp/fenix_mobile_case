
import 'package:fenix_mobile_case/common/init/service_locator/service_locator.dart';
import 'package:fenix_mobile_case/common/init/service_locator/service_locator_provider.dart';
import 'package:fenix_mobile_case/common/utils/colors/app_light_colors.dart';
import 'package:fenix_mobile_case/common/utils/validators/text_input_validator.dart';
import 'package:fenix_mobile_case/features/movies/data/model/movie_list/movie_list_model.dart';
import 'package:fenix_mobile_case/features/movies/presentation/cubit/movies_cubit.dart';
import 'package:fenix_mobile_case/features/movies/presentation/mixin/movies_mixin.dart';
import 'package:fenix_mobile_case/features/movies/presentation/widget/movie_card_widget.dart';
import 'package:fenix_mobile_case/features/movies/presentation/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({super.key});

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> with MoviesViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      leading: const Icon(Icons.movie,color: AppLightColors.primaryWhite,),
      title:  AppSearchBar(
        onChanged:onSearch
      ),
      actions:  const [
        Icon(Icons.search,color: AppLightColors.primaryWhite,)
      ],
    );
  }

  BlocBuilder<MoviesCubit, MoviesState> get _buildBody {
    return BlocBuilder<MoviesCubit,MoviesState>(
        builder: (context,state) {
          return state.maybeMap(
              orElse: ()=>const Center(child: Text("Henüz bir film aramadınız."),),
              success: (movieList)=>_buildMasonryGridView(movieList.movies),
              emptyResult: (e)=>const Center(child: Text("Sonuç bulunamadı"),)
          );
        }
    );
  }

  MasonryGridView _buildMasonryGridView(MovieListModel movies) {
    return MasonryGridView.builder(
       shrinkWrap: true,
      mainAxisSpacing: 10,
      crossAxisSpacing:15,
      itemCount: movies.results?.length,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return MovieCard(movie: movies.results![index],);
      },);
  }

}


