import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:bcci_platform/core/widgets/custom_field.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/core/widgets/custom_label.dart';
import 'package:bcci_platform/presentation/controllers/security_settings_page_controller.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class SecuritySettingsPage extends StatefulWidget {
  const SecuritySettingsPage({super.key});

  @override
  State<SecuritySettingsPage> createState() => _SecuritySettingsPageState();
}

class _SecuritySettingsPageState extends State<SecuritySettingsPage>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    //final SecuritySettingsPageController = Provider.of<SecuritySettingsPageController>(context);
    return ChangeNotifierProvider(
      create: (context) => SecuritySettingsPageController(),
      child: Consumer<SecuritySettingsPageController>(
        builder: (context, SecuritySettingsPageController, child) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                forceMaterialTransparency: true,
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset('images/Back.png', height: 35),
                      ),

                      Gap(20, isHorizontal: true),
                      Text(
                        'Security Settings',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'GolosText',
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(4),
                        const Text(
                          "Password & Account Security Settings",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        Gap(20),

                        CustomLabel(title: "Change Password"),
                        CustomTextField(
                          initialValue: SecuritySettingsPageController.password,
                          onChanged: (value) =>
                              SecuritySettingsPageController.setPassword(value),
                          labelText: "Change Your Password",
                        ),
                        Spacer(),
                        Center(
                          child: CustomButton(
                            backgroundColor: const Color(0xFFC7002B),
                            padding: WidgetStateProperty.all(
                              const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 12,
                              ),
                            ),
                            foregroundColor: Colors.white,
                            gap: 5,
                            img: "images/Edit_Profile.png",
                            text: "Edit",
                            onPressed: () {
                              // if (SecuritySettingsPageController
                              //     .formKey
                              //     .currentState!
                              //     .validate()) {
                              //   // Handle save changes
                              // }
                            },
                          ),
                        ),
                        Gap(10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
