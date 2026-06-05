import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../models/fruit.dart';

class FruitCard extends StatelessWidget {
  final Fruit fruit;
  const FruitCard({required this.fruit, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: fruit.gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text(
            fruit.name.tr(),
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 10),

          
          SizedBox(
            height: 200,
            child: Image.asset(
              fruit.image, 
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                InfoRow(
                  icon: Icons.location_on,
                  text: "${'origin'.tr()}: ${fruit.origin.tr()}",
                ),
                InfoRow(
                  icon: Icons.category,
                  text: "${'type'.tr()}: ${fruit.type.tr()}",
                ),
                InfoRow(
                  icon: Icons.health_and_safety,
                  text: "${'benefits'.tr()}: ${fruit.benefits.tr()}",
                ),
                InfoRow(
                  icon: Icons.calendar_month,
                  text: "${'season'.tr()}: ${fruit.season.tr()}",
                ),
                InfoRow(
                  icon: Icons.local_fire_department,
                  text: "${'calories'.tr()}: ${fruit.calories}",
                ),
                InfoRow(
                  icon: Icons.restaurant,
                  text: "${'use'.tr()}: ${fruit.culinaryUse.tr()}",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}