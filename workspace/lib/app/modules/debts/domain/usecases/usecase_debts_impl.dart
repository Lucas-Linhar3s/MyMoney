import 'package:workspace/app/modules/debts/domain/model/debts_model.dart';
import 'package:workspace/app/modules/debts/domain/repository/repository_debts_impl.dart';
import 'package:workspace/app/modules/debts/domain/usecases/i_usecase_debts.dart';
import 'package:workspace/app/shared/exception/custom_exceptions.dart';

class UsecaseDebtsImpl implements IUsecaseDebts {
  final RepositoryDebtsImpl _repositoryDebtsImpl = RepositoryDebtsImpl.instance;

  @override
  Future<bool> create(DebtsModel model) async {
    try {
      final map = DebtsModel.toJsonCreate(model);
      return await _repositoryDebtsImpl.create(map);
    } on CustomExceptions {
      rethrow;
    }
  }

  @override
  Future<bool> delete(String id) async {
    try {
      return await _repositoryDebtsImpl.delete(id);
    } on CustomExceptions {
      rethrow;
    }
  }

  @override
  Future<List<DebtsModel>> findByIDCards(String idCards) async {
    try {
      final response = await _repositoryDebtsImpl.findByIDCards(idCards);
      return DebtsModel.fromJsonList(response);
    } on CustomExceptions {
      rethrow;
    }
  }

  @override
  Future<List<DebtsModel>> findByIDUsers(String idUsers) async {
    try {
      final response = await _repositoryDebtsImpl.findByIDUsers(idUsers);
      return DebtsModel.fromJsonList(response);
    } on CustomExceptions {
      rethrow;
    }
  }

  @override
  Future<bool> update(DebtsModel model) async {
    try {
      final map = DebtsModel.toJsonCreate(model);
      return await _repositoryDebtsImpl.update(map);
    } on CustomExceptions {
      rethrow;
    }
  }

  @override
  Future<List<Users>> getUsers() async {
    try {
      final response = await _repositoryDebtsImpl.getUsers();
      return Users.fromJsonList(response);
    } on CustomExceptions {
      rethrow;
    }
  }

  @override
  Future<List<Cards>> getCards() async {
    try {
      final response = await _repositoryDebtsImpl.getCards();
      return Cards.fromJsonList(response);
    } on CustomExceptions {
      rethrow;
    }
  }

  @override
  Future<bool> updateParcels(DebtsModel model) async {
    try {
      final map = DebtsModel.toJsonCreate(model);
      return await _repositoryDebtsImpl.updateParcels(map);
    } on CustomExceptions {
      rethrow;
    }
  }
}
