import 'dart:convert';

class Events {
  String id="";
  String title="";
  String announce_date="";
  List<Venue> venue;
  List<Performers> performers;

  Events({
    required this.id,
    required this.title,
    required this.announce_date,
    required this.venue,
    required this.performers,
  });

  factory Events.fromJson(String str) => Events.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Events.fromMap(Map<String, dynamic> json) => Events(
    id: json["id"],
    title: json["title"],
    announce_date: json["announce_date"],
    venue: List<Venue>.from(json["venue"].map((x) => Venue.fromMap(x))),
    performers: List<Performers>.from(json["venue"].map((x) => Performers.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "announce_date": announce_date,
    "venue": List<dynamic>.from(venue.map((x) => x.toMap())),
    "performers": List<dynamic>.from(performers.map((x) => x.toMap())),
  };
}

class Venue {
  String id="";
  String state="";
  String name="";
  String country="";

  Venue({
    required this.id,
    required this.state,
    required this.name,
    required this.country,
  });

  factory Venue.fromJson(String str) => Venue.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Venue.fromMap(Map<String, dynamic> json) => Venue(
    id: json["id"],
    state: json["state"],
    name: json["name"],
    country: json["country"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "state": state,
    "name": name,
    "country": country,
  };
}

class Performers {
  String id="";
  late List<Images> images;

  Performers({
    required this.id,
    required this.images,
  });

  factory Performers.fromJson(String str) => Performers.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Performers.fromMap(Map<String, dynamic> json) => Performers(
    id: json["id"],
    images: List<Images>.from(json["images"].map((x) => Images.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "images": List<dynamic>.from(images.map((x) => x.toMap())),
  };
}

class Images {
  String id="";
  String image="";

  Images({
    required this.id,
    required this.image,
  });

  factory Images.fromJson(String str) => Images.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Images.fromMap(Map<String, dynamic> json) => Images(
    id: json["id"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "image": image,
  };
}