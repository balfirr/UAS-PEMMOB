import 'package:get/get.dart';

class DashboardController extends GetxController {
  var totalSales = 5000.0.obs;
  var totalTransactions = 10.obs;

  var salesData = [
    {'day': 0, 'sales': 1000}, // Monday
    {'day': 1, 'sales': 1200}, // Tuesday
    {'day': 2, 'sales': 800}, // Wednesday
    {'day': 3, 'sales': 1500}, // Thursday
    {'day': 4, 'sales': 1700}, // Friday
    {'day': 5, 'sales': 1300}, // Saturday
    {'day': 6, 'sales': 1600}, // Sunday
  ].obs;

  // Menambahkan data penjualan
  void addSale(double amount, int day) {
    totalSales.value += amount;
    totalTransactions.value += 1;

    // Perbarui penjualan di hari tertentu
    salesData[day]['sales'] = (salesData[day]['sales']! + amount) as int;
    salesData.refresh(); // Refresh data agar grafik diperbarui
  }
}
