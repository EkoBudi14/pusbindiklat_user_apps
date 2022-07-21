// To parse this JSON data, do
//
//     final events = eventsFromJson(jsonString);

import 'dart:convert';

Events eventsFromJson(String str) => Events.fromJson(json.decode(str));

String eventsToJson(Events data) => json.encode(data.toJson());

class Events {
    Events({
        this.meta,
        this.data,
    });

    Meta meta;
    List<EventsDatum> data;

    factory Events.fromJson(Map<String, dynamic> json) => Events(
        meta: Meta.fromJson(json["meta"]),
        data: List<EventsDatum>.from(json["data"].map((x) => EventsDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class EventsDatum {
    EventsDatum({
        this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total,
    });

    int currentPage;
    List<DatumDatum> data;
    String firstPageUrl;
    int from;
    int lastPage;
    String lastPageUrl;
    List<Link> links;
    dynamic nextPageUrl;
    String path;
    int perPage;
    dynamic prevPageUrl;
    int to;
    int total;

    factory EventsDatum.fromJson(Map<String, dynamic> json) => EventsDatum(
        currentPage: json["current_page"],
        data: List<DatumDatum>.from(json["data"].map((x) => DatumDatum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class DatumDatum {
    DatumDatum({
        this.id,
        this.name,
        this.organizer,
        this.description,
        this.image,
        this.dateEvent,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    String organizer;
    String description;
    String image;
    DateTime dateEvent;
    DateTime createdAt;
    DateTime updatedAt;

    factory DatumDatum.fromJson(Map<String, dynamic> json) => DatumDatum(
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

class Link {
    Link({
        this.url,
        this.label,
        this.active,
    });

    String url;
    String label;
    bool active;

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
    };
}

class Meta {
    Meta({
        this.code,
        this.status,
    });

    int code;
    String status;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
    };
}
