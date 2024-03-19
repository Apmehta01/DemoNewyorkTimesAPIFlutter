// ignore_for_file: slash_for_doc_comments, file_names, library_private_types_in_public_api
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demonewyorktimeapi/views/dashboard/screens/BooksScreen.dart';
import 'package:demonewyorktimeapi/views/dashboard/screens/TopStoriesScreen.dart';
import 'package:demonewyorktimeapi/views/widgets/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../resources/AppColors.dart';
import '../../routes/routes_name.dart';
import '../../utils/AppLogs.dart';
import '../../utils/AppStrings.dart';
import '../../utils/AppTypography.dart';
import '../../utils/Constants.dart';
import '../../utils/uiUtils.dart';
import '../widgets/CustomCardGradient.dart';
import '../widgets/CustomDashboardAppBar.dart';
import '../widgets/CustomImage.dart';
import '../widgets/CustomText.dart';
import '../widgets/CustomTextButton.dart';
import '../widgets/GradientText.dart';
import '../widgets/animations/TweenAnimationBuilderWidget.dart';

const String tag = "DashboardSetupScreen";

class DashboardSetupScreen extends ConsumerStatefulWidget {
  const DashboardSetupScreen(
      {super.key, required this.showBackButton, required this.showHomeButton});

  final bool showBackButton;
  final bool showHomeButton;

  @override
  _DashboardSetupScreenState createState() => _DashboardSetupScreenState();
}

