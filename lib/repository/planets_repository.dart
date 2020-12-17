import 'package:project_example/model/planet.dart';

class PlanetsRepository {
  static const SVG_BASE_PATH = "assets/svg/";

  List<Planet> _fakeRepository = [
    Planet(
      name: "Earth",
      description: "Earth (1 AU from the Sun) is the largest and densest of the inner planets, the only one known to have current geological activity, and the only place where life is known to exist.[83] Its liquid hydrosphere is unique among the terrestrial planets, and it is the only planet where plate tectonics has been observed. ",
      svgPath: "${SVG_BASE_PATH}earth.svg",
    ),
    Planet(
      name: "Jupiter",
      description: "Jupiter (5.2 AU), at 318 M⊕, is 2.5 times the mass of all the other planets put together. It is composed largely of hydrogen and helium. Jupiter's strong internal heat creates semi-permanent features in its atmosphere, such as cloud bands and the Great Red Spot. Jupiter has 79 known satellites.",
      svgPath: "${SVG_BASE_PATH}jupiter.svg",
    ),
    Planet(
      name: "Mars",
      description: "Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being larger than only Mercury. In English, Mars carries the name of the Roman god of war and is often referred to as the \"Red Planet\".",
      svgPath: "${SVG_BASE_PATH}mars.svg",
    ),
    Planet(
      name: "Mercury",
      description: "Mercury (0.4 AU from the Sun) is the closest planet to the Sun and on average, all seven other planets.[75][76] The smallest planet in the Solar System (0.055 M⊕), Mercury has no natural satellites.",
      svgPath: "${SVG_BASE_PATH}mercury.svg",
    ),
    Planet(
      name: "Neptune",
      description: "Neptune (30.1 AU), though slightly smaller than Uranus, is more massive (17 M⊕) and hence more dense. It radiates more internal heat, but not as much as Jupiter or Saturn.[103] Neptune has 14 known satellites.",
      svgPath: "${SVG_BASE_PATH}neptune.svg",
    ),
    Planet(
      name: "Saturn",
      description: "Saturn (9.5 AU), distinguished by its extensive ring system, has several similarities to Jupiter, such as its atmospheric composition and magnetosphere. Although Saturn has 60% of Jupiter's volume, it is less than a third as massive, at 95 M⊕. Saturn is the only planet of the Solar System that is less dense than water.",
      svgPath: "${SVG_BASE_PATH}planet.svg",
    ),
  ];

  Future<List<Planet>> getAllPlanets() async {
    await Future.delayed(Duration(seconds: 5));
    return _fakeRepository;
  }

  List<Planet> getPlanetsByName(String nameToSearch) {
    if(nameToSearch == null)
      return [];

    return _fakeRepository
        .where((planet) => planet.name.toLowerCase().contains(nameToSearch.toLowerCase())).toList();
  }
}
