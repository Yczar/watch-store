import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:watch_store/app/models/watch_color.dart';

class Watch {
  final String name;
  final String series;
  final num price;
  final String image;
  final List<WatchColor> colors;
  final String description;
  final String review;
  Watch({
    required this.name,
    required this.series,
    required this.price,
    required this.image,
    required this.colors,
    required this.description,
    required this.review,
  });

  Watch copyWith({
    String? name,
    String? series,
    num? price,
    String? image,
    List<WatchColor>? colors,
    String? description,
    String? review,
  }) {
    return Watch(
      name: name ?? this.name,
      series: series ?? this.series,
      price: price ?? this.price,
      image: image ?? this.image,
      colors: colors ?? this.colors,
      description: description ?? this.description,
      review: review ?? this.review,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'series': series,
      'price': price,
      'image': image,
      'colors': colors.map((x) => x.toMap()).toList(),
      'description': description,
      'review': review,
    };
  }

  factory Watch.fromMap(Map<String, dynamic> map) {
    return Watch(
      name: map['name'] as String,
      series: map['series'] as String,
      price: map['price'] as num,
      image: map['image'] as String,
      colors: List<WatchColor>.from(
        (map['colors'] as List<int>).map<WatchColor>(
          (x) => WatchColor.fromMap(x as Map<String, dynamic>),
        ),
      ),
      description: map['description'] as String,
      review: map['review'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Watch.fromJson(String source) =>
      Watch.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Watch(name: $name, series: $series, price: $price, image: $image, colors: $colors, description: $description, review: $review)';
  }

  @override
  bool operator ==(covariant Watch other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.series == series &&
        other.price == price &&
        other.image == image &&
        listEquals(other.colors, colors) &&
        other.description == description &&
        other.review == review;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        series.hashCode ^
        price.hashCode ^
        image.hashCode ^
        colors.hashCode ^
        description.hashCode ^
        review.hashCode;
  }
}
