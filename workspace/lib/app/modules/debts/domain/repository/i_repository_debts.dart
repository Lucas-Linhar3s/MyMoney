abstract class IRepositoryDebts {
  Future findByIDUsers(String idUsers);
  Future findByIDCards(String idCards);
  Future update(Map<String, dynamic> json);
  Future updateParcels(Map<String, dynamic> json);
  Future create(Map<String, dynamic> json);
  Future getUsers();
  Future getCards();
  Future delete(String id);
}
