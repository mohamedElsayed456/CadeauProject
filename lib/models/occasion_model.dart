// To parse this JSON data, do
//
//     final occasions = occasionsFromJson(jsonString);

import 'dart:convert';

OccasionsModel occasionsFromJson(String str) => OccasionsModel.fromJson(json.decode(str));

String occasionsToJson(OccasionsModel data) => json.encode(data.toJson());

class OccasionsModel {
    String message;
    Data data;
    Extra extra;

    OccasionsModel({
        required this.message,
        required this.data,
        required this.extra,
    });

    factory OccasionsModel.fromJson(Map<String, dynamic> json) => OccasionsModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
        extra: Extra.fromJson(json["extra"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
        "extra": extra.toJson(),
    };
}

class Data {
    List<OccasionType> occasionTypes;

    Data({
        required this.occasionTypes,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        occasionTypes: List<OccasionType>.from(json["occasion_types"].map((x) => OccasionType.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "occasion_types": List<dynamic>.from(occasionTypes.map((x) => x.toJson())),
    };
}

class OccasionType {
    int id;
    String name;
    String icon;
    String banner;
    String? description;
    DateTime createdAt;
    DateTime updatedAt;

    OccasionType({
        required this.id,
        required this.name,
        required this.icon,
        required this.banner,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
    });

    factory OccasionType.fromJson(Map<String, dynamic> json) => OccasionType(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        banner: json["banner"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "banner": banner,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Extra {
    int? totalCount;
    int? pageNumber;
    int? pageSize;

    Extra({
        required this.totalCount,
        required this.pageNumber,
        required this.pageSize,
    });

    factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        totalCount: json["total_count"],
        pageNumber: json["page_number"],
        pageSize: json["page_size"],
    );

    Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "page_number": pageNumber,
        "page_size": pageSize,
    };
}
