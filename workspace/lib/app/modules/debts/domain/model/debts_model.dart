// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class DebtsModel {
  String? id;
  String description;
  double value;
  String parcels;
  int is_paid;
  String id_card;
  String id_user;
  String? name_user;
  String? name_card;
  double? value_total;
  DebtsModel({
    this.id,
    required this.description,
    required this.value,
    required this.parcels,
    required this.is_paid,
    required this.id_card,
    required this.id_user,
    this.name_user,
    this.name_card,
    this.value_total,
  });
  static DebtsModel fromJson(Map<String, dynamic> json) => DebtsModel(
        id: json['id'],
        description: json['description'] ?? "",
        value: json['value'] ?? 0.0,
        parcels: json['parcels'] ?? "",
        is_paid: json['is_paid'] ?? 0,
        id_card: json['id_card'] ?? "",
        id_user: json['id_user'] ?? "",
        name_user: json['name_user'] ?? "",
        name_card: json['name_card'] ?? "",
        value_total: json['value_total'] ?? 0.0,
      );

  static Map<String, dynamic> toJson(DebtsModel model) => {
        'id': model.id ?? "",
        'description': model.description,
        'value': model.value,
        'parcels': model.parcels,
        'is_paid': model.is_paid,
        'id_card': model.id_card,
        'id_user': model.id_user,
        "name_card": model.name_card ?? "",
      };

  static List<DebtsModel> fromJsonList(jsonList) {
    final castedList = List.castFrom<dynamic, Map<String, dynamic>>(jsonList);
    final parsedList =
        castedList.map((map) => DebtsModel.fromJson(map)).toList();
    return parsedList;
  }

  @override
  String toString() {
    return 'DebtsModel(id: $id, description: $description, value: $value, parcels: $parcels, is_paid: $is_paid, id_card: $id_card, id_user: $id_user, name_user: $name_user, name_card: $name_card, value_total: $value_total)';
  }
}

class Users {
  String? id;
  String name;
  String phone;
  Users({
    this.id,
    required this.name,
    required this.phone,
  });

  static Users fromJson(Map<String, dynamic> json) => Users(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
      );

  static List<Users> fromJsonList(jsonList) {
    final castedList = List.castFrom<dynamic, Map<String, dynamic>>(jsonList);
    final parsedList = castedList.map((map) => Users.fromJson(map)).toList();
    return parsedList;
  }

  @override
  String toString() => 'UsersModel(id: $id, name: $name, phone: $phone)';
}

class Cards {
  String? id;
  String name;
  double limit;
  Cards({
    this.id,
    required this.name,
    required this.limit,
  });

  static Cards fromJson(Map<String, dynamic> json) => Cards(
        id: json['id'],
        name: json['name'],
        limit: json['limite'] ?? 0.0,
      );

  static List<Cards> fromJsonList(jsonList) {
    final castedList = List.castFrom<dynamic, Map<String, dynamic>>(jsonList);
    final parsedList = castedList.map((map) => Cards.fromJson(map)).toList();
    return parsedList;
  }

  @override
  String toString() => 'Cards(id: $id, name: $name, phone: $limit)';
}