class _DashboardSetupScreenState extends ConsumerState<DashboardSetupScreen> {
  PageController controller = PageController();
  int currentPageIndex = 0;
  bool temp = false;
  late double _opacity;

// Declare a GlobalKey
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setDefaultData();
  }

  @override
  void didUpdateWidget(covariant DashboardSetupScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        showExitConfirmationDialog(context);
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: showAppBar(),
        // drawer: showAppDrawer(),
        bottomNavigationBar: showBottomNavigationBar(),
        body: TweenAnimationBuilderWidget<double>(
          begin: 0.0,
          end: _opacity,
          // End value is the opacity value you want to animate to
          duration: const Duration(seconds: 1),
          builder: (context, value, child) {
            return Opacity(
                opacity: value,
                child: Center(
                    child: SafeArea(
                        child: PageView(
                  controller: controller,
                  children: const [
                    Center(child: TopStoriesScreen()),
                    Center(child: BooksScreen()),
                  ],
                ))));
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /**
   * Name: [DashboardSetupScreen] showExitConfirmationDialog()
   * <br> Created By Arpan Mehta on 15-05-24
   * <br> Modified By Arpan Mehta on 15-05-24
   * <br> Purpose: This method will show exit confirmation dialog.
   * @param context BuildContext.
   */
  Future<bool> showExitConfirmationDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => Theme(
            data: ThemeData.light().copyWith(
              // Set the background color of the dialog to transparent
              dialogBackgroundColor: Colors.transparent,
            ),
            child: AlertDialog(
              // Remove the default padding
              contentPadding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: CustomCardGradient(
                color: AppColors.White,
                width: double.infinity,
                elevation: 5.0,
                isGradientBorder: false,
                // Set the card background color here
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      GradientText(
                        gradient: const LinearGradient(
                          colors: [
                            AppColors.gradient_one_primary,
                            AppColors.gradient_two_primary
                          ],
                        ),
                        text: AppStrings.STR_EXIT_TITLE,
                        fontSize: AppTypography.mediumFontSize,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.justify,
                        fontFamily: Constants.APP_FONT,
                      ),
                      Container(
                          margin:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          width: double.infinity,
                          // Match parent width
                          height: 3,
                          // Height as per your dimension
                          alignment: Alignment.bottomCenter,
                          // Align to the bottom
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              // Alignment of the gradient start point
                              end: Alignment.bottomRight,
                              // Alignment of the gradient end point
                              colors: [
                                AppColors.gradient_one_primary,
                                AppColors.gradient_two_primary
                              ], // List of colors in the gradient
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CustomText(
                          text: AppStrings.STR_EXIT_MESSAGE,
                          fontSize: AppTypography.descriptionFontSize,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                          fontFamily: Constants.APP_FONT,
                          color: AppColors.LightGray,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          margin:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CustomTextButton(
                                  text: AppStrings.STR_NO,
                                  backgroundColor: AppColors.color_primary,
                                  textColor: AppColors.White,
                                  fontSize: AppTypography.descriptionFontSize,
                                  borderRadius: Constants.BTN_BORDER_RADIUS,
                                  padding: Constants.BTN_PADDING,
                                  borderColor: AppColors.color_primary,
                                  caps: true,
                                  textAlign: TextAlign.center,
                                  borderWidth: 2.0,
                                  doubleInfinity: true,
                                  width: null,
                                  isGradient: true,
                                  isBorder: false,
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Expanded(
                                flex: 1,
                                child: CustomTextButton(
                                  text: AppStrings.STR_YES,
                                  backgroundColor: AppColors.color_primary,
                                  textColor: AppColors.White,
                                  fontSize: AppTypography.descriptionFontSize,
                                  borderRadius: Constants.BTN_BORDER_RADIUS,
                                  padding: Constants.BTN_PADDING,
                                  borderColor: AppColors.color_primary,
                                  caps: true,
                                  doubleInfinity: true,
                                  width: null,
                                  textAlign: TextAlign.center,
                                  borderWidth: 2.0,
                                  isGradient: true,
                                  isBorder: false,
                                  onPressed: () {
                                    SystemNavigator.pop(animated: true);
                                    // PreferenceManager.clearLoginData();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ) ??
        false;
  }

  /**
   * Name: [DashboardSetupScreen] showLogoutConfirmationDialog()
   * <br> Created By Arpan Mehta on 15-05-24
   * <br> Modified By Arpan Mehta on 15-05-24
   * <br> Purpose: This method will show exit confirmation dialog.
   * @param context BuildContext.
   */
  Future<bool> showLogoutConfirmationDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => Theme(
            data: ThemeData.light().copyWith(
              // Set the background color of the dialog to transparent
              dialogBackgroundColor: Colors.transparent,
            ),
            child: AlertDialog(
              // Remove the default padding
              contentPadding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: CustomCardGradient(
                color: AppColors.White,
                width: double.infinity,
                elevation: 5.0,
                isGradientBorder: false,
                // Set the card background color here
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      GradientText(
                        gradient: const LinearGradient(
                          colors: [
                            AppColors.gradient_one_primary,
                            AppColors.gradient_two_primary
                          ],
                        ),
                        text: AppStrings.STR_LOGOUT,
                        fontSize: AppTypography.mediumFontSize,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.justify,
                        fontFamily: Constants.APP_FONT,
                      ),
                      Container(
                          margin:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          width: double.infinity,
                          // Match parent width
                          height: 3,
                          // Height as per your dimension
                          alignment: Alignment.bottomCenter,
                          // Align to the bottom
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              // Alignment of the gradient start point
                              end: Alignment.bottomRight,
                              // Alignment of the gradient end point
                              colors: [
                                AppColors.gradient_one_primary,
                                AppColors.gradient_two_primary
                              ], // List of colors in the gradient
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CustomText(
                          text: AppStrings.STR_LOGOUT_MESSAGE,
                          fontSize: AppTypography.descriptionFontSize,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                          fontFamily: Constants.APP_FONT,
                          color: AppColors.LightGray,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          margin:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CustomTextButton(
                                  text: AppStrings.STR_NO,
                                  backgroundColor: AppColors.color_primary,
                                  textColor: AppColors.White,
                                  fontSize: AppTypography.descriptionFontSize,
                                  borderRadius: Constants.BTN_BORDER_RADIUS,
                                  padding: Constants.BTN_PADDING,
                                  borderColor: AppColors.color_primary,
                                  caps: true,
                                  textAlign: TextAlign.center,
                                  borderWidth: 2.0,
                                  doubleInfinity: true,
                                  width: null,
                                  isGradient: true,
                                  isBorder: false,
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Expanded(
                                flex: 1,
                                child: CustomTextButton(
                                  text: AppStrings.STR_YES,
                                  backgroundColor: AppColors.color_primary,
                                  textColor: AppColors.White,
                                  fontSize: AppTypography.descriptionFontSize,
                                  borderRadius: Constants.BTN_BORDER_RADIUS,
                                  padding: Constants.BTN_PADDING,
                                  borderColor: AppColors.color_primary,
                                  caps: true,
                                  doubleInfinity: true,
                                  width: null,
                                  textAlign: TextAlign.center,
                                  borderWidth: 2.0,
                                  isGradient: true,
                                  isBorder: false,
                                  onPressed: () {
                                    UiUtils.showCustomLoadingDialog(
                                        context, AppStrings.STR_PLEASE_WAIT);
                                    openSplashScreen(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ) ??
        false;
  }

  void setDefaultData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.addListener(() {
        setState(() {
          currentPageIndex = controller.page?.round() ?? 0;
        });
      });
    });
    Future.delayed(
        const Duration(milliseconds: AppStrings.ANIMATION_TIME_OUT_OPACITY),
        () {
      setState(() {
        temp = !temp;
      });
    });

    startAnimation();
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

  Widget buildNavItem(IconData icon, int itemIndex, int currentIndex) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: currentPageIndex == itemIndex
              ? [
                  AppColors.gradient_one_primary,
                  AppColors.gradient_two_primary
                ] // Selected colors
              : [AppColors.color_accent, AppColors.color_accent],
          // Non-selected colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Icon(
        icon,
        size: 20,
        color: Colors.white,
      ),
    );
  }

  Widget showAppDrawer() {
    return SafeArea(
      child: CustomCardGradient(
        color: AppColors.White,
        width: double.infinity,
        elevation: 5.0,
        isGradientBorder: true,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppColors.color_primary, width: 2.0),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ClipOval(
                          child: CustomImage(
                            imageUrlOrXml:
                                '${Constants.STR_BASE_URL_ASSETS}ic_app_logo.png',
                            width: 90.0,
                            height: 90.0,
                            fit: BoxFit.contain,
                            color: AppColors.color_primary,
                            showPrimaryColor: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                    title: Center(
                      child: CustomText(
                        text: AppStrings.STR_APP_NAME,
                        fontSize: AppTypography.smallDescriptionFontSize,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.center,
                        fontFamily: Constants.APP_FONT,
                        color: AppColors.LightGray,
                      ),
                    ),
                    subtitle: Center(
                      child: CustomText(
                        text: AppStrings.STR_APP_NAME,
                        fontSize: AppTypography.tinyFontSize,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        fontFamily: Constants.APP_FONT,
                        color: AppColors.LightGray,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  size: 20,
                  color: AppColors.LightGray,
                ),
                title: CustomText(
                  text: AppStrings.STR_HOMES,
                  fontSize: AppTypography.smallDescriptionFontSize,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.left,
                  fontFamily: Constants.APP_FONT,
                  color: AppColors.LightGray,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.home_repair_service,
                  size: 20,
                  color: AppColors.LightGray,
                ),
                title: CustomText(
                  text: AppStrings.STR_HOME_MAINTENANCE,
                  fontSize: AppTypography.smallDescriptionFontSize,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.left,
                  fontFamily: Constants.APP_FONT,
                  color: AppColors.LightGray,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  size: 20,
                  color: AppColors.LightGray,
                ),
                title: CustomText(
                  text: AppStrings.STR_SETTINGS,
                  fontSize: AppTypography.smallDescriptionFontSize,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.left,
                  fontFamily: Constants.APP_FONT,
                  color: AppColors.LightGray,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.login_sharp,
                  size: 20,
                  color: AppColors.LightGray,
                ),
                title: CustomText(
                  text: AppStrings.STR_LOGOUT,
                  fontSize: AppTypography.smallDescriptionFontSize,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.left,
                  fontFamily: Constants.APP_FONT,
                  color: AppColors.LightGray,
                ),
                onTap: () {
                  Navigator.pop(context);
                  showLogoutConfirmationDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showBottomNavigationBar() {
    return SafeArea(
      child: CurvedNavigationBar(
        backgroundColor: AppColors.transparent,
        buttonBackgroundColor: AppColors.color_accent,
        color: AppColors.color_accent,
        /* backgroundColor: Colors.transparent,
            color: Colors.transparent,
            buttonBackgroundColor: Colors.transparent,*/
        height: 50,
        index: currentPageIndex,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 20,
            color: AppColors.White,
          ),
          Icon(
            Icons.contact_phone,
            size: 20,
            color: AppColors.White,
          ),
          /*buildNavItem(Icons.home, 0,currentIndex),
              buildNavItem(Icons.camera, 1,currentIndex),
              buildNavItem(Icons.person, 2,currentIndex),*/
        ],
        onTap: (index) {
          // currentIndex = index;
          controller.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
        },
      ),
    );
  }

  showAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: CustomAppBar(
        showBackButton: widget.showBackButton,
        title: getPageTitle(currentPageIndex),
        backgroundColor: AppColors.color_primary,
        textColor: AppColors.White,
        showHomeButton: widget.showHomeButton,
      ),
    );
  }

  String getPageTitle(int index) {
    switch (index) {
      case 0:
        return AppStrings.STR_HOMES;
      case 1:
        return AppStrings.STR_HOMES;
      default:
        return '';
    }
  }

  Future<void> openSplashScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RoutesName.SPLASH_SCREEN, (route) => false);
    });
  }
}
