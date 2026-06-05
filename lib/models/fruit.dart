import 'package:flutter/material.dart';

class Fruit {
  final String name;
  final String type;
  final String origin;
  final String benefits;
  final String season;
  final int calories;
  final String culinaryUse;
  final String image;
  final List<Color> gradientColors;
  

  Fruit({
    required this.name,
    required this.type,
    required this.origin,
    required this.benefits,
    required this.season,
    required this.calories,
    required this.culinaryUse,
    required this.image,
    required this.gradientColors,
    
  });
}