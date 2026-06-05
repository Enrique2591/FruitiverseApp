import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 10, 233, 17),
                Color.fromARGB(255, 5, 95, 229),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', height: 200),
              const SizedBox(height: 20),
              Text(
                "Fruitiverse".tr(),
                style: GoogleFonts.pacifico(
                  fontSize: 48,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/fruits');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  backgroundColor: Colors.orange,
                  side: const BorderSide(color: Colors.white, width: 2),
                ),
                child: Text(
                  'explore'.tr(),
                  style: GoogleFonts.pacifico(fontSize: 28, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  backgroundColor: Colors.red,
                  side: const BorderSide(color: Colors.white, width: 2),
                ),
                child: Text(
                  'exit'.tr(),
                  style: GoogleFonts.pacifico(fontSize: 28, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}