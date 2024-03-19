// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, file_names

import 'dart:async';

import 'package:flutter/material.dart';

import '../../resources/AppColors.dart';
import '../../routes/routes.dart';
import '../../routes/routes_name.dart';
import '../../utils/AppStrings.dart';
import '../../utils/AppTypography.dart';
import '../../utils/Constants.dart';
import '../widgets/AnimatedLottieWidget.dart';
import '../widgets/CenteredStackWidget.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/GradientText.dart';
import '../widgets/animations/TweenAnimationBuilderWidget.dart';

const String tag = "SplashScreen";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late double _opacity;

  @override
  void initState() {
    super.initState();
    setDefaultData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(10),
        child: CustomAppBar(
          showBackButton: false,
          showHomeButton: false,
          title: '',
          backgroundColor: AppColors.color_primary,
          textColor: AppColors.White,
        ),
      ),
      body: SafeArea(
        child: CenteredStackWidget(
          child: TweenAnimationBuilderWidget<double>(
            begin: 0.0,
            end:
                _opacity, // End value is the opacity value you want to animate to
            duration: const Duration(seconds: 1),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Column(
                      children: [
                        headerImage(),
                        const SizedBox(height: 30),
                        headerText()
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget headerImage() {
    return const AnimatedLottieWidget(
      animationFile:
          '${Constants.STR_BASE_URL_ASSETS_ANIMATION}ic_app_logo.json',
      width: 300,
      height: 300,
      durationMillis: 5000,
      loop: true,
      fit: BoxFit.contain,
    );
  }

  Widget headerText() {
    return GradientText(
      text: AppStrings.STR_APP_NAME,
      gradient: const LinearGradient(
        colors: [
          AppColors.gradient_one_primary,
          AppColors.gradient_two_primary
        ],
      ),
      fontSize: AppTypography.headerFontSize,
      fontWeight: FontWeight.bold,
      textAlign: TextAlign.center,
      fontFamily: Constants.APP_FONT,
    );
  }

  void setDefaultData() {
    startAnimation();

    // Add a delay of 3 seconds before navigating to the intro screen
    Timer(const Duration(seconds: 5), () async {
      Navigator.of(context).pushReplacement(
        Routes.generateRoute(
          const RouteSettings(name: RoutesName.DASHBOARD_SETUP_SCREEN),
        ),
      );
    });
  }

  void startAnimation() {
    _opacity = 0.0; // Initial opacity value
    // Start the animation after the widget has been built
    Future.delayed(const Duration(milliseconds: AppStrings.ANIMATION_TIME_OUT),
        () {
      setState(() {
        _opacity = 1.0; // Set opacity to 1 to animate the widget's appearance
      });
    });
  }
}
/*CustomGifImage(
        gifAssetPath: '${Constants.STR_BASE_URL_ASSETS}ic_animated_app_logo.gif',
    width: 150.w,height: 150.h,fit: BoxFit.cover,);*/
