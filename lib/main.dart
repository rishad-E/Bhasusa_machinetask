import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_tasknew/controller/controller.dart';
import 'package:machine_tasknew/view/home_screen.dart';

void main() {
  runApp( MyApp());
  Get.put(ControllerClass());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
final ControllerClass controller = Get.put(ControllerClass());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     onInit: ()=> controller.fetchData(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
