import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/models/fruit.dart';
import 'package:fruit_app/widgets/fruit_card.dart';
import 'package:google_fonts/google_fonts.dart';

class StoneScreen extends StatefulWidget {
  const StoneScreen({super.key});

  @override
  State<StoneScreen> createState() => _FruitScreenState();
}

class _FruitScreenState extends State<StoneScreen> {
  bool _isDarkMode = false;

  final List<Fruit> fruits = [
    Fruit(
      name: "peach.name",
      type: "peach.type",
      origin: "peach.origin",
      benefits: "peach.benefits",
      season: 'peach.season',
      calories: 39,
      culinaryUse: "peach.use",
      image: "assets/fruits/peach.png",
      gradientColors: [const Color.fromARGB(255, 240, 204, 3), const Color.fromARGB(255, 225, 65, 76)], 
    ),
    Fruit(
      name: "cherry.name",
      type: "cherry.type",
      origin: "cherry.origin",
      benefits: "cherry.benefits",
      season: 'cherry.season',
      calories: 50,
      culinaryUse: "cherry.use",
      image: "assets/fruits/cherry.png",
      gradientColors: [const Color.fromARGB(255, 174, 5, 22), const Color.fromARGB(255, 209, 8, 88)],
    ),
    
    Fruit(name: "plum.name", type: "plum.type", origin: "plum.origin", benefits:"plum.benefits", season: "plum.season", calories: 46 , culinaryUse: "plum.use", image: "assets/fruits/plum.png", gradientColors: [const Color.fromARGB(255, 92, 0, 220), const Color.fromARGB(255, 136, 1, 82)]),
    
    Fruit(
      name: "apricot.name",
      type: "apricot.type",
      origin: "apricot.origin",
      benefits: "apricot.benefits",
      season: 'apricot.season',
      calories: 48,
      culinaryUse: "apricot.use",
      image: "assets/fruits/apricot.png",
      gradientColors: [const Color.fromARGB(255, 241, 121, 2), const Color.fromARGB(255, 247, 153, 2)],
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
          "🍑 ${"stone.title".tr()}",
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
                    const Color.fromARGB(255, 243, 207, 3),
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
