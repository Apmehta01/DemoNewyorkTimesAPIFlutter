// ignore_for_file: file_names

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/AppColors.dart';
import '../../routes/routes_name.dart';
import '../../utils/AppTypography.dart';
import '../../utils/Constants.dart';
import 'CustomImage.dart';
import 'CustomText.dart';

class CustomDashboardAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final bool showBackButton;
  final bool showHomeButton;
  final VoidCallback onProfileClicked;
  final VoidCallback onDropdownClicked;
  final VoidCallback onSearchClicked;
  final VoidCallback onNotificationsClicked;

  const CustomDashboardAppBar({
    super.key,
    required this.title,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.blue,
    this.showBackButton = true,
    this.showHomeButton = true,
    required this.onProfileClicked,
    required this.onDropdownClicked,
    required this.onSearchClicked,
    required this.onNotificationsClicked,
  });

  @override
  _CustomDashboardAppBarState createState() => _CustomDashboardAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomDashboardAppBarState extends State<CustomDashboardAppBar> {
  String? selectedValue;
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          showProfile(),
          const SizedBox(
            width: 10.0,
          ),
          buildDropdown(),
          const Spacer(),
          showSearch(),
          const SizedBox(
            width: 10.0,
          ),
          showNotifications(),
        ],
      ),
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.gradient_one_primary,
              AppColors.gradient_two_primary
            ],
          ),
        ),
      ),
      centerTitle: true,
      leading: widget.showBackButton ? buildLeading(context) : null,
      actions: buildActions(context),
    );
  }

  List<Widget> buildActions(BuildContext context) {
    if (widget.showHomeButton) {
      return [
        Container(
          margin: const EdgeInsets.only(right: 15.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, RoutesName.DASHBOARD_SETUP_SCREEN);
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
    return [];
  }

  Widget buildLeading(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15.0),
      child: GestureDetector(
        onTap: () {
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

  Widget showProfile() {
    return GestureDetector(
      onTap: widget.onProfileClicked,
      child: Container(
        margin: const EdgeInsets.only(left: Constants.BTN_PADDING),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ClipOval(
            child: CustomImage(
              imageUrlOrXml: '${Constants.STR_BASE_URL_ASSETS}ic_app_logo.png',
              width: 25.w,
              height: 25.h,
              fit: BoxFit.cover,
              color: AppColors.White,
              showPrimaryColor: false,
            ),
          ),
        ),
      ),
    );
  }

  Widget showSearch() {
    return GestureDetector(
      onTap: widget.onSearchClicked,
      child: Container(
        margin: const EdgeInsets.only(left: 15.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: CustomImage(
              imageUrlOrXml: '${Constants.STR_BASE_URL_ASSETS}ic_search.png',
              width: 25.w,
              height: 25.h,
              fit: BoxFit.contain,
              color: AppColors.White,
              showPrimaryColor: true,
            ),
          ),
        ),
      ),
    );
  }

  Widget showNotifications() {
    return GestureDetector(
      onTap: widget.onNotificationsClicked,
      child: Container(
        margin: const EdgeInsets.only(left: 1.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: CustomImage(
              imageUrlOrXml:
                  '${Constants.STR_BASE_URL_ASSETS}ic_notifications.png',
              width: 25.w,
              height: 25.h,
              fit: BoxFit.contain,
              color: AppColors.White,
              showPrimaryColor: true,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDropdown() {
    final List<String> items = [
      'Al Qasimia',
      'Al Ghuwair',
      'Al Soor',
      'Al Rolla',
    ];
    String? selectedValue;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: CustomText(
            text: items[0],
            fontSize: AppTypography.smallDescriptionFontSize,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.start,
            fontFamily: Constants.APP_FONT,
            color: AppColors.White,
          ),
          items: items
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: CustomText(
                      text: item,
                      fontSize: AppTypography.smallDescriptionFontSize,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                      fontFamily: Constants.APP_FONT,
                      color: AppColors.color_primary,
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {
            setState(() {
              selectedValue = value;
              widget.onDropdownClicked();
            });
          },
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            iconSize: 14,
            iconEnabledColor: AppColors.White,
            iconDisabledColor: Colors.grey,
          ),
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 140,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
    );
  }
}
