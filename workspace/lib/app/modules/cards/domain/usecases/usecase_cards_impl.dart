import 'package:workspace/app/modules/cards/domain/model/card_model.dart';
import 'package:workspace/app/modules/cards/domain/repository/repository_cards_impl.dart';
import 'package:workspace/app/modules/cards/domain/usecases/i_usecase_cards.dart';
import 'package:workspace/app/shared/exception/custom_exceptions.dart';

class UsecaseCardsImpl implements IUsecaseCards {
  final RepositoryCardsImpl _repositoryCardsImpl = RepositoryCardsImpl.instance;

  @override
  Future<bool> create(CardModel model) async {
    try {
      final map = CardModel.toJson(model);
      return await _repositoryCardsImpl.create(map);
    } on CustomExceptions {
      rethrow;
    }
  }

  @override
  Future<bool> delete(String id) async {
    try {
      return await _repositoryCardsImpl.delete(id);
    } on CustomExceptions {
      rethrow;
    }
  }

  @override
  Future<List<CardModel>> findAll() async {
    try {
      List<Map<String, dynamic>> data = [];
      final response = await _repositoryCardsImpl.findAll();
      for (var i = 0; i < response.length; i++) {
        if (response[i]["limite"] == null) {
          data.add({
            "id": response[i]["id"],
            "name": response[i]["name"],
            "limite": "0.00"
          });
        } else {
          data.add({
            "id": response[i]["id"],
            "name": response[i]["name"],
            "limite": response[i]["limite"]
          });
        }
      }
      return CardModel.fromJsonList(data);
    } on CustomExceptions {
      rethrow;
    }
  }

  @override
  Future<List<CardModel>> findByName(String name) async {
    try {
      final response = await _repositoryCardsImpl.findByName(name);
      return CardModel.fromJsonList(response);
    } on CustomExceptions {
      rethrow;
    }
  }

  @override
  Future<bool> update(CardModel model) async {
    try {
      final map = CardModel.toJson(model);
      return await _repositoryCardsImpl.update(map);
    } on CustomExceptions {
      rethrow;
    }
  }
}
