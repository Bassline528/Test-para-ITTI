import 'dart:convert';

class UserDB {
  UserDB({
      this.id,
      required this.name,
      required this.birth,
      required this.sex
    });

    int? id;
    String name;
    String birth;
    String sex;

    factory UserDB.fromJson(String str) => UserDB.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserDB.fromMap(Map<String, dynamic> json) => UserDB(
        id: json["id"],
        name: json["name"],
        birth: json["birth"],
        sex: json['sex']
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "birth": birth,
        'sex': sex
    };

}