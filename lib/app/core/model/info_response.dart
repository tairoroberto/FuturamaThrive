class InfoResponse {
  List<Info>? items;

  InfoResponse({this.items});

  InfoResponse.fromJson(dynamic json) {
    if (json != null) {
      items = [];
      json.forEach((v) {
        items?.add(Info.fromJson(v));
      });
    }
  }
}

class Info {
  final String? synopsis;
  final String? yearsAired;
  final List<Creators>? creators;
  final int? id;

  Info({
    this.synopsis,
    this.yearsAired,
    this.creators,
    this.id,
  });

  Info.fromJson(Map<String, dynamic> json)
      : synopsis = json['synopsis'] as String?,
        yearsAired = json['yearsAired'] as String?,
        creators = (json['creators'] as List?)
            ?.map((dynamic e) => Creators.fromJson(e as Map<String, dynamic>))
            .toList(),
        id = json['id'] as int?;

  Map<String, dynamic> toJson() => {
        'synopsis': synopsis,
        'yearsAired': yearsAired,
        'creators': creators?.map((e) => e.toJson()).toList(),
        'id': id
      };
}

class Creators {
  final String? name;
  final String? url;

  Creators({
    this.name,
    this.url,
  });

  Creators.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}
