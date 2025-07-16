import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/controllers/discipleship_pathways_page_controller.dart';
import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class DiscipleshipPathwaysPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const DiscipleshipPathwaysPage({super.key, required this.scaffoldKey});

  @override
  State<DiscipleshipPathwaysPage> createState() =>
      _DiscipleshipPathwaysPageState();
}

class _DiscipleshipPathwaysPageState extends State<DiscipleshipPathwaysPage>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    //final DiscipleshipPathwaysPageController = Provider.of<DiscipleshipPathwaysPageController>(context);
    return ChangeNotifierProvider(
      create: (context) => DiscipleshipPathwaysPageController(),
      child: Consumer<DiscipleshipPathwaysPageController>(
        builder: (context, DiscipleshipPathwaysPageController, child) {
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
                        onTap: () =>
                            widget.scaffoldKey.currentState?.openDrawer(),
                        child: Image.asset('images/Menu.png', height: 35),
                      ),

                      Gap(20, isHorizontal: true),
                      Expanded(
                        flex: 10,
                        child: Text(
                          'Discipleship Pathways',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'GolosText',
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Gap(4),
                      const Text(
                        "Structured learning paths for spiritual growth",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Gap(30),

                      CustomBackground(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "New Believer Foundation",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Gap(5),
                            Text(
                              "Structed learning paths for spiritual growth",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                            ),
                            Gap(10),
                          ],
                        ),
                      ),
                      Gap(30),

                      Gap(10),
                    ],
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
