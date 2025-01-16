import 'package:fenix_mobile_case/common/constants/network/http_client_api_url.dart';
import 'package:fenix_mobile_case/common/constants/theme/app_themes.dart';
import 'package:fenix_mobile_case/common/utils/colors/app_light_colors.dart';
import 'package:fenix_mobile_case/common/widgets/extended_image/data/enum/extended_image_type.dart';
import 'package:fenix_mobile_case/common/widgets/extended_image/extended_image.dart';
import 'package:fenix_mobile_case/core/extensions/sized_box/sized_box_extension.dart';
import 'package:fenix_mobile_case/features/movies/data/model/movie_list/movie_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie
  });
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180.sp,
          decoration: BoxDecoration(
              color: AppLightColors.dark900,
              borderRadius: BorderRadius.circular(10)
          ),
          child: AppExtendedImage(imageTypeEnum: ExtendedImageType.Network,
          imageUrl: HttpClientEndPoints.MovieImage.URL.replaceAll("{post_path}", movie.posterPath??""),
          ),
        ),
        5.sbxh,
        Text(movie.title??"")
      ],
    );
  }
}
