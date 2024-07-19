import 'package:workspace/app/modules/debts/domain/model/debts_model.dart';

abstract class IUsecaseDebts {
  Future<List<DebtsModel>> findByIDUsers(String idUsers);
  Future<List<DebtsModel>> findByIDCards(String idCards);
  Future<bool> update(DebtsModel model);
  Future<bool> updateParcels(DebtsModel model);
  Future<bool> create(DebtsModel model);
  Future<List<Users>> getUsers();
  Future<List<Cards>> getCards();
  Future<bool> delete(String id);
}
