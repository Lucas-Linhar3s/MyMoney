import 'package:flutter/material.dart';
import 'package:workspace/app/shared/consts/consts.dart';
import 'package:workspace/app/shared/widgets/initial_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MyMoney",
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF40FFDC),
          primary: const Color(0xFF00A9D4),
          secondary: const Color(0xFF1C3166),
          tertiary: const Color(0xFF240047),
        ),
      ),
      initialRoute: initialRoute,
      routes: {
        initialRoute: (context) => const InitialPage(),
      },
    );
  }
}
