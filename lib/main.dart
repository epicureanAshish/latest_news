import 'package:latest_news/constant/route_constant.dart';
import 'package:latest_news/ui/view/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'constant/get_pages_constant.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dioClient=Dio();
  runApp(const MyApp());
}
late Dio dioClient;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      title: 'Latest News',
      initialRoute: RouteConstant.homeScreen,
      home: HomeScreen(),
    );
  }
}
