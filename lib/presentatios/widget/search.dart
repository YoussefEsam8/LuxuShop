import 'package:app_fixed/core/constants/strings.dart';
import 'package:app_fixed/data/model/products.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final List<Product> allProducts;

  Search({required this.allProducts});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Product> SuggestionsList = allProducts.where((Product) {
      return Product.titleProduct.toLowerCase().contains(
        query.toLowerCase().toString(),
      );
    }).toList();
    return buildSearchResultsListView(SuggestionsList);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }

  Widget buildSearchResultsListView(List<Product> product) {
    if (product.isEmpty) {
      return Container(child: Text('No data found '));
    } else {
      return ListView.builder(
        itemCount: product.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: InkWell(
              onTap: () => Navigator.pushNamed(
                context,
                detailScreen,
                arguments: product[index],
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        product[index].imagesProduct[0],
                        height: 150,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        product[index].titleProduct,
                        maxLines: 1,
                        style: const TextStyle(fontSize: 15),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
