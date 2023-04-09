import 'package:e_commerce_app/models/models.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CartScreen(),
    );
  }

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Cart'),
      bottomNavigationBar: const CustomNavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add \$20 for free delivery',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(),
                  ),
                  child: Text(
                    'Add More Items',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
            CartProductCard(
              product: Product.products[0],
            ),
          ],
        ),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final Product product;
  const CartProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          product.imageUrl,
          width: 100,
          height: 80,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                '\$${product.price}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_circle),
            ),
            Text('1', style: Theme.of(context).textTheme.titleMedium),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove_circle),
            ),
          ],
        )
      ],
    );
  }
}
