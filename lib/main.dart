import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/screens/intro_screen.dart';

import 'constants/routes.dart';
import 'core/logger.dart';

void main() {
  runApp(ProviderScope(
    child: MyApp(),
    observers: [Logger()],
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => Platform.isIOS
          ? CupertinoApp(
              color: Color(0xFFF7F7F7),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                DefaultMaterialLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
                DefaultWidgetsLocalizations.delegate,
              ],
              title: 'Task App',
              theme: CupertinoThemeData(
                  barBackgroundColor: Color(0xFFF7F7F7),
                  scaffoldBackgroundColor: Color(0xFFF7F7F7),
                  primaryColor: Colors.black),
              builder: (context, widget) {
                ScreenUtil.setContext(context);
                return MediaQuery(
                  //Setting font does not change with system font size
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!,
                );
              },
              onGenerateRoute: AppRoutes.onGenerateRoute,
              // home: SellerWalletScreen(),
              home: IntroScreen(),
              //home:CupertinoDrawer()
            )
          : MaterialApp(
              title: 'Task App',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                    color: Colors.blueAccent,
                    elevation: 0,
                    iconTheme: IconThemeData(
                      color: Colors.black,
                    )),
                primarySwatch: Colors.cyan,
                fontFamily: 'Lato',
                canvasColor: Colors.white,
                dividerColor: Colors.grey,
              ),
              builder: (context, widget) {
                ScreenUtil.setContext(context);
                return MediaQuery(
                  //Setting font does not change with system font size
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!,
                );
              },
              onGenerateRoute: AppRoutes.onGenerateRoute,
              home: IntroScreen(),
            ),
    );
  }
}
