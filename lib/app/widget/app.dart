import 'package:flutter/material.dart';
import 'package:theming_flutter/app/route/app_routes.dart';
import 'package:theming_flutter/app/widget/app_theme_manager.dart';
import 'package:theming_flutter/main/widget/main_page.dart';
import 'package:theming_flutter/theme/widget/app_theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _navKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _initializeNavKey();
  }

  void _initializeNavKey() async {
    while (_navKey.currentState == null) {
      await Future.delayed(const Duration(milliseconds: 25));
    }
    await _navKey.currentState?.pushReplacementNamed(AppRoutes.main);
  }

  @override
  Widget build(BuildContext context) {
    return AppThemeManager(
      child: MaterialApp(
        navigatorKey: _navKey,
        builder: (context, widget) => widget!,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.grey,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.grey,
        ),
        routes: <String, WidgetBuilder>{
          AppRoutes.root: (context) => Container(
                color: AppTheme.of(context).color.background.background,
              ),
          AppRoutes.main: (context) => const MainPage(),
        },
      ),
    );
  }
}
