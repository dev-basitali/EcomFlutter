import 'package:flutter/material.dart';
import 'package:store_app/Common/Utils/AppFontSizes.dart';

import 'appFontWeights.dart';
import 'app_colors.dart';

class AppStyling {
  static TextStyle appBarTitleStyling = const TextStyle(
    fontSize: AppFontSizes.appBarTitle,
    fontWeight: AppFontWeights.weightNormal,
    color: AppColor.bgColor,
  );
}
