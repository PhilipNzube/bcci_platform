import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'core/themes/app_theme.dart';
import 'presentation/controllers/notification_controller.dart';
import 'presentation/controllers/theme_controller.dart';
import 'presentation/controllers/navigation_controller.dart';
import 'presentation/screens/main_app/main_app.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const storage = FlutterSecureStorage();
  final accessToken = await storage.read(key: 'passcodeNotActive');
  final prefs = await SharedPreferences.getInstance();
  bool? isDarkMode = prefs.getBool('isDarkMode') ?? false;

  final bool isLoggedIn = accessToken != null;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeController()),
        ChangeNotifierProvider(create: (_) => NavigationController()),
        ChangeNotifierProvider(create: (_) => NotificationController()),
      ],
      child: Consumer<ThemeController>(
        builder: (context, themeController, child) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            navigatorObservers: [routeObserver],
            title: 'BCCI Platform',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeController.isDarkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const MainApp(),
          );
        },
      ),
    );
  }
}
