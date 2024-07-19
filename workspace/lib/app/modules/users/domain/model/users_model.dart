// ignore_for_file: public_member_api_docs, sort_constructors_first
class UsersModel {
  String? id;
  String name;
  String phone;
  UsersModel({
    this.id,
    required this.name,
    required this.phone,
  });

  static UsersModel fromJson(Map<String, dynamic> json) => UsersModel(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
      );

  static Map<String, dynamic> toJson(UsersModel model) => {
        'id': model.id,
        'name': model.name,
        'phone': model.phone,
      };

  static List<UsersModel> fromJsonList(jsonList) {
    final castedList = List.castFrom<dynamic, Map<String, dynamic>>(jsonList);
    final parsedList =
        castedList.map((map) => UsersModel.fromJson(map)).toList();
    return parsedList;
  }

  @override
  String toString() => 'UsersModel(id: $id, name: $name, phone: $phone)';
}
