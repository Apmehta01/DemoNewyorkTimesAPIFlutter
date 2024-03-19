// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../resources/AppColors.dart';
import '../../routes/routes_name.dart';
import '../../utils/AppTypography.dart';
import '../../utils/Constants.dart';
import 'CustomImage.dart';
import 'CustomText.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color backgroundColor;
// Add a new parameter for showing/hiding the back button
  final bool showBackButton;
  final bool showHomeButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.blue,
    this.showBackButton = true,
    this.showHomeButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: CustomText(
        text: title,
        color: AppColors.White,
        fontFamily: Constants.APP_FONT,
        fontSize: AppTypography.descriptionFontSize,
        fontWeight: FontWeight.w700,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.transparent, // Set a transparent background
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.gradient_one_primary, AppColors.gradient_two_primary], // Your gradient colors
          ),
        ),
      ),
      centerTitle: true,
      leading: showBackButton ? buildLeading(context) : null, // Show custom back button only if showBackButton is true
      actions: buildActions(context),
    );
  }

  List<Widget> buildActions(BuildContext context) {
    // If showHomeButton is true, return a list containing the IconButton
    if (showHomeButton) {
      return [
        Container(
          margin: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {
              // Navigate to the DASHBOARD_SCREEN when home button is pressed
              Navigator.pushReplacementNamed(context, RoutesName.DASHBOARD_SETUP_SCREEN);
            },
            child: const CustomImage(
              imageUrlOrXml: '${Constants.STR_BASE_URL_ASSETS}ic_home.png',
              width: 24.0,
              height: 24.0,
              fit: BoxFit.contain,
              isFromNetwork: false,
              showPrimaryColor: false,
            ),
          ),
        ),
      ];
    }

    // If showHomeButton is false, return an empty list
    return [];
  }

  Widget buildLeading(BuildContext context) {
    // You can return any custom widget here
    return Container(
      margin: const EdgeInsets.only(left: 15.0),
      child: GestureDetector(
        onTap: () {
          // Handle the back button press here
          Navigator.of(context).pop();
        },
        child: const CustomImage(
          imageUrlOrXml: '${Constants.STR_BASE_URL_ASSETS}ic_back_button.png',
          width: 24.0,
          height: 24.0,
          fit: BoxFit.contain,
          isFromNetwork: false,
          showPrimaryColor: false,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
/*
* CustomScrollView(slivers: [
      SliverAppBar(
        expandedHeight: 200.0,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomText(
            text: title,
            color: AppColors.White,
            fontFamily: Constants.APP_FONT,
            fontSize: AppTypography.mediumFontSize,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          background: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.green],
                // Set your gradient colors here
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
      ),
    ]*/