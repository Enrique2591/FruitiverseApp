import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fruit_app/screens/forestFruit.dart';
import 'package:fruit_app/screens/pome_screen.dart';
import 'package:fruit_app/screens/stone_screen.dart';
import 'package:fruit_app/screens/tropical_screen.dart';
import 'fruit_screen.dart'; 

class Category {
  final String titleKey;
  final String image;
  final List<Color> gradient;

  Category({
    required this.titleKey,
    required this.image,
    required this.gradient,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDarkMode = false;

  Widget _buildCard(Category category) {
    return GestureDetector(
      onTap: () {
        if (category.titleKey == "citrus"  ) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FruitScreen(),
            ),
          );
        } else if (category.titleKey == "tropical"){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TropicalScreen(),

            ),
          );
        } else if(category.titleKey == "berries"){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context)=> const ForestFruitScreen()
              )
          );
        } else if (category.titleKey == "stone"){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context)=> const StoneScreen()
            )
          );

        } else if (category.titleKey == "pome"){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context)=> const PomeScreen ()
            )
          );

        }
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: category.gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              blurRadius: 6,
              offset: Offset(0, 4),
              color: Colors.black26,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(category.image, fit: BoxFit.contain),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category.titleKey.tr(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      Category(
        titleKey: "citrus",
        image: "assets/fruits/citrus.png",
        gradient: const [
          Color.fromARGB(255, 246, 255, 0),
          Color.fromARGB(255, 141, 255, 34),
        ],
      ),
      Category(
        titleKey: "tropical",
        image: "assets/fruits/tropical.png",
        gradient: const [
          Color.fromARGB(255, 8, 203, 233),
          Color.fromARGB(255, 0, 250, 71),
        ],
      ),
      Category(
        titleKey: "berries",
        image: "assets/fruits/berries.png",
        gradient: const [Colors.purple, Colors.pink],
      ),
      Category(
        titleKey: "stone",
        image: "assets/fruits/stone.png",
        gradient: const [Colors.orangeAccent, Colors.redAccent],
      ),
      Category(
        titleKey: "pome",
        image: "assets/fruits/uva.png",
        gradient: const [
          Color.fromARGB(255, 103, 223, 244),
          Color.fromARGB(255, 82, 125, 216),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: _isDarkMode ? Colors.white : Colors.black,
        ),
        title: Text(
          "🍇${"app_title".tr()}",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
            color: _isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language, color: Colors.white),
            onSelected: (locale) {
              context.setLocale(locale);
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: Locale('es'), child: Text("🇪🇸 Español")),
              PopupMenuItem(value: Locale('en'), child: Text("🇬🇧 English")),
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
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _isDarkMode
                ? [Colors.black, Colors.grey.shade900]
                : [
                    const Color.fromARGB(255, 4, 232, 239),
                    const Color.fromARGB(255, 21, 143, 236),
                  ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 100, 12, 12),
          child: GridView.builder(
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (context, index) {
              final category = categories[index];

              if (category.titleKey == "pome") {
                return Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: _buildCard(category),
                  ),
                );
              }

              return _buildCard(category);
            },
          ),
        ),
      ),
    );
  }
}