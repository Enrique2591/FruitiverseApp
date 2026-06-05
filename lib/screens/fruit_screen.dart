import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/fruit_card.dart';
import '../models/fruit.dart';

class FruitScreen extends StatefulWidget {
  const FruitScreen({super.key});

  @override
  State<FruitScreen> createState() => _FruitScreenState();
}

class _FruitScreenState extends State<FruitScreen> {
  bool _isDarkMode = false;

  final List<Fruit> fruits = [
    Fruit(
      name: "orange.name",
      type: "orange.type",
      origin: "orange.origin",
      benefits: "orange.benefits",
      season: 'orange.season',
      calories: 47,
      culinaryUse: "orange.use",
      image: "assets/fruits/orange.png",
      gradientColors: [Colors.deepOrange, Colors.orangeAccent], 
    ),
    Fruit(
      name: "lemon.name",
      type: "lemon.type",
      origin: "lemon.origin",
      benefits: "lemon.benefits",
      season: 'lemon.season',
      calories: 33,
      culinaryUse: "lemon.use",
      image: "assets/fruits/lemon.png",
      gradientColors: [const Color.fromARGB(255, 220, 251, 19), const Color.fromARGB(255, 147, 225, 10)],
    ),
    
    Fruit(name: "tangarine.name", type: "tangarine.type", origin: "tangarine.origin", benefits:"tangarine.benefits", season: "tangarine.season", calories: 50 , culinaryUse: "tangarine.use", image: "assets/fruits/tangarine.png", gradientColors: [const Color.fromARGB(255, 247, 211, 11), const Color.fromARGB(255, 248, 145, 0)]),
    
    Fruit(
      name: "grapefruit.name",
      type: "grapefruit.type",
      origin: "grapefruit.origin",
      benefits: "grapefruit.benefits",
      season: 'grapefruit.season',
      calories: 52,
      culinaryUse: "grapefruit.use",
      image: "assets/fruits/grapefruit.png",
      gradientColors: [const Color.fromARGB(255, 249, 241, 7), const Color.fromARGB(255, 246, 168, 168)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        iconTheme: IconThemeData(
          color: _isDarkMode ? Colors.white : Colors.black,
        ),

        title: Text(
          "🍋 ${"citrus.title".tr()}",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        actions: [
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language, color: Colors.white),
            onSelected: (locale) {
              context.setLocale(locale);
            },
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: Locale('es'),
                child: Text("🇪🇸 Español"),
              ),
              PopupMenuItem(
                value: Locale('en'),
                child: Text("🇬🇧 English"),
              ),
            ],
          ),

          
          IconButton(
            icon: Icon(
              _isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode;
              });
            },
          ),
        ],
      ),

      extendBodyBehindAppBar: true,

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: _isDarkMode
                ? [
                    Colors.black,
                    Colors.grey.shade900,
                  ]
                : [
                    const Color.fromARGB(255, 75, 232, 3),
                    const Color.fromARGB(255, 32, 177, 9),
                  ],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 100),
          itemCount: fruits.length,
          itemBuilder: (context, index) {
            return FruitCard(fruit: fruits[index]);
          },
        ),
      ),
    );
  }
}

