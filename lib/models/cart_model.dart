import 'package:equatable/equatable.dart';

import 'models.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});
  double get subTotal =>
      products.fold(0, (total, current) => total + current.price);

  String freeDelivery(subTotal) {
    if (subTotal >= 30) {
      return 'You Have Free Delivery';
    } else {
      double missing = 30.0 - subTotal;
      return 'Add \$${missing.toStringAsFixed(2)} for Free Delivery';
    }
  }

  double deliveryFee(subTotal) {
    if (subTotal >= 30) {
      return 0.0;
    } else {
      return 10;
    }
  }

  double total(subTotal, deliveryFee) {
    return subTotal + deliveryFee(subTotal);
  }

  String get subTotalString => subTotal.toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subTotal).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subTotal);
  String get totalString => total(subTotal, deliveryFee).toStringAsFixed(2);

  @override
  List<Object?> get props => [products];
}
