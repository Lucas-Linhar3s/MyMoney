import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:workspace/app/modules/cards/presenter/store/list_cards_store/list_cards_store.dart';
import 'package:workspace/app/modules/debts/presenter/store/list_debts_store/list_debts_store.dart';

class ShowFilter {
  get(BuildContext context, ListCardsStore listCardsStore,
      ListDebtsStore listDebtsStore) async {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(child: Observer(
          builder: (_) {
            return Container(
              width: 400,
              height: 250,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: listCardsStore.cards.isEmpty
                    ? [
                        Image.asset(
                          'assets/images/no_content.jpg',
                          alignment: Alignment.center,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.fill,
                        ),
                      ]
                    : List.generate(
                        listCardsStore.cards.length,
                        (index) {
                          return Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 0, top: 10),
                              child: Card(
                                child: ListTile(
                                  onTap: () {
                                    listDebtsStore.getdebtsByCard(listCardsStore
                                        .cards[index].id
                                        .toString());
                                    listDebtsStore.filter = true;
                                    Navigator.pop(context);
                                  },
                                  title: Text(listCardsStore.cards[index].name,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xFF131313))),
                                  enabled: true,
                                  isThreeLine: false,
                                  leading: const Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: CircleAvatar(
                                      child: Icon(Icons.credit_card,
                                          color: Color(0xFF848484), size: 30),
                                    ),
                                  ),
                                ),
                              ));
                        },
                      ),
              ),
            );
          },
        ));
      },
    );
  }
}
