import 'package:ui_design_2/models/food.dart';

class Restaurant {
  final String? imageUrl;
  final String? name;
  final String? address;
  final int? rating;
  final List<Food>? menu;
  final double? distance;

  Restaurant({
    this.imageUrl,
    this.name,
    this.address,
    this.rating,
    this.menu,
    this.distance,
  });
}
