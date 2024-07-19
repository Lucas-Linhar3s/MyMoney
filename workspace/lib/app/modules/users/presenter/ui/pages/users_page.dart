import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:workspace/app/modules/users/presenter/store/list_users_store/list_users_store.dart';
import 'package:workspace/app/modules/users/presenter/ui/pages/users_details_page.dart';
import 'package:workspace/app/modules/users/presenter/ui/widgets/card_list_users.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final ListUsersStore _listUsersStore = ListUsersStore();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return _listUsersStore.details
            ? UsersDetailsPage(
                id: _listUsersStore.idUser,
                name: _listUsersStore.nameUsers,
                phone: _listUsersStore.phone,
                listUsersStore: _listUsersStore,
              )
            : CardListUsers(
                listUsersStore: _listUsersStore,
              );
      },
    );
  }
}
