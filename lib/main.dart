import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/login_page.dart';
import 'controllers/dashboard_controller.dart';

void main() {
  // Inisialisasi DashboardController
  Get.put(DashboardController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POS App',
      home: LoginView(),
    );
  }
}

