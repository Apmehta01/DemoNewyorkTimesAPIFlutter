import 'package:demonewyorktimeapi/routes/routes_name.dart';
import 'package:demonewyorktimeapi/views/dashboard/TopStoriesScreenOnly.dart';
import 'package:flutter/material.dart';

import '../resources/AppColors.dart';
import '../utils/AppStrings.dart';
import '../utils/AppTypography.dart';
import '../utils/Constants.dart';
import '../utils/CustomPageRoute.dart';
import '../views/dashboard/DashboardSetupScreen.dart';
import '../views/splash/SplashScreen.dart';

const String tag = "Routes";

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.SPLASH_SCREEN:
        return CustomPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );
      case RoutesName.DASHBOARD_SETUP_SCREEN:
        return CustomPageRoute(
            builder: (BuildContext context) => const DashboardSetupScreen(
                showBackButton: false, showHomeButton: false));
      case RoutesName.TOP_STORIES_SCREEN_ONLY:
        return CustomPageRoute(
            builder: (BuildContext context) => const TopStoriesScreenOnly());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Container(
                margin: const EdgeInsets.only(
                    left: Constants.BTN_PADDING, right: Constants.BTN_PADDING),
                child: Card(
                  color: AppColors.White,
                  elevation: 5.0,
                  child: Text(
                    AppStrings.NO_SCREEN_FOUND, style: TextStyle(
                    color: AppColors.color_primary,
                    fontFamily: Constants.APP_FONT,
                    fontSize: AppTypography.titleFontSize,
                    fontWeight: FontWeight.w600,),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        });
    }
  }
}
