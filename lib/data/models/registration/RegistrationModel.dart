import 'Data.dart';

class RegistrationModel {
  late String type;
  late String message;
  late Data data;

  RegistrationModel({
    required this.type,
    required this.message,
    required this.data,
  });

  RegistrationModel.fromJson(dynamic json) {
    type = json['type'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['message'] = message;
    map['data'] = data.toMap();
    return map;
  }
}
