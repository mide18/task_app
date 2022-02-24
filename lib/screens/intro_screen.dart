import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/constants/components.dart';
import 'package:task_manager_app/constants/custom_icons_icons.dart';
import 'package:task_manager_app/constants/routes.dart';
import 'package:task_manager_app/core/api/request_state.dart';
import 'package:task_manager_app/core/models/login_model/login_response_model.dart';
import 'package:task_manager_app/core/services/local_notification_service.dart';
import 'package:task_manager_app/notifer/login_notifier.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  String email = "";
  String password = "";

  final _formKey = GlobalKey<FormState>();
  final _focusScopeNode = FocusScopeNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocalNotificationService.initialize(context);
// gives message on which the user taps and open the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      final routeFromMessage = message!.data['route'];

      Navigator.pushNamed(context, routeFromMessage);
    });

    //works when the app is in foreground
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
      }
      LocalNotificationService.display(message);
    });

    // works when app is in background, but opened and user taps on notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
    final routeFromMessage = message.data['route'];
    
    Navigator.pushNamed(context, routeFromMessage);

    print(routeFromMessage);
    });

////from comments
//     FirebaseMessaging.instance.requestPermission().then((value) {
//       print(value);});
//     FirebaseMessaging.instance.getToken().then((token){
//       print(token);});
//     FirebaseMessaging.instance.getAPNSToken().then((APNStoken){
//       print(APNStoken);});
   }

  @override
  Widget build(BuildContext context) {
    return ProviderListener<RequestState<LoginResponseModel>>(
      provider: loginRequestStateNotifierProvider,
      onChange: (context, value) {
        value.when(
          idle: () {},
          loading: () {
            context.loaderOverlay.show(
              widget: Platform.isIOS
                  ? CupertinoActivityIndicator(
                      radius: 20,
                    )
                  : Container(
                      width: 20,
                      height: 20,
                      child: Center(
                          child: CircularProgressIndicator(
                        color: Colors.blue,
                      )),
                    ),
            );
          },
          success: (LoginResponseModel value) {
            if (context.loaderOverlay.visible) {
              //hiding the overlay
              context.loaderOverlay.hide();

              //saving the authtoken so that we can use it in different parts of our app
              // context.read(authTokenProvider).state =
              //     value.data.authToken;

              Navigator.of(context).pushNamed(AppRoutes.tasksScreen);

              Platform.isIOS
                  ? showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: Text("${value.data.message}"),
                        actions: [
                          // CupertinoDialogAction(
                          //   onPressed: () =>
                          //       Navigator.of(context).pop(),
                          //   child: Text(
                          //     "Ok",
                          //     style:
                          //         TextStyle(color: kPrimaryColor),
                          //   ),
                          // )
                        ],
                      ),
                    )
                  : ScaffoldMessenger.of(context).showSnackBar(
                      (SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.green,
                        content: Text(
                          "${value.data.message}",
                          textAlign: TextAlign.center,
                        ),
                      )),
                    );
            }
          },
          error: (errorMessage, stackTrace) {
            if (context.loaderOverlay.visible) {
              context.loaderOverlay.hide();
              print(errorMessage);
              Platform.isIOS
                  ? showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: Text("An error Occurred"),
                        content: Text("$errorMessage"),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              "Ok",
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    )
                  : showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("An error Occurred"),
                        content: Text("$errorMessage"),
                      ),
                    );
            }
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Welcome Task App',
            style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.w700),
          ),
          automaticallyImplyLeading: true,
        ),
        body: Center(
            child: Card(
          elevation: 1,
          child: Padding(
            padding: EdgeInsets.all(10.r),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    onSaved: (newValue) {
                      if (newValue == null) {
                        return;
                      }
                      email = newValue;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please fill an item";
                      } else if (!emailValidatorRegExp.hasMatch(value)) {
                        return "please input a valid email";
                      } else {
                        value = email;
                        return null;
                      }
                    },
                    onEditingComplete: () {
                      _focusScopeNode.nextFocus();
                    },
                    decoration: InputDecoration(
                        isDense: true,
                        focusedBorder: focusOutline(),
                        border: enableOutline(),
                        enabledBorder: enableOutline(),
                        hintText: 'e.g. john@yahoo.com'),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    onSaved: (newValue) {
                      if (newValue == null) {
                        return;
                      }
                      password = newValue;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please fill an item";
                      } else {
                        value = password;
                        return null;
                      }
                    },
                    onEditingComplete: () {
                      _focusScopeNode.nextFocus();
                    },
                    decoration: InputDecoration(
                        isDense: true,
                        focusedBorder: focusOutline(),
                        border: enableOutline(),
                        enabledBorder: enableOutline(),
                        hintText: 'e.g. wash the dishes'),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(6)),
                    width: 140.w,
                    height: 41.h,
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          context
                              .read(loginRequestStateNotifierProvider.notifier)
                              .login(email, password);
                        }
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
