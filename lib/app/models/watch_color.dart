import 'dart:convert';

import 'package:flutter/material.dart';

class WatchColor {
  final String name;
  final Color color;
  WatchColor({
    required this.name,
    required this.color,
  });

  WatchColor copyWith({
    String? name,
    Color? color,
  }) {
    return WatchColor(
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'color': color.value,
    };
  }

  factory WatchColor.fromMap(Map<String, dynamic> map) {
    return WatchColor(
      name: map['name'] as String,
      color: Color(map['color'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory WatchColor.fromJson(String source) =>
      WatchColor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'WatchColor(name: $name, color: $color)';

  @override
  bool operator ==(covariant WatchColor other) {
    if (identical(this, other)) return true;

    return other.name == name && other.color == color;
  }

  @override
  int get hashCode => name.hashCode ^ color.hashCode;
}
