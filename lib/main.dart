import 'package:fenix_mobile_case/common/constants/theme/app_themes.dart';
import 'package:fenix_mobile_case/features/movies/presentation/cubit/movies_cubit.dart';
import 'package:fenix_mobile_case/features/movies/presentation/view/movies_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fenix_mobile_case/common/init/service_locator/service_locator.dart' as dependencyInjection;
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  dependencyInjection.initalize();
  runApp(const FenixMobileApp());
}

class FenixMobileApp extends StatelessWidget {
  const FenixMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      ensureScreenSize: true,
      builder: (context,child){
        return  MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: dependencyInjection.getServiceLocator<MoviesCubit>(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Fenix Mobile Case',
            theme: AppThemes.darkTheme,
            home: const MoviesView(),
          ),
        );
      },
    );
  }
}
