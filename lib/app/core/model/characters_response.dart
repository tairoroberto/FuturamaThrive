class CharactersResponse {
  List<Character>? items;

  CharactersResponse({this.items});

  CharactersResponse.fromJson(dynamic json) {
    if (json != null) {
      items = [];
      json.forEach((v) {
        items?.add(Character.fromJson(v));
      });
    }
  }
}

class Character {
  final Name? name;
  final Images? images;
  final String? gender;
  final String? species;
  final String? homePlanet;
  final String? occupation;
  final List<String>? sayings;
  final int? id;
  final String? age;

  Character({
    this.name,
    this.images,
    this.gender,
    this.species,
    this.homePlanet,
    this.occupation,
    this.sayings,
    this.id,
    this.age,
  });

  Character.fromJson(Map<String, dynamic> json)
      : name = (json['name'] as Map<String, dynamic>?) != null
            ? Name.fromJson(json['name'] as Map<String, dynamic>)
            : null,
        images = (json['images'] as Map<String, dynamic>?) != null
            ? Images.fromJson(json['images'] as Map<String, dynamic>)
            : null,
        gender = json['gender'] as String?,
        species = json['species'] as String?,
        homePlanet = json['homePlanet'] as String?,
        occupation = json['occupation'] as String?,
        sayings = (json['sayings'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        id = json['id'] as int?,
        age = json['age'] as String?;

  Map<String, dynamic> toJson() => {
        'name': name?.toJson(),
        'images': images?.toJson(),
        'gender': gender,
        'species': species,
        'homePlanet': homePlanet,
        'occupation': occupation,
        'sayings': sayings,
        'id': id,
        'age': age
      };
}

class Name {
  final String? first;
  final String? middle;
  final String? last;

  Name({
    this.first,
    this.middle,
    this.last,
  });

  Name.fromJson(Map<String, dynamic> json)
      : first = json['first'] as String?,
        middle = json['middle'] as String?,
        last = json['last'] as String?;

  Map<String, dynamic> toJson() =>
      {'first': first, 'middle': middle, 'last': last};
}

class Images {
  final String? headShot;
  final String? main;

  Images({
    this.headShot,
    this.main,
  });

  Images.fromJson(Map<String, dynamic> json)
      : headShot = json['head-shot'] as String?,
        main = json['main'] as String?;

  Map<String, dynamic> toJson() => {'head-shot': headShot, 'main': main};
}
