import 'package:app_fixed/Business_logic/cubit/category_cupit/category_cubit.dart';
import 'package:app_fixed/Business_logic/cubit/products_cupit/products_cubit.dart';
import 'package:app_fixed/core/constants/app_icon.dart';
import 'package:app_fixed/core/constants/strings.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<String> allCategories = [];
  List<String> images = [];

  Widget customImage(String slug) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: const Color.fromARGB(255, 224, 223, 217).withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Center(child: FaIcon(AppIcons.getCategoryIcon(slug))),
    );
  }

  Widget customCategories() {
    return BlocBuilder<CategoryCupit, CategoryCupitState>(
      builder: (context, state) {
        if (state is CategoryLoaded) {
          allCategories = state.categoriesName;

          return ListView.builder(
            itemCount: allCategories.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: customImage(allCategories[index]),
                  title: Text(allCategories[index]),
                  subtitle: Text("${allCategories.length} itemes"),
                  trailing: IconButton(
                    //Todoo Refactor --------------------
                    onPressed: () {
                      context.read<ProductsCubit>().filterCategories(
                        allCategories[index],
                      );
                      Navigator.pushReplacementNamed(context, homeScreen);
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              );
            },
          );
        } else if (state is CategoryLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CategoryError) {
          return Text(state.error.toString());
        }
        return Text('data is not found');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Categories", style: TextStyle(fontSize: 30)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                textAlign: TextAlign.left,
                " Categories ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 10),
            Expanded(child: customCategories()),
          ],
        ),
      ),
    );
  }
}
