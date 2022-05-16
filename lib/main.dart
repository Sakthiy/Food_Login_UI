import 'package:flutter/material.dart';
import 'package:oxyfood/Constants.dart';

import 'Login_Screen.dart';
//0NyJp9LpEvMv0UIVTnxcoM1IcZr2

void main(){
  runApp(MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>MaterialApp(
    home: Login_Screen(),
    title: appName,
  );
}
