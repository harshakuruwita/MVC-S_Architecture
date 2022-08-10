import 'dart:convert';

class AuthRequestSerializer {
  AuthRequestSerializer({
    required this.email,
  });
  late final String email;
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    return _data;
  }
}

class AuthResponseSerializer {
  AuthResponseSerializer({
    this.accessToken,
    this.refreshToken,
    this.errorType,
    this.message,
  });

  final dynamic accessToken;
  final dynamic refreshToken;
  final dynamic errorType;
  final dynamic message;

  factory AuthResponseSerializer.fromJson(dynamic json) =>
      AuthResponseSerializer(
        accessToken: json["access_token"] == null ? null : json["access_token"],
        refreshToken:
            json["refresh_token"] == null ? null : json["refresh_token"],
        errorType: json["error_type"] == null ? null : json["error_type"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken == null ? null : accessToken,
        "refresh_token": refreshToken == null ? null : refreshToken,
        "error_type": errorType == null ? null : errorType,
        "message": message == null ? null : message,
      };
}
