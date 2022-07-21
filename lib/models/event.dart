class Event {
  int id;
  String name;
  String organizer;
  String description;
  String image;
  DateTime dateEvent;
  DateTime createdAt;
  DateTime updatedAt;

  Event({
    this.id,
    this.name,
    this.organizer,
    this.description,
    this.image,
    this.dateEvent,
    this.createdAt,
    this.updatedAt,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        name: json["name"],
        organizer: json["organizer"],
        description: json["description"],
        image: json["image"],
        dateEvent: DateTime.parse(json["dateEvent"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "organizer": organizer,
        "description": description,
        "image": image,
        "dateEvent": dateEvent.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
