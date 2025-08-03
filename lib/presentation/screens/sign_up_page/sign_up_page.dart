import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/core/widgets/custom_phone_field.dart';
import 'package:bcci_platform/presentation/screens/main_app/main_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/auth_label.dart';
import '../../../core/widgets/auth_password_field.dart';
import '../../../core/widgets/auth_text_field.dart';
import '../../controllers/sign_up_page_controller.dart';
import '../sign_in_page/sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return ChangeNotifierProvider(
          create: (context) => SignUpPageController(),
          child: Consumer<SignUpPageController>(
            builder: (context, signUpPageController, child) {
              return Scaffold(
                body: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(
                          MediaQuery.of(context).size.height * 0.1,
                          useMediaQuery: true,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontFamily: 'GolosText',
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ),

                        Gap(
                          MediaQuery.of(context).size.height * 0.05,
                          useMediaQuery: true,
                        ),

                        AuthLabel(title: 'Username'),
                        AuthTextField(
                          controller: signUpPageController.userNameController,
                          focusNode: signUpPageController.userNameFocusNode,
                        ),

                        Gap(
                          MediaQuery.of(context).size.height * 0.02,
                          useMediaQuery: true,
                        ),

                        AuthLabel(title: 'Email'),
                        AuthTextField(
                          controller: signUpPageController.emailController,
                          focusNode: signUpPageController.emailFocusNode,
                          label: "example@gmail.com",
                        ),

                        Gap(
                          MediaQuery.of(context).size.height * 0.02,
                          useMediaQuery: true,
                        ),

                        AuthLabel(title: 'Phone Number'),
                        CustomPhoneField(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          initialCountryCode: 'NG',
                          borderRadius: 8,
                          filled: false,
                          borderSide: BorderSide(color: Colors.black),
                          onChanged: (phone) {
                            signUpPageController.setPhoneNumber(phone);
                          },
                        ),

                        Gap(
                          MediaQuery.of(context).size.height * 0.02,
                          useMediaQuery: true,
                        ),

                        AuthLabel(title: 'State'),
                        AuthTextField(
                          controller: signUpPageController.stateController,
                          focusNode: signUpPageController.stateFocusNode,
                          label: "Select your state",
                        ),

                        Gap(
                          MediaQuery.of(context).size.height * 0.02,
                          useMediaQuery: true,
                        ),

                        AuthLabel(title: 'New Password'),

                        AuthPasswordField(
                          controller: signUpPageController.passwordController,
                          focusNode: signUpPageController.passwordFocusNode,
                        ),
                        Gap(
                          MediaQuery.of(context).size.height * 0.02,
                          useMediaQuery: true,
                        ),

                        AuthLabel(title: 'Retype Password'),

                        AuthPasswordField(
                          controller:
                              signUpPageController.retypePasswordController,
                          focusNode:
                              signUpPageController.retypePasswordFocusNode,
                        ),

                        Gap(
                          MediaQuery.of(context).size.height * 0.05,
                          useMediaQuery: true,
                        ),

                        Container(
                          width: double.infinity,
                          height:
                              (60 / MediaQuery.of(context).size.height) *
                              MediaQuery.of(context).size.height,
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomButton(
                            text: "Sign Up",
                            backgroundColor: Color(0xFFC7002B),
                            foregroundColor: Colors.white,
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MainApp(key: UniqueKey()),
                                ),
                              );
                            },
                          ),
                        ),
                        // SizedBox(
                        //     height: MediaQuery.of(context).size.height * 0.02),
                        // const Center(
                        //   child: Text(
                        //     'or continue with',
                        //     style: TextStyle(
                        //       fontFamily: 'Poppins',
                        //       fontSize: 13.0,
                        //       fontWeight: FontWeight.bold,
                        //       color: Colors.grey,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //     height: MediaQuery.of(context).size.height * 0.02),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Container(
                        //       height: (60 / MediaQuery.of(context).size.height) *
                        //           MediaQuery.of(context).size.height,
                        //       padding:
                        //           const EdgeInsets.symmetric(horizontal: 20.0),
                        //       child: ElevatedButton(
                        //         onPressed: () {},
                        //         style: ButtonStyle(
                        //           backgroundColor:
                        //               WidgetStateProperty.resolveWith<Color>(
                        //             (Set<WidgetState> states) {
                        //               if (states.contains(WidgetState.pressed)) {
                        //                 return Colors.white;
                        //               }
                        //               return const Color(0xFFEEF1F4);
                        //             },
                        //           ),
                        //           foregroundColor:
                        //               WidgetStateProperty.resolveWith<Color>(
                        //             (Set<WidgetState> states) {
                        //               if (states.contains(WidgetState.pressed)) {
                        //                 return Colors.white;
                        //               }
                        //               return Colors.grey;
                        //             },
                        //           ),
                        //           elevation: WidgetStateProperty.all<double>(0),
                        //           shape: WidgetStateProperty.all<
                        //               RoundedRectangleBorder>(
                        //             const RoundedRectangleBorder(
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(15)),
                        //             ),
                        //           ),
                        //         ),
                        //         child: Row(
                        //           children: [
                        //             Image.asset(
                        //               'images/FacebookIcon.png',
                        //               height: 25,
                        //             ),
                        //             SizedBox(
                        //                 width: MediaQuery.of(context).size.width *
                        //                     0.03),
                        //             const Text(
                        //               'Facebook',
                        //               style: TextStyle(
                        //                 fontFamily: 'Poppins',
                        //                 fontWeight: FontWeight.bold,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //     Container(
                        //       height: (60 / MediaQuery.of(context).size.height) *
                        //           MediaQuery.of(context).size.height,
                        //       padding:
                        //           const EdgeInsets.symmetric(horizontal: 20.0),
                        //       child: ElevatedButton(
                        //         onPressed: () {
                        //           //_handleSignIn(context);
                        //         },
                        //         style: ButtonStyle(
                        //           backgroundColor:
                        //               WidgetStateProperty.resolveWith<Color>(
                        //             (Set<WidgetState> states) {
                        //               if (states.contains(WidgetState.pressed)) {
                        //                 return Colors.white;
                        //               }
                        //               return const Color(0xFFEEF1F4);
                        //             },
                        //           ),
                        //           foregroundColor:
                        //               WidgetStateProperty.resolveWith<Color>(
                        //             (Set<WidgetState> states) {
                        //               if (states.contains(WidgetState.pressed)) {
                        //                 return Colors.white;
                        //               }
                        //               return Colors.grey;
                        //             },
                        //           ),
                        //           elevation: WidgetStateProperty.all<double>(0),
                        //           shape: WidgetStateProperty.all<
                        //               RoundedRectangleBorder>(
                        //             const RoundedRectangleBorder(
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(15)),
                        //             ),
                        //           ),
                        //         ),
                        //         child: Row(
                        //           children: [
                        //             Image.asset(
                        //               'images/GoogleIcon.png',
                        //               height: 25,
                        //             ),
                        //             SizedBox(
                        //                 width: MediaQuery.of(context).size.width *
                        //                     0.03),
                        //             const Text(
                        //               'Google',
                        //               style: TextStyle(
                        //                 fontFamily: 'Poppins',
                        //                 fontWeight: FontWeight.bold,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        Gap(
                          MediaQuery.of(context).size.width * 0.02,
                          useMediaQuery: true,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
