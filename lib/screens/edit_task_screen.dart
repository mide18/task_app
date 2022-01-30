import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/constants/components.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({Key? key}) : super(key: key);

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {

  final _formKey = GlobalKey<FormState>();
  final _focusScopeNode = FocusScopeNode();

  String editTask = "";
  bool accept = false;

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
        height: 400.h,
        child: Center(
            child: Card(
              elevation: 1,
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: Form(
                  key: _formKey,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Edit Task',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text(
                          'Edit Task',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(width: 280.w,
                          child: Text(
                            '86h7hd7s8scbsds',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],),
                      SizedBox(height: 20.h,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Edit Task',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(width: 280.w, height: 45.h,
                            child: TextFormField(
                              onSaved: (newValue) {
                                if (newValue == null) {
                                  return;
                                }
                                editTask = newValue;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please fill an item";
                                } else {
                                  value = editTask;
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
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(width: 145.w,
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Completed',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            Checkbox(checkColor: Colors.blue,
                              value: accept,
                              onChanged: (value){

                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(6)),
                        width: MediaQuery.of(context).size.width,
                        height: 41.h,
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              // Navigator.of(context)
                              //     .pushNamed(AppRoutes.tasksScreen);
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
