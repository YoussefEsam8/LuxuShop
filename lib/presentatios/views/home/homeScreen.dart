import 'package:app_fixed/Business_logic/cubit/products_cupit/products_cubit.dart';
import 'package:app_fixed/core/constants/strings.dart';
import 'package:app_fixed/data/model/products/products.dart';
// import 'package:app_fixed/presentatios/views/home/customBottomNavgation.dart';
import 'package:app_fixed/presentatios/views/home/custom_categories_icons.dart';
import 'package:app_fixed/presentatios/widget/search.dart';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _Homescreen();
}

class _Homescreen extends State<Homescreen> {
  List<Product> allProductsList = [];

  Widget buildGrid(List<Product> products) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),

      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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

  Widget offLine() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text("Check The Internet ", style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 25),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.asset('images/offLineImage.png'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("LuxuShop", style: TextStyle(fontSize: 30)),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pushNamed(context, loginScreen);
        //   },
        //   icon: Icon(Icons.arrow_back),
        // ),
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

      body: OfflineBuilder(
        connectivityBuilder:
            (
              BuildContext context,
              List<ConnectivityResult> connectivity,
              Widget child,
            ) {
              final bool connected = !connectivity.contains(
                ConnectivityResult.none,
              );
              if (connected) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            textAlign: TextAlign.left,
                            "Shop by Category ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        CustomCategoriesIcons(),

                        BlocBuilder<ProductsCubit, ProductsState>(
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
                      ],
                    ),
                  ),
                );
              } else {
                return offLine();
              }
            },
        child: Text(""),
      ),
    );
  }
}
