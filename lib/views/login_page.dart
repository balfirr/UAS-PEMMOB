import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Username'),
                onChanged: (value) => controller.username.value = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (value) => controller.password.value = value,
              ),
              SizedBox(height: 16),
              Obx(() => Text(
                    controller.errorMessage.value,
                    style: TextStyle(color: Colors.red),
                  )),
              ElevatedButton(
                onPressed: controller.login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
