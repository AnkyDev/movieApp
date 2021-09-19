// To parse this JSON data, do
//
//     final Welcome2 = Welcome2FromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

Welcome2 Welcome2FromJson(String str) => Welcome2.fromJson(json.decode(str));

String Welcome2ToJson(Welcome2 data) => json.encode(data.toJson());

class Welcome2 {
    Welcome2({
       required this.id,
       required this.results,
    });

    int id;
    List<Result> results;

    factory Welcome2.fromJson(Map<String, dynamic> json) => Welcome2(
        id: json["id"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
       required this.iso6391,
       required this.iso31661,
       required this.name,
       required this.key,
       required this.publishedAt,
       required this.site,
       required this.size,
       required this.type,
       required this.official,
       required this.id,
    });

    String iso6391;
    String iso31661;
    String name;
    String key;
    DateTime publishedAt;
    String site;
    int size;
    String type;
    bool official;
    String id;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        publishedAt: DateTime.parse(json["published_at"]),
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "key": key,
        "published_at": publishedAt.toIso8601String(),
        "site": site,
        "size": size,
        "type": type,
        "official": official,
        "id": id,
    };
}
