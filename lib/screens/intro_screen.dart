import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/constants/components.dart';
import 'package:task_manager_app/constants/custom_icons_icons.dart';
import 'package:task_manager_app/constants/routes.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  String task = "";
  final _formKey = GlobalKey<FormState>();
  final _focusScopeNode = FocusScopeNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        height: 200.h,
        child: Center(
            child: Card(
          elevation: 1,
          child: Padding(
            padding: EdgeInsets.all(10.r),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Task Manager',
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
                      task = newValue;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please fill an item";
                      } else {
                        value = task;
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

                          Navigator.of(context)
                              .pushNamed(AppRoutes.tasksScreen);
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
