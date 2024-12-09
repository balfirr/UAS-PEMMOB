import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/sidebar.dart';

class DashboardView extends StatelessWidget {
  // Inisialisasi DashboardController
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      drawer: Sidebar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Obx(() => Text(
                  'Total Penjualan: \$${controller.totalSales.value}',
                  style: TextStyle(fontSize: 20),
                )),
            Obx(() => Text(
                  'Total Transaksi: ${controller.totalTransactions.value}',
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(height: 20),
            Text(
              'Data Penjualan Terkini',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() => LineChart(
                      LineChartData(
                        borderData: FlBorderData(
                          border: const Border(
                            left: BorderSide(color: Colors.black),
                            bottom: BorderSide(color: Colors.black),
                          ),
                        ),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, _) =>
                                  Text('\$${value.toInt()}'),
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, _) {
                                final days = [
                                  'Mon',
                                  'Tue',
                                  'Wed',
                                  'Thu',
                                  'Fri',
                                  'Sat',
                                  'Sun'
                                ];
                                return Text(days[value.toInt()]);
                              },
                            ),
                          ),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            spots: controller.salesData.map((e) {
                              final day = (e['day'] ?? 0).toDouble();
                              final sales = (e['sales'] ?? 0.0).toDouble();
                              return FlSpot(day, sales);
                            }).toList(),
                            isCurved: true,
                            dotData: FlDotData(show: true),
                            belowBarData: BarAreaData(show: true),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
