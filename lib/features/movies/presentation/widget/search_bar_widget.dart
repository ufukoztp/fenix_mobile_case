
import 'package:fenix_mobile_case/common/constants/theme/app_themes.dart';
import 'package:fenix_mobile_case/common/utils/colors/app_light_colors.dart';
import 'package:fenix_mobile_case/common/utils/validators/text_input_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    this.onChanged
  });
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.sp,
      decoration: BoxDecoration(
          color: AppLightColors.dark900,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          validator: (value)=>value?.minLenghtValidator(length: 2),
          onChanged: onChanged,
          decoration:  const InputDecoration(
          hintText: "Film Ara",
          border: InputBorder.none,
        ),
          style: AppThemes.textTheme.small.medium,
        ),
      ),
    );
  }
}
