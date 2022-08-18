import 'User.dart';

class Data {
  late User user;
  late String accessToken;
  late String refreshToken;

  Data({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  Data.fromJson(dynamic json) {
    user = json['user'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['user'] = user.toMap();
    map['accessToken'] = accessToken;
    map['refreshToken'] = refreshToken;
    return map;
  }
}
