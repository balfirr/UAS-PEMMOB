import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/dashboard_page.dart';
import '../views/cashier_page.dart';
import '../views/login_page.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('POS App', style: TextStyle(fontSize: 24)),
          ),
          ListTile(
            title: Text('Dashboard'),
            onTap: () {
              Get.off(() => DashboardView());
            },
          ),
          ListTile(
            title: Text('Kasir'),
            onTap: () {
              Get.off(() => CashierView());
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              Get.offAll(() => LoginView());
            },
          ),
        ],
      ),
    );
  }
}
