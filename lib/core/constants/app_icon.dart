import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // تأكد إن الـ import كدة

class AppIcons {
  // 💡 التعديل هنا: خلي الـ Value نوعها IconData عشان تقبل الاتنين عادي
  static final Map<String, dynamic> _categoryIcons = {
    'beauty': FontAwesomeIcons.faceSmileWink,
    'fragrances': FontAwesomeIcons.flask,
    'furniture': FontAwesomeIcons.chair,
    'groceries': FontAwesomeIcons.basketShopping,
    'home-decoration': FontAwesomeIcons.couch,
    'kitchen-accessories': FontAwesomeIcons.utensils,
    'laptops': FontAwesomeIcons.laptop,
    'mens-shirts': FontAwesomeIcons.shirt,
    'mens-shoes': FontAwesomeIcons.shoePrints,
    'mens-watches': FontAwesomeIcons.clock,
    'mobile-accessories': FontAwesomeIcons.headphones,
    'motorcycle': FontAwesomeIcons.motorcycle,
    'skin-care': FontAwesomeIcons.spa,
    'smartphones': FontAwesomeIcons.mobileScreenButton,
    'sports-accessories': FontAwesomeIcons.football,
    'sunglasses': FontAwesomeIcons.glasses,
    'tablets': FontAwesomeIcons.tabletScreenButton,
    'tops': FontAwesomeIcons.vest,
    'vehicle': FontAwesomeIcons.car,
    'womens-bags': FontAwesomeIcons.bagShopping,
    'womens-dresses': FontAwesomeIcons.personDress,
    'womens-jewellery': FontAwesomeIcons.gem,
    'womens-shoes': FontAwesomeIcons.shoePrints,
    'womens-watches': FontAwesomeIcons.stopwatch,
  };

  // 💡 الدالة دي بتفضل ترجع IconData عادي جداً ومفيش أي مشكلة
  static dynamic getCategoryIcon(String? slug) {
    if (slug == null) return FontAwesomeIcons.boxesStacked;
    return _categoryIcons[slug.toLowerCase()] ?? FontAwesomeIcons.boxesStacked;
  }
}
