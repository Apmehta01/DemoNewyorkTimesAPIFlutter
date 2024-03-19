import 'dart:convert';
import 'package:demonewyorktimeapi/web/model/request/CommonRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../resources/AppColors.dart';
import '../../../riverpod/providers/DashboardProviders.dart';
import '../../../utils/AppLogs.dart';
import '../../../utils/AppStrings.dart';
import '../../../utils/AppTypography.dart';
import '../../../utils/Constants.dart';
import '../../../utils/Utils.dart';
import '../../../utils/uiUtils.dart';
import '../../../web/model/base/status.dart';
import '../../../web/model/response/topstories/TopStoriesData.dart';
import '../../widgets/CustomCardGradient.dart';
import '../../widgets/CustomImage.dart';
import '../../widgets/CustomText.dart';
import '../../widgets/GradientText.dart';
import '../../widgets/animations/TweenAnimationBuilderWidget.dart';

final String tag = "TopStoriesScreen";

class TopStoriesScreen extends ConsumerStatefulWidget {
  const TopStoriesScreen({super.key});

  @override
  _TopStoriesScreenState createState() => _TopStoriesScreenState();
}

class _TopStoriesScreenState extends ConsumerState<TopStoriesScreen> {
  late double _opacity;

  @override
  void initState() {
      super.initState();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        performTopStoriesAPICall();
      });
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    final topStoriesData = ref.watch(topStoriesDataProvider);
    // Check if merchantDataProvider has data
    if (topStoriesData.topStoriesData != null) {
      final response = topStoriesData.topStoriesData!;
      // Check if response contains the 'Program' key and it is not null
      if (response.results != null &&
          response.results!.isNotEmpty) {

        List<Results> topStoriesList = response.results!;
        return Scaffold(
          body: TweenAnimationBuilderWidget<double>(
              begin: 0.0,
              end: _opacity,
              // End value is the opacity value you want to animate to
              duration: const Duration(seconds: 1),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: ListView.builder(
                    itemCount: topStoriesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      String hintImage = topStoriesList[index].multimedia![0].url??
                          '${Constants.STR_BASE_URL_ASSETS}ic_no_internet.png';

                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                        child: CustomCardGradient(
                          color: AppColors.White,
                          elevation: 5.0,
                          isGradientBorder: true,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomImage(
                                  imageUrlOrXml: hintImage,
                                  width: double.infinity,
                                  height: 220.0,
                                  fit: BoxFit.contain,
                                  isFromNetwork: true,
                                  color: AppColors.color_primary,
                                  showPrimaryColor: false,
                                ),
                                const SizedBox(height: 10.0),
                                CustomText(
                                  text: topStoriesList[index].title.toString(),
                                  color: AppColors.primary,
                                  fontSize: AppTypography.smallDescriptionFontSize,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.start,
                                  fontFamily: Constants.APP_FONT,
                                ),
                                const SizedBox(height: 10.0),
                                CustomText(
                                  text: topStoriesList[index].abstract.toString(),
                                  color: AppColors.md_blue_grey_700,
                                  fontSize: AppTypography.tinyFontSize,
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.justify,
                                  fontFamily: Constants.APP_FONT,
                                ),
                                const SizedBox(height: 10.0),
                                CustomText(
                                  text: Utils.formatDateAndTime(topStoriesList[index].publishedDate.toString()),
                                  color: AppColors.md_blue_grey_700,
                                  fontSize: AppTypography.smallDescriptionFontSize,
                                  fontWeight: FontWeight.w700,
                                  textAlign: TextAlign.start,
                                  fontFamily: Constants.APP_FONT,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
        );
      } else {
        // If 'Program' key is missing or null in response
        return Scaffold(
          body: TweenAnimationBuilderWidget<double>(
              begin: 0.0,
              end: _opacity,
              // End value is the opacity value you want to animate to
              duration: const Duration(seconds: 1),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Center(
                    child: GradientText(
                      text: AppStrings.STR_NO_DATA_AVAILABLE,
                      fontFamily: Constants.APP_FONT,
                      fontSize: AppTypography.titleFontSize,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.gradient_one_accent,
                          AppColors.gradient_two_accent
                        ],
                      ),
                    ),
                  ),
                );
              }),
        );
      }
    } else {
      return Scaffold(
        body: TweenAnimationBuilderWidget<double>(
            begin: 0.0,
            end: _opacity,
            // End value is the opacity value you want to animate to
            duration: const Duration(seconds: 1),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Center(
                  child: GradientText(
                    text: AppStrings.STR_NO_DATA_AVAILABLE,
                    fontFamily: Constants.APP_FONT,
                    fontSize: AppTypography.titleFontSize,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.gradient_one_accent,
                        AppColors.gradient_two_accent
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
    }
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

  Future<void> performTopStoriesAPICall() async {
    final commonRequest=CommonRequest(apiKey: Constants.API_KEY);
    final responseFuture =

    ref.read(topStoriesApiProvider(commonRequest).future);
    AppLogs.logMessage(tag, 'BODY', 'REQUEST:>>>>>>$commonRequest');

    UiUtils.showCustomLoadingDialog(context, AppStrings.STR_PLEASE_WAIT);

    responseFuture.then((apiResponse) {
      if (apiResponse.status == Status.COMPLETED) {
        // API call was successful, display the actual widget
        final data = apiResponse.data;

        if (data != null) {
          final topStoriesResponse = TopStoriesData.fromJson(data);

          final status = topStoriesResponse.status;
          final responseData = topStoriesResponse.results!;
          int length = responseData.length;
          AppLogs.logMessage(tag, 'Top Stories Response:', '$responseData');
          AppLogs.logMessage(tag, 'Top Stories length:', '$length');

          if (status == "OK") {
            // Pretty print the object using JsonEncoder
            final prettyLoginResponse =
            const JsonEncoder.withIndent('  ').convert(topStoriesResponse);
            AppLogs.logMessage(tag, 'Pretty Printed LoginResponse:>>>>>>>',
                prettyLoginResponse);

            final pdp = ref.read(topStoriesDataProvider);
             pdp.setTopStoriesData(topStoriesResponse.toJson());

            Navigator.of(context).pop();
            UiUtils.flushBarSuccess(AppStrings.DATA_FETCH_SUCCESSFULLY, context);
          } else {
            Navigator.of(context).pop();
            UiUtils.flushBarError(AppStrings.DATA_FETCH_ERROR, context);
            AppLogs.logMessage(tag, 'Error:>>>>>>', AppStrings.DATA_FETCH_ERROR);
          }
        } else {
          AppLogs.logMessage(tag, 'DATA NULL:>>>>>>>', AppStrings.DATA_FETCH_ERROR);
          Navigator.of(context).pop();
        }
      } else if (apiResponse.status == Status.LOADING) {
        UiUtils.showCustomLoadingDialog(context, 'Loading...');
      } else if (apiResponse.status == Status.ERROR) {
        // Handle the error state if needed
        UiUtils.flushBarError(AppStrings.STR_NO_RESPONSE_FROM_SERVER, context);
        Navigator.of(context).pop();
        AppLogs.logMessage(tag, 'Error:>>>>>>', '$apiResponse.message');
        UiUtils.flushBarError(apiResponse.message, context);
      }
    }).catchError((error) {
      // Handle errors thrown during the API call
      Navigator.of(context).pop();
      AppLogs.logMessage(tag, 'Error:>>>>>>', '$error');
    }).whenComplete(() {});
  }
}