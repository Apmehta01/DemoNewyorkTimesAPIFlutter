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

final String tag = "TopStoriesScreenOnly";

class TopStoriesScreenOnly extends ConsumerStatefulWidget {
  const TopStoriesScreenOnly({super.key});

  @override
  TopStoriesScreenOnlyState createState() => TopStoriesScreenOnlyState();
}

class TopStoriesScreenOnlyState extends ConsumerState<TopStoriesScreenOnly> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      performTopStoriesAPICall();
    });
  }

  @override
  Widget build(BuildContext context) {
    final topStoriesData = ref.watch(topStoriesDataProvider);
    // Check if merchantDataProvider has data
    if (topStoriesData.topStoriesData != null) {
      final response = topStoriesData.topStoriesData!;
      // Check if response contains the 'Program' key and it is not null
      if (response.results != null && response.results!.isNotEmpty) {
        List<Results> topStoriesList = response.results!;
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              AppStrings.STR_NEWS,
              style: TextStyle(
                color: AppColors.White,
                fontFamily: Constants.APP_FONT,
                fontSize: AppTypography.descriptionFontSize,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.transparent,
            // Set a transparent background
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.gradient_one_primary,
                    AppColors.gradient_two_primary
                  ], // Your gradient colors
                ),
              ),
            ),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: topStoriesList.length,
            itemBuilder: (BuildContext context, int index) {
              String hintImage = topStoriesList[index].multimedia![0].url ??
                  '${Constants.STR_BASE_URL_ASSETS}ic_no_internet.png';

              return Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                child: Card(
                  color: AppColors.White,
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          hintImage,
                          width: double.infinity,
                          height: 220.0,
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                            return Image.asset(
                              '${Constants.STR_BASE_URL_ASSETS}ic_no_internet.png',
                              width: double.infinity,
                              height: 220.0,
                              fit: BoxFit.contain,
                              color: AppColors.color_primary,
                            ); // Replace YourErrorWidget with your custom error widget
                          },
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          topStoriesList[index].title.toString(),
                          style: TextStyle(
                              color: AppColors.primary,
                              fontSize: AppTypography.smallDescriptionFontSize,
                              fontWeight: FontWeight.w600,
                              fontFamily: Constants.APP_FONT),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          topStoriesList[index].title.toString(),
                          style: TextStyle(
                            color: AppColors.primary,
                            fontFamily: Constants.APP_FONT,
                            fontSize: AppTypography.smallDescriptionFontSize,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign
                              .start, // Use the provided textAlign property
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          topStoriesList[index].abstract.toString(),
                          style: TextStyle(
                            color: AppColors.md_blue_grey_700,
                            fontSize: AppTypography.tinyFontSize,
                            fontWeight: FontWeight.w500,
                            fontFamily: Constants.APP_FONT,
                          ),
                          textAlign: TextAlign
                              .start, // Use the provided textAlign property
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          Utils.formatDateAndTime(
                              topStoriesList[index].publishedDate.toString()),
                          style: TextStyle(
                            color: AppColors.md_blue_grey_700,
                            fontSize: AppTypography.smallDescriptionFontSize,
                            fontWeight: FontWeight.w700,
                            fontFamily: Constants.APP_FONT,
                          ),
                          textAlign: TextAlign
                              .start, // Use the provided textAlign property
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      } else {
        return Scaffold(
          body: Center(
            child: Text(
              AppStrings.STR_NO_DATA_AVAILABLE,
              style: TextStyle(
                fontFamily: Constants.APP_FONT,
                fontSize: AppTypography.titleFontSize,
                fontWeight: FontWeight.bold,
              ),
              textAlign:
                  TextAlign.center, // Use the provided textAlign property
            ),
          ),
        );
      }
    } else {
      return Scaffold(
        body: Center(
          child: Text(
            AppStrings.STR_NO_DATA_AVAILABLE,
            style: TextStyle(
              fontFamily: Constants.APP_FONT,
              fontSize: AppTypography.titleFontSize,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center, // Use the provided textAlign property
          ),
        ),
      );
    }
  }

  Future<void> performTopStoriesAPICall() async {
    final commonRequest = CommonRequest(apiKey: Constants.API_KEY);
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
            UiUtils.flushBarSuccess(
                AppStrings.DATA_FETCH_SUCCESSFULLY, context);
          } else {
            Navigator.of(context).pop();
            UiUtils.flushBarError(AppStrings.DATA_FETCH_ERROR, context);
            AppLogs.logMessage(
                tag, 'Error:>>>>>>', AppStrings.DATA_FETCH_ERROR);
          }
        } else {
          AppLogs.logMessage(
              tag, 'DATA NULL:>>>>>>>', AppStrings.DATA_FETCH_ERROR);
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
