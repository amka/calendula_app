import '../app_config.dart';

class User {
  final String? id;
  final String? avatar;
  final String? collectionId;
  final String? collectionName;
  final DateTime? created;
  final String? email;
  final bool? emailVisibility;
  final String? name;
  final DateTime? updated;
  final String? username;
  final bool? verified;

  User({
    this.avatar,
    this.collectionId,
    this.collectionName,
    this.created,
    this.email,
    this.emailVisibility,
    this.id,
    this.name,
    this.updated,
    this.username,
    this.verified,
  });

  String? get avatarUrl =>
      '${AppConfig.baseApiUrl}/api/files/users/$id/$avatar';

  factory User.fromJson(Map<String, dynamic> json) => User(
        avatar: json["avatar"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        email: json["email"],
        emailVisibility: json["emailVisibility"],
        id: json["id"],
        name: json["name"],
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        username: json["username"],
        verified: json["verified"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": created?.toIso8601String(),
        "email": email,
        "emailVisibility": emailVisibility,
        "id": id,
        "name": name,
        "updated": updated?.toIso8601String(),
        "username": username,
        "verified": verified,
      };
}

class CreateMemberRequest {
  final String? organizationId;
  final String? teamId;
  final String name;
  final String email;
  final String? password;

  CreateMemberRequest({
    required this.name,
    required this.email,
    this.organizationId,
    this.teamId,
    this.password,
  });
}
