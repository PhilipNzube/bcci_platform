import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/controllers/messages_page_controller.dart';
import 'package:bcci_platform/presentation/screens/messages_page/widgets/recent_chat_card.dart';
import 'package:bcci_platform/presentation/screens/worship_page/widgets/audio_card.dart';
import 'package:bcci_platform/presentation/screens/worship_page/widgets/filter_chip.dart';
import 'package:flutter/material.dart' hide CarouselController, FilterChip;
import 'package:provider/provider.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    //final MessagesPageController = Provider.of<MessagesPageController>(context);
    return ChangeNotifierProvider(
      create: (context) => MessagesPageController(),
      child: Consumer<MessagesPageController>(
        builder: (context, MessagesPageController, child) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Messaging",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'GolosText',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(4),
                      const Text(
                        "Stay connected with your community",
                        style: TextStyle(color: Colors.black),
                      ),
                      Gap(20),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 3,
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search Messages",
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: const Icon(
                              Icons.mic,
                              color: Colors.red,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Gap(20),
                      const Text(
                        "Recent Conversations",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'GolosText',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(10),
                      RecentChatCard(
                        img: "images/Pastor_David_Convo.png",
                        name: "Victory Cell Group",
                        chat:
                            "See you all at tonight’s meeting which wil be tonight",
                        members: "Sarah, Mike, Lisa, + 2 others",
                        timeStamp: "2 days ago",
                        count: 1,
                      ),
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
