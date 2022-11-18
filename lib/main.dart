import 'package:faturcodetestnttflutter/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'injection_container.dart' as get_it;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await get_it.init();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Test NTT FE Flutter',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Color(0xFF525252),
          ),
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Color(0xFF525252),
          ),
        ),
      ),
      onGenerateRoute: AppPages.generateRoute,
      initialRoute: AppPages.initialPAGE,
      navigatorKey: get_it.sl<GlobalKey<NavigatorState>>(),
    );
  }
}
