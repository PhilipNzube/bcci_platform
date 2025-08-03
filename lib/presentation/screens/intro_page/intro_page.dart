import 'package:bcci_platform/presentation/screens/intro_page/widgets/intro_page_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/custom_back_handler.dart';
import '../../controllers/intro_page_controller.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return ChangeNotifierProvider(
          create: (context) => IntroPageController(),
          child: Consumer<IntroPageController>(
            builder: (context, introPageController, child) {
              return CustomBackHandler(
                child: Scaffold(
                  body: Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height,
                          viewportFraction: 1.0,
                          enableInfiniteScroll: false,
                          scrollPhysics: const NeverScrollableScrollPhysics(),
                          onPageChanged: (index, reason) {
                            introPageController.setCurrent(index);
                          },
                        ),
                        carouselController: introPageController.controller,
                        items: List.generate(
                          introPageController.imagePaths.length,
                          (index) {
                            return IntroCardWidget(
                              imagePath: introPageController.imagePaths[index],
                              title: introPageController.imageHeaders[index],
                              subtitle:
                                  introPageController.imageSubheadings[index],
                              subtitle2:
                                  introPageController.imageSubheadings2[index],
                              isLast:
                                  index ==
                                  introPageController.imagePaths.length - 1,
                              onNext: () {
                                if (index ==
                                    introPageController.imagePaths.length - 1) {
                                } else {
                                  introPageController.controller.nextPage();
                                }
                              },
                              isActive: index == introPageController.current,
                              totalPages: introPageController.imagePaths.length,
                              currentPage: introPageController.current,
                            );
                          },
                        ),
                      ),
                    ],
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
