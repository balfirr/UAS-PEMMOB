import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cashier_controller.dart';
import '../widgets/sidebar.dart';

class CashierView extends StatelessWidget {
  final CashierController controller = Get.put(CashierController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kasir')),
      drawer: Sidebar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nama Produk'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Harga'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final price = double.tryParse(priceController.text) ?? 0.0;
                controller.addProduct(name, price);
                nameController.clear();
                priceController.clear();
              },
              child: Text('Tambah Produk'),
            ),
            Obx(() => Expanded(
                  child: ListView.builder(
                    itemCount: controller.productList.length,
                    itemBuilder: (context, index) {
                      final product = controller.productList[index];
                      return ListTile(
                        title: Text(product.name),
                        trailing: Text('\$${product.price}'),
                      );
                    },
                  ),
                )),
            Obx(() => Text('Total Harga: \$${controller.totalPrice.value}',
                style: TextStyle(fontSize: 20))),
            ElevatedButton(
              onPressed: controller.completeTransaction,
              child: Text('Selesaikan Transaksi'),
            ),
          ],
        ),
      ),
    );
  }
}
