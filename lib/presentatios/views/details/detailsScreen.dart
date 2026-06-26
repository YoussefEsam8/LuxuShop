import 'package:app_fixed/data/model/products.dart';
import 'package:app_fixed/presentatios/views/details/Product_imag_details.dart';
import 'package:app_fixed/presentatios/views/details/Productdetails_section.dart';
import 'package:app_fixed/presentatios/views/details/product_action.dart';
import 'package:flutter/material.dart';
// 💡 استورد الملفات الجديدة هنا لما تكريتها جوه فولدر الـ widgets:
// import 'package:app_fixed/presentatios/widget/product_images_stack.dart';
// import 'package:app_fixed/presentatios/widget/product_details_section.dart';
// import 'package:app_fixed/presentatios/widget/product_action_buttons.dart';

class DetailsScreen extends StatelessWidget {
  final Product products;
  const DetailsScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "LuxuShop",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.grey.shade100,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImagesStack(product: products),

            ProductDetailsSection(product: products),

            ProductActionButtons(),
          ],
        ),
      ),
    );
  }
}
