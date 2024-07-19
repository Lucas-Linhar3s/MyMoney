// ignore_for_file: public_member_api_docs, sort_constructors_first
class CardModel {
  String? id;
  String name;
  String limit;
  CardModel({
    this.id,
    required this.name,
    required this.limit,
  });

  static CardModel fromJson(Map<String, dynamic> json) => CardModel(
        id: json['id'],
        name: json['name'],
        limit: "${json['limite']}",
      );

  static Map<String, dynamic> toJson(CardModel model) => {
        'id': model.id,
        'name': model.name,
        'limite': model.limit,
      };

  static List<CardModel> fromJsonList(jsonList) {
    final castedList = List.castFrom<dynamic, Map<String, dynamic>>(jsonList);
    final parsedList =
        castedList.map((map) => CardModel.fromJson(map)).toList();
    return parsedList;
  }

  @override
  String toString() => 'UsersModel(id: $id, name: $name, limit: $limit)';
}
