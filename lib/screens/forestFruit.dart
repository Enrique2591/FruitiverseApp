import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/models/fruit.dart';
import 'package:fruit_app/widgets/fruit_card.dart';
import 'package:google_fonts/google_fonts.dart';

class ForestFruitScreen extends StatefulWidget {
  const ForestFruitScreen({super.key});

  @override
  State<ForestFruitScreen> createState() => _FruitScreenState();
}

class _FruitScreenState extends State<ForestFruitScreen> {
  bool _isDarkMode = false;

  final List<Fruit> fruits = [
    Fruit(
      name: "strawberry.name",
      type: "strawberry.type",
      origin: "strawberry.origin",
      benefits: "strawberry.benefits",
      season: 'strawberry.season',
      calories: 32,
      culinaryUse: "strawberry.use",
      image: "assets/fruits/strawberry.png",
      gradientColors: [const Color.fromARGB(255, 241, 6, 147), const Color.fromARGB(255, 246, 1, 18)], 
    ),
    Fruit(
      name: "raspberry.name",
      type: "raspberry.type",
      origin: "raspberry.origin",
      benefits: "raspberry.benefits",
      season: 'raspberry.season',
      calories: 52,
      culinaryUse: "raspberry.use",
      image: "assets/fruits/raspberry.png",
      gradientColors: [const Color.fromARGB(255, 254, 9, 33), const Color.fromARGB(255, 232, 232, 219)],
    ),
    
    Fruit(name: "blueberry.name", type: "blueberry.type", origin: "blueberry.origin", benefits:"blueberry.benefits", season: "blueberry.season", calories: 57 , culinaryUse: "blueberry.use", image: "assets/fruits/blueberry.png", gradientColors: [const Color.fromARGB(255, 81, 30, 220), const Color.fromARGB(255, 109, 0, 251)]),
    
    Fruit(
      name: "blackberry.name",
      type: "blackberry.type",
      origin: "blackberry.origin",
      benefits: "blackberry.benefits",
      season: 'blackberry.season',
      calories: 43,
      culinaryUse: "blackberry.use",
      image: "assets/fruits/blackberry.png",
      gradientColors: [const Color.fromARGB(255, 99, 31, 246), const Color.fromARGB(255, 232, 6, 104)],
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
          "🫐 ${"berries.title".tr()}",
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
                    const Color.fromARGB(255, 243, 3, 127),
                    const Color.fromARGB(255, 188, 4, 239),
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
