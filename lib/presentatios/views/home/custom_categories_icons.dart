import 'package:app_fixed/Business_logic/cubit/category_cupit/category_cubit.dart';
import 'package:app_fixed/Business_logic/cubit/products_cupit/products_cubit.dart';
import 'package:app_fixed/core/constants/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCategoriesIcons extends StatelessWidget {
  const CustomCategoriesIcons({super.key});

  Widget buildCategory(String categoriesName, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: InkWell(
        onTap: () =>
            context.read<ProductsCubit>().filterCategories(categoriesName),

        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(200),
              ),
              child: Center(
                child: FaIcon(
                  AppIcons.getCategoryIcon(categoriesName),
                  color: Colors.black87,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              categoriesName,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCupit, CategoryCupitState>(
      builder: (context, state) {
        if (state is CategoryLoaded) {
          final List<String> allCategoriesName = state.categoriesName;

          return SizedBox(
            height: 85,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: allCategoriesName.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return buildCategory(allCategoriesName[index], context);
              },
            ),
          );
        }

        if (state is CategoryLoading) {
          return const SizedBox(
            height: 85,
            child: Center(
              child: CircularProgressIndicator(color: Colors.amber),
            ),
          );
        }

        return const SizedBox(
          height: 85,
          child: Center(child: Text('No data found')),
        );
      },
    );
  }
}
