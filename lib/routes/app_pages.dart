import 'package:faturcodetestnttflutter/pages/home_page/home_page.dart';
import 'package:faturcodetestnttflutter/pages/undefined_route/undefined_route_page.dart';
import 'package:flutter/cupertino.dart';

part 'app_routes.dart';

class AppPages {
  static const initialPAGE = Routes.homePAGE;

  static Route<dynamic> generateRoute(final RouteSettings settings) {
    ///arguments digunakan jika dari page 1 ke page lain melempar data
    final arguments =
        (settings.arguments ?? <String, dynamic>{}) as Map<String, dynamic>;

    return CupertinoPageRoute(
      builder: (context) {
        switch (settings.name) {
          case Routes.homePAGE:
            return const HomePage();
        }

        return UndefinedRoutePage(settings.name ?? '');
      },
    );
  }
}
