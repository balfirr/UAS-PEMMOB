import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/dashboard_page.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var errorMessage = ''.obs;

  void login() {
    if (username.value.isEmpty || password.value.isEmpty) {
      errorMessage.value = 'Username dan password tidak bisa kosong. Harap isi.';
      return;
    }

    if (username.value == 'admin' && password.value == 'admin') {
      errorMessage.value = '';
      Get.off(() => DashboardView());
    } else {
      errorMessage.value = 'Username or password salah';
    }
  }
}
