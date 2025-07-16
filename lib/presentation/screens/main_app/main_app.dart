import 'package:bcci_platform/presentation/screens/analytics_dashboard_page/analytics_dashboard_page.dart';
import 'package:bcci_platform/presentation/screens/cluster_page/cluster_page.dart';
import 'package:bcci_platform/presentation/screens/digital_transformation_page/digital_transformation_page.dart';
import 'package:bcci_platform/presentation/screens/discipleship_pathways_page/discipleship_pathways_page.dart';
import 'package:bcci_platform/presentation/screens/gamification_page/gamification_page.dart';
import 'package:bcci_platform/presentation/screens/home_page/home_page.dart';
import 'package:bcci_platform/presentation/screens/main_app/widgets/app_side_bar.dart';
import 'package:bcci_platform/presentation/screens/messages_page/messages_page.dart';
import 'package:bcci_platform/presentation/screens/user_page/user_page.dart';
import 'package:bcci_platform/presentation/screens/worship_page/worship_page.dart';
import 'package:flutter/material.dart';
import '../../../core/services/connectivity_service.dart';
import '../../../core/widgets/custom_back_handler.dart';
import '../../../core/widgets/custom_bottom_nav.dart';
import '../../../core/widgets/custom_snackbar.dart';
import '../../controllers/navigation_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:provider/provider.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with TickerProviderStateMixin {
  final List<bool> _hasNotification = [false, false, false, false];
  DateTime? currentBackPressTime;
  bool isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ConnectivityService _connectivityService = ConnectivityService();

  @override
  void initState() {
    super.initState();
    _connectivityService.startMonitoring((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        CustomSnackbar.show(context, "No Internet Connection", isError: true);
      }
    });
  }

  @override
  void dispose() {
    _connectivityService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navController = Provider.of<NavigationController>(context);

    return CustomBackHandler(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: AppSidebar(
          onItemTap: (label) {
            Navigator.pop(context); // Close the drawer

            if (label == "Digital Transformation") {
              navController.setTempIndex(5);
            } else if (label == "Analytics Dashboard") {
              navController.setTempIndex(6);
            } else if (label == "Gamification") {
              navController.setTempIndex(7);
            } else if (label == "Discipleship Pathways") {
              navController.setTempIndex(8);
            }
          },
        ),
        extendBody: true,
        body: SafeArea(
          child: IndexedStack(
            index: navController.selectedIndex,
            children: [
              HomePage(scaffoldKey: _scaffoldKey),
              ClusterPage(),
              WorshipPage(),
              MessagesPage(),
              UserPage(),
              DigitalTransformationPage(scaffoldKey: _scaffoldKey),
              AnalyticsDashboardPage(scaffoldKey: _scaffoldKey),
              GamificationPage(scaffoldKey: _scaffoldKey),
              DiscipleshipPathwaysPage(scaffoldKey: _scaffoldKey),
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNav(),
      ),
    );
  }
}
