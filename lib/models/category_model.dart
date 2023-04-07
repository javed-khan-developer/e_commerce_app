import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;
  const Category({
    required this.name,
    required this.imageUrl,
  });
  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories = [
    const Category(
      name: 'Soft Drink',
      imageUrl:
          'https://images.unsplash.com/photo-1556710807-a9261921475f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c29mdGRyaW5rfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    ),
    const Category(
      name: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1536304447766-da0ed4ce1b73?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80',
    ),
    const Category(
      name: 'Water',
      imageUrl:
          'https://images.unsplash.com/photo-1553564552-02656d6a2390?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80',
    ),
  ];
}
