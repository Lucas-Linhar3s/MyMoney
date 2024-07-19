abstract class IRepositoryUsers {
  Future findAll();
  Future findByName(String name);
  Future create(Map<String, dynamic> json);
  Future update(Map<String, dynamic> json);
  Future delete(String id);
}
