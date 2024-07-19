// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:workspace/app/modules/users/presenter/store/list_users_store/list_users_store.dart';
import 'package:workspace/app/modules/users/presenter/ui/widgets/details_users.dart';

class UsersDetailsPage extends StatefulWidget {
  String id;
  String name;
  String phone;
  ListUsersStore listUsersStore;
  UsersDetailsPage({
    super.key,
    required this.id,
    required this.name,
    required this.phone,
    required this.listUsersStore,
  });

  @override
  State<UsersDetailsPage> createState() => _UsersDetailsPageState();
}

class _UsersDetailsPageState extends State<UsersDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return DetailsUsers(
      idUser: widget.id,
      name: widget.name,
      phone: widget.phone,
      listUsersStore: widget.listUsersStore,
    );
  }
}
