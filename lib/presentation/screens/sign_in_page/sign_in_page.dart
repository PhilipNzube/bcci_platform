import 'dart:convert';

import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/screens/main_app/main_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

import '../../../core/widgets/auth_label.dart';
import '../../../core/widgets/auth_password_field.dart';
import '../../../core/widgets/auth_text_field.dart';
import '../../controllers/sign_in_page_controller.dart';
import '../sign_up_page/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return ChangeNotifierProvider(
          create: (context) => SignInPageController(),
          child: Consumer<SignInPageController>(
            builder: (context, signInPageController, child) {
              return PopScope(
                canPop: false,
                child: Scaffold(
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontFamily: 'GolosText',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ),

                          Gap(
                            MediaQuery.of(context).size.height * 0.02,
                            useMediaQuery: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Welcome",
                                style: TextStyle(
                                  fontFamily: 'GolosText',
                                  fontSize: 25.0,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ),
                          Gap(
                            MediaQuery.of(context).size.height * 0.05,
                            useMediaQuery: true,
                          ),
                          AuthLabel(title: 'Email'),
                          AuthTextField(
                            controller: signInPageController.emailController,
                            focusNode: signInPageController.emailFocusNode,
                            label: "example@gmail.com",
                            borderRadius: 8,
                          ),

                          Gap(
                            MediaQuery.of(context).size.height * 0.02,
                            useMediaQuery: true,
                          ),

                          AuthLabel(title: 'Password'),

                          AuthPasswordField(
                            controller: signInPageController.passwordController,
                            focusNode: signInPageController.passwordFocusNode,
                          ),

                          Gap(
                            MediaQuery.of(context).size.height * 0.02,
                            useMediaQuery: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 20.0,
                            ),
                            child: Row(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                      activeColor: const Color(0xFF500450),
                                      checkColor: Colors.white,
                                      value: signInPageController.rememberMe,
                                      onChanged: (bool? value) {
                                        signInPageController.setRememberMe(
                                          value!,
                                        );
                                      },
                                    ),
                                    Text(
                                      "Remember me",
                                      style: TextStyle(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                        fontFamily: 'Poppins',
                                        fontSize: 12.0,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => ForgotPassword(
                                    //         key: UniqueKey(),
                                    //         onToggleDarkMode:
                                    //             widget.onToggleDarkMode,
                                    //         isDarkMode: widget.isDarkMode),
                                    //   ),
                                    // );
                                  },
                                  child: const Text(
                                    'Forgot password?',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      decorationColor: Colors.grey,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.0,
                                      color: Color(0xFF500450),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(
                            MediaQuery.of(context).size.height * 0.02,
                            useMediaQuery: true,
                          ),
                          Container(
                            width: double.infinity,
                            height:
                                (60 / MediaQuery.of(context).size.height) *
                                MediaQuery.of(context).size.height,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: CustomButton(
                              text: "Login",
                              backgroundColor: Color(0xFFC7002B),
                              foregroundColor: Colors.white,
                              isLoading: signInPageController.isLoading,
                              onPressed: () {
                                signInPageController.submitForm(context);
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
                            MediaQuery.of(context).size.width * 0.04,
                            useMediaQuery: true,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "don't have an account?",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              Gap(
                                MediaQuery.of(context).size.width * 0.03,
                                useMediaQuery: true,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SignUpPage(key: UniqueKey()),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFC7002B),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
