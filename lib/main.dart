import 'package:dynamic_multi_form/form.dart';
import 'package:dynamic_multi_form/multi_form.dart';
import 'package:dynamic_multi_form/test_multi_form.dart';
import 'package:dynamic_multi_form/user.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Dynamic Multi Form',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.greenAccent
      ),
      home: Column(
        children: [
          Flexible(
            //flex: 1,
            child: MultiForm(),
            //TestMultiForm()
          )
          //UserForm(user: User(), onDelete: () {  }, onAddForm: () {  }, ),

        ],
      )
    );
  }
}

