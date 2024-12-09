import 'package:get/get.dart';
import '../models/product.dart';
import '../controllers/dashboard_controller.dart';

class CashierController extends GetxController {
  var productList = <Product>[].obs;
  var totalPrice = 0.0.obs;

  void addProduct(String name, double price) {
    productList.add(Product(name: name, price: price));
    totalPrice.value += price;
  }

  void completeTransaction() {
    if (productList.isNotEmpty) {
      final dashboardController = Get.find<DashboardController>();

      // Perbarui data di dashboard
      final day = DateTime.now().weekday - 1; // 0 = Monday, 6 = Sunday
      dashboardController.addSale(totalPrice.value, day);

      productList.clear();
      totalPrice.value = 0.0;
      Get.snackbar('Berhasil', 'Transaksi Selesai');
    } else {
      Get.snackbar('Error', 'Tidak dapat menambahkan produk.');
    }
  }
}
