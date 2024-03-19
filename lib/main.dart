import 'package:demonewyorktimeapi/resources/AppColors.dart';
import 'package:demonewyorktimeapi/routes/routes.dart';
import 'package:demonewyorktimeapi/routes/routes_name.dart';
import 'package:demonewyorktimeapi/views/splash/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  initDefault();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
      .then((_) {
    runApp(
      const ProviderScope(
        child: MYNewsApp(),
      ),
    );
  });
}

/**
 * Name: [main] initDefault()
 * <br> Created By Arpan Mehta on 27-10-23
 * <br> Modified By Arpan Mehta on 27-10-23
 * <br> Purpose: This method will initialize default settings for app.
 */
void initDefault() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.color_primary, // Set the status bar color here
  ));
}

class MYNewsApp extends StatelessWidget {
  const MYNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Colors.transparent),
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all<Color>(
              AppColors.md_blue_grey_700), // Change thumb color
          trackColor: MaterialStateProperty.all<Color>(
              AppColors.md_blue_grey_700), // Change track color
        ),
      ),
      initialRoute: RoutesName.SPLASH_SCREEN,
      // or any other initial route you prefer
      onGenerateRoute: Routes.generateRoute,
      home: const SplashScreen(), // Display SplashScreen as the initial screen
    );
  }
}
