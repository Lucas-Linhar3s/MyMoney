import 'package:workspace/app/modules/cards/domain/model/card_model.dart';

abstract class IUsecaseCards {
  Future<List<CardModel>> findAll();
  Future<List<CardModel>> findByName(String name);
  Future<bool> create(CardModel model);
  Future<bool> update(CardModel model);
  Future<bool> delete(String id);
}
