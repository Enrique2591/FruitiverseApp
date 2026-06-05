import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/models/fruit.dart';
import 'package:fruit_app/widgets/fruit_card.dart';
import 'package:google_fonts/google_fonts.dart';

class PomeScreen extends StatefulWidget {
  const PomeScreen({super.key});

  @override
  State<PomeScreen> createState() => _FruitScreenState();
}

class _FruitScreenState extends State<PomeScreen> {
  bool _isDarkMode = false;

  final List<Fruit> fruits = [
    Fruit(
      name: "apple.name",
      type: "apple.type",
      origin: "apple.origin",
      benefits: "apple.benefits",
      season: 'apple.season',
      calories: 52,
      culinaryUse: "apple.use",
      image: "assets/fruits/apple.png",
      gradientColors: [const Color.fromARGB(255, 240, 3, 3), const Color.fromARGB(255, 53, 241, 1)], 
    ),
    Fruit(
      name: "pear.name",
      type: "pear.type",
      origin: "pear.origin",
      benefits: "pear.benefits",
      season: 'pear.season',
      calories: 57,
      culinaryUse: "pear.use",
      image: "assets/fruits/pear.png",
      gradientColors: [const Color.fromARGB(255, 104, 235, 16), const Color.fromARGB(255, 214, 208, 211)],
    ),
    
    Fruit(name: "grenade.name", type: "grenade.type", origin: "grenade.origin", benefits:"grenade.benefits", season: "grenade.season", calories: 83 , culinaryUse: "grenade.use", image: "assets/fruits/grenade.png", gradientColors: [const Color.fromARGB(255, 116, 2, 29), const Color.fromARGB(255, 248, 223, 238)]),
    
    Fruit(
      name: "kiwi.name",
      type: "kiwi.type",
      origin: "kiwi.origin",
      benefits: "kiwi.benefits",
      season: 'kiwi.season',
      calories: 61,
      culinaryUse: "kiwi.use",
      image: "assets/fruits/kiwi.png",
      gradientColors: [const Color.fromARGB(255, 39, 206, 5), const Color.fromARGB(255, 130, 81, 2)],
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
          "🥝 ${"pome.title".tr()}",
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
                    const Color.fromARGB(255, 3, 179, 243),
                    const Color.fromARGB(255, 239, 82, 4),
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
