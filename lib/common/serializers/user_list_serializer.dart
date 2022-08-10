class UserListSerializer {
  UserListSerializer({
    required this.users,
    required this.total,
  });
  late final List<Users> users;
  late final int total;

  UserListSerializer.fromJson(Map<String, dynamic> json) {
    users = List.from(json['users'] as List)
        .map((e) => Users.fromJson(e as Map<String, dynamic>))
        .toList();
    total = json['total'] as int;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['users'] = users.map((e) => e.toJson()).toList();
    _data['total'] = total;
    return _data;
  }
}

class Users {
  Users({
    required this.id,
    required this.name,
    required this.gender,
    required this.status,
    required this.partnerId,
    required this.createdAt,
  });
  late final String id;
  late final String name;
  late final String gender;
  late final String status;
  late final String partnerId;
  late final String createdAt;

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    name = json['name'] as String;
    gender = json['gender'] as String;
    status = json['status'] as String;
    partnerId = json['partner_id'] as String;
    createdAt = json['created_at'] as String;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['gender'] = gender;
    _data['status'] = status;
    _data['partner_id'] = partnerId;
    _data['created_at'] = createdAt;
    return _data;
  }
}
