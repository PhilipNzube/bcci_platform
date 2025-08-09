import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/controllers/data_management_page_controller.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class DataManagementPage extends StatefulWidget {
  const DataManagementPage({super.key});

  @override
  State<DataManagementPage> createState() => _DataManagementPageState();
}

class _DataManagementPageState extends State<DataManagementPage>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    //final DataManagementPageController = Provider.of<DataManagementPageController>(context);
    return ChangeNotifierProvider(
      create: (context) => DataManagementPageController(),
      child: Consumer<DataManagementPageController>(
        builder: (context, DataManagementPageController, child) {
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
                        'Data Management',
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
                          "Export data and account management",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        Gap(20),

                        InkWell(
                          onTap: () {},
                          child: CustomBackground(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 14,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  "images/save.png",
                                  width: 25,
                                  height: 25,
                                  color: Colors.black,
                                  fit: BoxFit.contain,
                                ),
                                Gap(8, isHorizontal: true),
                                const Text(
                                  "Export My Data",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Gap(54),
                        const Text(
                          "Danger Zone",
                          style: TextStyle(
                            fontFamily: "GolosText",
                            fontSize: 18,
                            color: Color(0xFFFF0000),
                          ),
                        ),
                        Gap(5),
                        CustomButton(
                          backgroundColor: const Color(0xFFC7002B),
                          padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 12,
                            ),
                          ),
                          foregroundColor: Colors.white,
                          gap: 5,
                          img: "images/delete.png",
                          text: "Delete Account",
                          isLoading: DataManagementPageController.isLoading,
                          onPressed: () async {
                            await DataManagementPageController.deleteUserAccount(
                              context,
                            );
                          },
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
