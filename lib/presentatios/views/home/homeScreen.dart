// import 'package:app_fixed/costants/app_them.dart';
import 'package:app_fixed/Business_logic/cubit/products_cupit/products_cubit.dart';
import 'package:app_fixed/core/constants/strings.dart';
import 'package:app_fixed/data/model/products.dart';
import 'package:app_fixed/presentatios/views/home/customBottomNavgation.dart';
import 'package:app_fixed/presentatios/widget/search.dart';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _Homescreen();
}

class _Homescreen extends State<Homescreen> {
  List<Product> allProductsList = [];
  int cuarentInex = 0;

  Widget buildCategories() {
    return Row(
      spacing: 40, // الـ spacing بتاعك المظبوط عشان السكرول
      children: [
        buildCategory(
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.clock),
          ),
          'Watch',
        ),

        buildCategory(
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.shoePrints),
          ),
          'Shoes',
        ),

        buildCategory(
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.mobileScreenButton),
          ),
          'Phones',
        ),

        buildCategory(
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.laptop),
          ),
          'Laptops',
        ),

        buildCategory(
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.bottleDroplet),
          ),
          'Perfume',
        ),

        buildCategory(
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.wandMagicSparkles),
          ),
          'Makeup',
        ),

        buildCategory(
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.appleWhole),
          ),
          'Food',
        ),

        buildCategory(
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.couch),
          ),
          'Furniture',
        ),
      ],
    );
  }

  Widget buildCategory(IconButton icon, String text) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F7),
            borderRadius: BorderRadius.circular(200),
          ),
          child: icon,
        ),
        Text(text),
      ],
    );
  }

  Widget buildGrid(List<Product> products) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),

      // shrinkWrap: true,
      // physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return productItem(products[index]);
      },
    );
  }

  Widget productItem(Product product) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: InkWell(
            onTap: () =>
                Navigator.pushNamed(context, detailScreen, arguments: product),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(product.imagesProduct[0], height: 150),
                SizedBox(height: 5),
                Text(
                  product.titleProduct,
                  maxLines: 1,
                  style: TextStyle(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10),
                Text(" \$${product.priceProduct}", textAlign: TextAlign.start),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("LuxuShop", style: TextStyle(fontSize: 30)),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, loginScreen);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: Search(allProducts: allProductsList),
              );
            },
            icon: Icon(Icons.search, size: 30),
          ),
        ],
      ),

      bottomNavigationBar: CustombottomNavgationBar(
        cuarentindex: cuarentInex,
        ontap: (value) {
          setState(() {
            cuarentInex = value;
          });
        },
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                textAlign: TextAlign.left,
                "Shop by Category ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 30),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: buildCategories(),
            ),
            Expanded(
              flex: 1,
              child: BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsSuccess) {
                    allProductsList = state.products;
                    return buildGrid(state.products);
                  } else if (state is ProductsLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Text('data is not found');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
