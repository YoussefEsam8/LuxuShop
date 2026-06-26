import 'package:app_fixed/data/model/products.dart';
import 'package:flutter/material.dart';

class ProductImagesStack extends StatelessWidget {
  final Product product;
  const ProductImagesStack({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🏗️ الـ Stack الكبير للصورة وملحقاتها
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child: Container(
                color: Colors.grey.shade100,
                height: 320,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Image.network(
                  product.imagesProduct[0],
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Positioned(
              top: 15,
              right: 15,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.red),
                  onPressed: () {},
                ),
              ),
            ),

            Positioned(
              bottom: 15,
              left: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "1 / ${product.imagesProduct.length}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: 90,
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            scrollDirection: Axis.horizontal,
            itemCount: product.imagesProduct.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.only(right: 10),
              width: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.network(
                  product.imagesProduct[index],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
