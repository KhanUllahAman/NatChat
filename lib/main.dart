import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:natchatt/first.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: First(),
    );
  }
}