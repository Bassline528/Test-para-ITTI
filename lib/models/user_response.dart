// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

class UserResponse {
    UserResponse({
      required this.page,
      required this.perPage,
      required this.total,
      required this.totalPages,
      required this.users,
      required this.support,
    });

    int page;
    int perPage;
    int total;
    int totalPages;
    List<UserAPI> users;
    Support support;

    factory UserResponse.fromRawJson(String str) => UserResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        users: List<UserAPI>.from(json["data"].map((x) => UserAPI.fromJson(x))),
        support: Support.fromJson(json["support"]),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "support": support.toJson(),
    };
}

class Support {
    Support({
      required this.url,
      required this.text,
    });

    String url;
    String text;

    factory Support.fromRawJson(String str) => Support.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
    };
}

class UserAPI {
    UserAPI({
      required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar,
    });

    int id;
    String email;
    String firstName;
    String lastName;
    String avatar;

    factory UserAPI.fromRawJson(String str) => UserAPI.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserAPI.fromJson(Map<String, dynamic> json) => UserAPI(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
    };
}
