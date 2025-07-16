import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:bcci_platform/core/widgets/custom_field.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/core/widgets/custom_label.dart';
import 'package:bcci_platform/core/widgets/custom_phone_field.dart';
import 'package:bcci_platform/presentation/controllers/spiritual_goals_controller.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class SpiritualGoals extends StatefulWidget {
  const SpiritualGoals({super.key});

  @override
  State<SpiritualGoals> createState() => _SpiritualGoalsState();
}

class _SpiritualGoalsState extends State<SpiritualGoals>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    //final SpiritualGoalsController = Provider.of<SpiritualGoalsController>(context);
    return ChangeNotifierProvider(
      create: (context) => SpiritualGoalsController(),
      child: Consumer<SpiritualGoalsController>(
        builder: (context, SpiritualGoalsController, child) {
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
                        'Spiritual Goals',
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
                          "Manage your spiritual journey preferences",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        Gap(20),
                        CustomLabel(title: "Fullname"),
                        CustomTextField(
                          initialValue: SpiritualGoalsController.fullName.text,
                          onChanged: (value) =>
                              SpiritualGoalsController.setFullName(value),
                          labelText: "Sarmie Phoenix",
                        ),
                        Gap(16),
                        CustomLabel(title: "Email address"),
                        CustomTextField(
                          initialValue: SpiritualGoalsController.email.text,
                          onChanged: (value) =>
                              SpiritualGoalsController.setEmail(value),
                          labelText: "sarmiephoenix@email.com",
                        ),
                        Gap(16),
                        CustomLabel(title: "Phone number"),
                        CustomPhoneField(
                          initialCountryCode: 'NG',
                          initialValue:
                              SpiritualGoalsController.phoneNumber.text,
                          onChanged: (value) =>
                              SpiritualGoalsController.setPhoneNumber(value),
                        ),
                        Gap(16),
                        CustomLabel(title: "Address"),
                        CustomTextField(
                          initialValue: SpiritualGoalsController.address.text,
                          onChanged: (value) =>
                              SpiritualGoalsController.setAddress(value),
                          labelText: "Input your address",
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
                              // if (SpiritualGoalsController.formKey.currentState!
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
