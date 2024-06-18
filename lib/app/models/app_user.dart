import 'package:pocketbase/pocketbase.dart';

class AppUser {
  String id;
  String email;
  String? name;
  String? userName;
  bool emailVisibility;
  String? avatar;

  AppUser({
    required this.id,
    required this.email,
    this.name,
    this.userName,
    required this.emailVisibility,
    this.avatar,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json["id"],
      email: json["email"],
      name: json["name"],
      userName: json["user_name"],
      emailVisibility: json["email_visibility"],
      avatar: json["avatar"],
    );
  }

  factory AppUser.fromRecord(RecordModel record) =>
      AppUser.fromJson(record.toJson());
}
