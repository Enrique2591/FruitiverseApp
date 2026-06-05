# fruit_app

# Fruitiverse

Aplicació desenvolupada amb Flutter per a consultar informació detallada sobre diferents tipus de fruites de manera visual i interactiva.

##  Descripció

Fruitiverse és una aplicació mòbil educativa que permet explorar diferents categories de fruites i consultar informació rellevant sobre cadascuna d'elles:

- Origen
- Tipus
- Beneficis 
- Temporada
- Calories
- Us

L'aplicació funciona completament de manera local sense necessitat de connexió a Internet.

---

##  Característiques

### Pantalla inicial
- Logo Fruitiverse
- Botó d'exploració
- Botó d'eixida
- Disseny amb gradients moderns

### Catàleg de categories
- Fruites cítriques
- Fruites tropicals
- Fruits del bosc
- Fruites d'os
- Fruites de llavor

### Fitxes de fruites
Cada fruita mostra:

- Nom
- Imatge
- Origen
- Tipus
- Beneficis
- Temporada
- Calories
- Ús 

### Funcionalitats addicionals
-  Canvi d'idioma (Espanyol / Anglés)
-  Mode fosc
-  Gradients personalitzats per categoria

---

##  Arquitectura del projecte

assets/
|__ fruits
|__translation/
   |__en.json
   |__es.json
logo.png
|
lib/
│
├── models/
│   └── fruit.dart
│
├── screens/
│   ├── forestFruit.dart
│   ├── fruit_screen.dart
│   ├── fruit_type.dart
│   ├── home_screen.dart
│   ├── pome_screen.dart
│   ├── stone_screen.dart
│   └── tropical_screen.dart
│
├── widgets/
│   └── fruit_card.dart
│
└── main.dart
```

---

##  Tecnologies utilitzades

- Flutter
- Dart
- Easy Localization
- Google Fonts
- Material Design


## Recursos

### Imatges
Les imatges de les fruites es troben a:

assets/fruits/
```

## Traduccions

assets/translation/
```

Idiomes disponibles:

- 🇪🇸 Espanyol
- 🇬🇧 Anglés

---


##  Autor

Projecte desenvolupat per:

**[Enrique Sorrenti Costa]**

CFGS Desenvolupament d'Aplicacions Multiplataforma (DAM)

Curs 2025-2026

---




