import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:bcci_platform/core/widgets/custom_field.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/core/widgets/custom_label.dart';
import 'package:bcci_platform/core/widgets/custom_phone_field.dart';
import 'package:bcci_platform/core/widgets/custom_radio_button.dart';
import 'package:bcci_platform/presentation/controllers/edit_profile_controller.dart';
import 'package:bcci_platform/presentation/screens/settings_page/settings_page.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    //final EditProfileController = Provider.of<EditProfileController>(context);
    return ChangeNotifierProvider(
      create: (context) => EditProfileController(),
      child: Consumer<EditProfileController>(
        builder: (context, EditProfileController, child) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Top Header with Background Image and Stack ---
                    Stack(
                      children: [
                        Container(
                          height: screenHeight * 0.45,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/Background.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // Top icons
                        Positioned(
                          top: 20,
                          right: 20,
                          child: Row(
                            children: [
                              Image.asset(
                                "images/Share.png",
                                width: 30,
                                height: 30,
                                fit: BoxFit.contain,
                              ),
                              Gap(20, isHorizontal: true),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SettingsPage(key: UniqueKey()),
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  "images/settings-2.png",
                                  width: 30,
                                  height: 30,
                                  color: Colors.white,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Profile info
                        Positioned(
                          top: 40,
                          left: 0,
                          right: 0,
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(
                                  'images/Pexels Photo by Pixabay.png',
                                ),
                              ),
                              Gap(10),
                              Text(
                                EditProfileController.userName ?? "User",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Gap(4),
                              Text(
                                EditProfileController.email.text.trim(),
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                              Gap(16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 14,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFC7002B),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "Level",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Gap(5, isHorizontal: true),
                                        const Text(
                                          "3",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Gap(20, isHorizontal: true),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 14,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFC7002B),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "1250",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Gap(5, isHorizontal: true),
                                        const Text(
                                          "Points",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // --- Body content (settings options) ---
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Form(
                        key: EditProfileController.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomLabel(
                              title: "Fullname",
                              color: const Color(0xFFC7002B),
                            ),
                            CustomTextField(
                              //initialValue: EditProfileController.fullName.text,
                              onChanged: (value) =>
                                  EditProfileController.setFullName(value),
                              labelText: "Sarmie Phoenix",
                            ),
                            Gap(16),
                            CustomLabel(
                              title: "Date of birth",
                              color: const Color(0xFFC7002B),
                            ),
                            GestureDetector(
                              onTap: () async {
                                final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                );
                                if (picked != null) {
                                  // Format the date in dd/MM/yyyy format before updating the controller
                                  EditProfileController.setDateOfBirth(
                                    EditProfileController.formatDate(picked),
                                  );
                                }
                              },
                              child: AbsorbPointer(
                                // Prevent TextFormField from opening keyboard
                                child: CustomTextField(
                                  //initialValue: EditProfileController.dateOfBirth.text,
                                  suffixIcon: Icons.calendar_today,
                                  onChanged: (value) =>
                                      EditProfileController.setDateOfBirth(
                                        value,
                                      ),
                                  labelText: "00/00/0000",
                                ),
                              ),
                            ),
                            Gap(16),
                            CustomLabel(
                              title: "Gender",
                              color: const Color(0xFFC7002B),
                            ),
                            Row(
                              children: [
                                CustomRadioButton(
                                  label: "Male",
                                  value: "Male",
                                  groupValue: EditProfileController.gender,
                                  onChanged: (value) =>
                                      EditProfileController.setGender(value),
                                ),
                                Gap(16, isHorizontal: true),
                                CustomRadioButton(
                                  label: "Female",
                                  value: "Female",
                                  groupValue: EditProfileController.gender,
                                  onChanged: (value) =>
                                      EditProfileController.setGender(value),
                                ),
                              ],
                            ),
                            Gap(16),
                            CustomLabel(
                              title: "Email address",
                              color: const Color(0xFFC7002B),
                            ),
                            CustomTextField(
                              //initialValue: EditProfileController.email.text,
                              onChanged: (value) =>
                                  EditProfileController.setEmail(value),
                              labelText: "sarmiephoenix@email.com",
                            ),
                            Gap(16),
                            CustomLabel(
                              title: "Phone number",
                              color: const Color(0xFFC7002B),
                            ),
                            CustomPhoneField(
                              initialCountryCode: 'NG',
                              //initialValue:EditProfileController.phoneNumber.text,
                              onChanged: (value) =>
                                  EditProfileController.setPhoneNumber(value),
                            ),
                            Gap(16),
                            CustomLabel(
                              title: "Location",
                              color: const Color(0xFFC7002B),
                            ),
                            CustomTextField(
                              ////initialValue: EditProfileController.location.text,
                              onChanged: (value) =>
                                  EditProfileController.setLocation(value),
                              labelText: "Lagos, Nigeria",
                            ),
                            Gap(24),
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
                                img: "images/save.png",
                                text: "Save Changes",
                                isLoading: EditProfileController.isLoading,
                                onPressed: () async {
                                  await EditProfileController.updateUserProfile(
                                    fullName: EditProfileController
                                        .fullName
                                        .text
                                        .trim(),
                                    phone: EditProfileController
                                        .phoneNumber
                                        .text
                                        .trim(),
                                    username: EditProfileController
                                        .fullName
                                        .text
                                        .trim(),
                                    context: context,
                                  );
                                },
                                gap: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(10),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
