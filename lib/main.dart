import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderly/routes/app_pages.dart';
import 'package:wanderly/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NoteSnap',
      initialRoute: AppRoutes.initial,
      getPages: AppPages.pages,
    );
  }
}
