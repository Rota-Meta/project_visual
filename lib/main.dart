import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Developer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              double imageHeight = ((constraints.maxHeight - 20) / 3) * 0.9;
              double imageWidth = constraints.maxWidth * 0.9;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AnimalsPage()),
                      );
                    },
                    child: buildImageStack(
                      imagePath: 'assets/hayvanlar.jpg',
                      label: 'Animals',
                      imageHeight: imageHeight,
                      imageWidth: imageWidth,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BodyPage()),
                      );
                    },
                    child: buildImageStack(
                      imagePath: 'assets/vucudumuz.jpg',
                      label: 'Body',
                      imageHeight: imageHeight,
                      imageWidth: imageWidth,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PlanetPage()),
                      );
                    },
                    child: buildImageStack(
                      imagePath: 'assets/gezegenler.jpg',
                      label: 'Planet',
                      imageHeight: imageHeight,
                      imageWidth: imageWidth,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Stack buildImageStack({
    required String imagePath,
    required String label,
    required double imageHeight,
    required double imageWidth,
  }) {
    return Stack(
      children: [
        Container(
          height: imageHeight,
          width: imageWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 48,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 20.0,
                    color: Colors.black.withOpacity(0.9),
                    offset: const Offset(5.0, 5.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AnimalsPage extends StatelessWidget {
  const AnimalsPage({super.key});

  final List<Map<String, String>> animalData = const [
    {'image': 'assets/aslan.jpg', 'url': 'https://www.rotameta.com/models/animals/lion/'},
    {'image': 'assets/at.jpg', 'url': 'https://www.rotameta.com/models/animals/horse/'},
    {'image': 'assets/ayi.jpg', 'url': 'https://www.rotameta.com/models/animals/bear/'},
    {'image': 'assets/balik.jpg', 'url': 'https://rotameta.com/models/animals/fish/'},
    {'image': 'assets/fil.jpg', 'url': 'https://rotameta.com/models/animals/elephant/'},
    {'image': 'assets/inek.jpg', 'url': 'https://www.rotameta.com/models/animals/cow/'},
    {'image': 'assets/kaplumbaga.jpg', 'url': 'https://www.rotameta.com/models/animals/tortoise/'},
    {'image': 'assets/kedi.jpg', 'url': 'https://rotameta.com/models/animals/white-cat/'},
    {'image': 'assets/kelebek.jpg', 'url': 'https://rotameta.com/models/animals/butterfly/'},
    {'image': 'assets/kopek.jpg', 'url': 'https://www.rotameta.com/models/animals/dog/'},
    {'image': 'assets/penguen.jpg', 'url': 'https://www.rotameta.com/models/animals/penguin/'},
    {'image': 'assets/yengec.jpg', 'url': 'https://www.rotameta.com/models/animals/crab/'},
    {'image': 'assets/yunus.jpg', 'url': 'https://www.rotameta.com/models/animals/dolphin/'},
    {'image': 'assets/zebra.jpg', 'url': 'https://www.rotameta.com/models/animals/zebra/'},
    {'image': 'assets/zurafa.jpg', 'url': 'https://www.rotameta.com/models/animals/giraffe/'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animals'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 resim sütunlu grid
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: animalData.length,
        itemBuilder: (context, index) {
          final animal = animalData[index];
          return GestureDetector(
            onTap: () async {
              final url = animal['url'];
              if (await canLaunch(url!)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  animal['image']!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class BodyPage extends StatelessWidget {
  const BodyPage({super.key});

  final List<Map<String, String>> bodyData = const [
    {'image': 'assets/akciger.jpg', 'url': 'https://rotameta.com/models/body/lung/'},
    {'image': 'assets/beyin.jpg', 'url': 'https://www.rotameta.com/models/school/brain/'},
    {'image': 'assets/bobrek.jpg', 'url': 'https://rotameta.com/models/body/kidney/'},
    {'image': 'assets/damar_sistemi.jpg', 'url': 'https://rotameta.com/models/body/vessel-system/'},
    {'image': 'assets/deri.jpg', 'url': 'https://rotameta.com/models/body/skin/'},
    {'image': 'assets/dis.jpg', 'url': 'https://rotameta.com/models/body/tooth/'},
    {'image': 'assets/goz.jpg', 'url': 'https://rotameta.com/models/body/eye/'},
    {'image': 'assets/hucre.jpg', 'url': 'https://rotameta.com/models/body/cell/'},
    {'image': 'assets/iskelet.jpg', 'url': 'https://www.rotameta.com/models/school/skeleton/'},
    {'image': 'assets/kalp.jpg', 'url': 'https://rotameta.com/models/kalp.html'},
    {'image': 'assets/karaciger.jpg', 'url': 'https://rotameta.com/models/body/liver/'},
    {'image': 'assets/kulak.jpg', 'url': 'https://rotameta.com/models/body/ear/'},
    {'image': 'assets/mide.jpg', 'url': 'https://rotameta.com/models/body/stomach/'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 resim sütunlu grid
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: bodyData.length,
        itemBuilder: (context, index) {
          final body = bodyData[index];
          return GestureDetector(
            onTap: () async {
              final url = body['url'];
              if (await canLaunch(url!)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  body['image']!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PlanetPage extends StatelessWidget {
  const PlanetPage({super.key});

  final List<Map<String, String>> planetData = const [
    {'image': 'assets/ay.jpg', 'url': 'https://www.rotameta.com/models/school/planets/moon/', 'label': 'Moon'},
    {'image': 'assets/dunya.jpg', 'url': 'https://www.rotameta.com/models/school/planets/earth/', 'label': 'Earth'},
    {'image': 'assets/gunes.jpg', 'url': 'https://www.rotameta.com/models/school/planets/sun/', 'label': 'Sun'},
    {'image': 'assets/gunes_sistemi.jpg', 'url': 'https://rotameta.com/models/school/planets/solarsystem/', 'label': 'Solarsystem'},
    {'image': 'assets/jupiter.jpg', 'url': 'https://www.rotameta.com/models/school/planets/jupiter/', 'label': 'Jupiter'},
    {'image': 'assets/mars.jpg', 'url': 'https://www.rotameta.com/models/school/planets/mars/', 'label': 'Mars'},
    {'image': 'assets/merkur.jpg', 'url': 'https://www.rotameta.com/models/school/planets/mercury/', 'label': 'Mercury'},
    {'image': 'assets/neptun.jpg', 'url': 'https://www.rotameta.com/models/school/planets/neptune/', 'label': 'Neptune'},
    {'image': 'assets/pluton.jpg', 'url': 'https://www.rotameta.com/models/school/planets/pluto/', 'label': 'Pluto'},
    {'image': 'assets/saturn.jpg', 'url': 'https://www.rotameta.com/models/school/planets/saturn/', 'label': 'Saturn'},
    {'image': 'assets/uranus.jpg', 'url': 'https://www.rotameta.com/models/school/planets/uranus/', 'label': 'Uranus'},
    {'image': 'assets/venus.jpg', 'url': 'https://www.rotameta.com/models/school/planets/venus/', 'label': 'Venus'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Planets'),
        ),
        body: GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 resim sütunlu grid
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: planetData.length,
            itemBuilder: (context, index) {
              final planet = planetData[index];
              return GestureDetector(
                onTap: () async {
                  final url = planet['url'];
                  if (await canLaunch(url!)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          planet['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned(
                        bottom: 4.0,
                        left: 8.0,
                        right: 8.0,
                        child: Text(
                          planet['label']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 20.0,
                                color: Colors.black,
                                offset: Offset(4.0, 4.0),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            ),
        );
    }
}
