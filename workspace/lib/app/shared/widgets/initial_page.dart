import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:workspace/app/modules/cards/presenter/ui/pages/cards_page.dart';
import 'package:workspace/app/modules/debts/presenter/store/create_debts_store/create_debts_store.dart';
import 'package:workspace/app/modules/debts/presenter/store/list_debts_store/list_debts_store.dart';
import 'package:workspace/app/modules/debts/presenter/ui/widgets/custom_bottom_sheet_debts.dart';
import 'package:workspace/app/modules/users/presenter/ui/pages/users_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  ListDebtsStore list = ListDebtsStore();
  CreateDebtsStore create = CreateDebtsStore();
  int currentIndex = 1;
  bool loading = true;
  List<Widget> pages = [
    const UsersPage(),
    const CardsPage(),
  ];
  @override
  initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: loading
            ? FlutterSplashScreen.gif(
                backgroundColor: const Color(0xFFC0D8D8),
                gifPath: 'assets/images/iconApp.gif',
                gifWidth: MediaQuery.sizeOf(context).width,
                gifHeight: MediaQuery.sizeOf(context).height,
                duration: const Duration(milliseconds: 3515),
                onInit: () async {
                  debugPrint("onInit");
                },
                onEnd: () async {
                  debugPrint("onEnd 1");
                },
              )
            : Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 110,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xFFC0D8D8),
                    child: pages[currentIndex],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Card(
                        elevation: 10,
                        color: Colors.transparent,
                        child: Container(
                          width: 220,
                          height: 55,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: Color(0xFFC0D8D8),
                          ),
                          clipBehavior: Clip.none,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        currentIndex = 0;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.person,
                                      color: currentIndex == 0
                                          ? const Color(0xFFF07848)
                                          : const Color(0xFF848484),
                                      size: currentIndex == 0 ? 35 : 30,
                                    )),
                              ),
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: const Color(0xFFF07848),
                                child: IconButton(
                                    onPressed: () {
                                      list.getUsers();
                                      list.getCards();
                                      create.description = "";
                                      create.valueDebt = 0.0;
                                      create.isPaid = 0;
                                      create.parcels = "";
                                      create.idCard = "";
                                      create.idUser = "";
                                      list.loading = false;
                                      list.selectCard = null;
                                      list.selectUser = null;
                                      CustomBottomSheetDebts().get(
                                        context,
                                        create,
                                        list,
                                      );
                                    },
                                    icon: const Icon(Icons.add,
                                        color: Colors.white)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        currentIndex = 1;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.credit_card,
                                      color: currentIndex == 1
                                          ? const Color(0xFFF07848)
                                          : const Color(0xFF848484),
                                      size: currentIndex == 1 ? 35 : 30,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
