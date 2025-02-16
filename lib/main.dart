//steps for API :
// 1-test your API by post man
// 2-create model (class represent your data "data class")
// 3- search on fetch data flutter and go to documentation
// 4- create class "api manager" to collect in it all methods for api
// 5- display your data

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_project_ff/theme_data.dart';

import 'home_screen/home_screen.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      theme: ApplicationThem.lightThem,
      title: 'News App',
      routes: {
        HomeScreen.routeName: (context) => HomeScreen()
      },
    );
  }
}
