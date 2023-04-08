import 'package:e_commerce_app/models/models.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class WishListScreen extends StatelessWidget {
  static const String routeName = '/wishlist';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const WishListScreen(),
    );
  }

  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Wishlist'),
      bottomNavigationBar: const CustomNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2.14,
        ),
        itemCount: Product.products.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: ProductCard(
              widthFactor: 1.1,
              leftPosition: 100,
              product: Product.products[index],
              isWishList: true,
            ),
          );
        },
      ),
    );
  }
}
