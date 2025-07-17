import 'package:bcci_platform/presentation/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'custom_snackbar.dart';

class CustomBackHandler extends StatefulWidget {
  final Widget child;

  const CustomBackHandler({super.key, required this.child});

  @override
  State<CustomBackHandler> createState() => _CustomBackHandlerState();
}

class _CustomBackHandlerState extends State<CustomBackHandler> {
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, dynamic result) async {
        if (!didPop) {
          final navController = Provider.of<NavigationController>(
            context,
            listen: false,
          );
          DateTime now = DateTime.now();
          if (navController.tempIndex >= 0) {
            navController.clearTempIndex();
            navController.changeTab(
              navController.previousIndex > 0 ? navController.previousIndex : 0,
            );
          } else if (navController.selectedIndex != 0) {
            navController.changeTab(0);
          } else if (currentBackPressTime == null ||
              now.difference(currentBackPressTime!) >
                  const Duration(seconds: 2)) {
            currentBackPressTime = now;
            CustomSnackbar.show(
              context,
              'Press back again to exit',
              isError: true,
            );
          } else {
            await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          }
        }
      },
      child: widget.child,
    );
  }
}
