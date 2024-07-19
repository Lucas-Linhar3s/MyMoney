import 'package:flutter/material.dart';
import 'package:workspace/app/modules/cards/presenter/store/list_cards_store/list_cards_store.dart';
import 'package:workspace/app/modules/cards/presenter/ui/widgets/card_list_Cards.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  final ListCardsStore listCardsStore = ListCardsStore();
  @override
  Widget build(BuildContext context) {
    return CardListCards(
      listCardsStore: listCardsStore,
    );
  }
}
