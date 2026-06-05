import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/models/fruit.dart';
import 'package:fruit_app/widgets/fruit_card.dart';
import 'package:google_fonts/google_fonts.dart';

class TropicalScreen extends StatefulWidget {
  const TropicalScreen({super.key});

  @override
  State<TropicalScreen> createState() => _FruitScreenState();
}

class _FruitScreenState extends State<TropicalScreen> {
  bool _isDarkMode = false;

  final List<Fruit> fruits = [
    Fruit(
      name: "pineapple.name",
      type: "pineapple.type",
      origin: "pineapple.origin",
      benefits: "pineapple.benefits",
      season: 'pineapple.season',
      calories: 50,
      culinaryUse: "pineapple.use",
      image: "assets/fruits/pineapple.png",
      gradientColors: [const Color.fromARGB(255, 126, 91, 2), const Color.fromARGB(255, 90, 195, 9)], 
    ),
    Fruit(
      name: "mango.name",
      type: "mango.type",
      origin: "mango.origin",
      benefits: "mango.benefits",
      season: 'mango.season',
      calories: 70,
      culinaryUse: "mango.use",
      image: "assets/fruits/mango.png",
      gradientColors: [const Color.fromARGB(255, 251, 19, 162), const Color.fromARGB(255, 147, 225, 10)],
    ),
    
    Fruit(name: "papaya.name", type: "papaya.type", origin: "papaya.origin", benefits:"papaya.benefits", season: "papaya.season", calories: 43 , culinaryUse: "papaya.use", image: "assets/fruits/papaya.png", gradientColors: [const Color.fromARGB(255, 248, 167, 4), const Color.fromARGB(255, 244, 191, 20)]),
    
    Fruit(
      name: "banana.name",
      type: "banana.type",
      origin: "banana.origin",
      benefits: "banana.benefits",
      season: 'banana.season',
      calories: 91,
      culinaryUse: "banana.use",
      image: "assets/fruits/banana.png",
      gradientColors: [const Color.fromARGB(255, 243, 234, 0), const Color.fromARGB(255, 205, 232, 6)],
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
          "🍍 ${"tropical.title".tr()}",
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
                    const Color.fromARGB(255, 3, 213, 232),
                    const Color.fromARGB(255, 208, 239, 4),
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

