import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/controllers/messages_page_controller.dart';
import 'package:bcci_platform/presentation/screens/messages_page/widgets/new_info_card.dart';
import 'package:bcci_platform/presentation/screens/messages_page/widgets/recent_chat_card.dart';
import 'package:bcci_platform/presentation/screens/worship_page/widgets/audio_card.dart';
import 'package:bcci_platform/core/widgets/filter_chip.dart';
import 'package:flutter/material.dart' hide CarouselController, NewInfoCard;
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
                      CustomBackground(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: NewInfoCard(
                              title: "Announcement",
                              message: "Church updates",
                              badgeText: "New",
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: NewInfoCard(
                              title: "Prayer Request",
                              message: "Community Prayers",
                              badgeText: "New",
                            ),
                          ),
                        ],
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
                      RecentChatCard(
                        img: "images/Pastor_David_Convo.png",
                        name: "Akatsuki",
                        chat: "Feel Pain",
                        members: "Pain, Itachi",
                        timeStamp: "2 days ago",
                      ),
                      RecentChatCard(
                        img: "images/Pastor_David_Convo.png",
                        name: "Soul Society",
                        chat: "Get ready shinigamis!!!",
                        members: "Ichigo, Aizen",
                        timeStamp: "2 days ago",
                        count: 1,
                      ),
                      Gap(10),
                    ],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                heroTag: 'message_fab',
                onPressed: () {},
                backgroundColor: const Color(0xFF000000),
                shape: const CircleBorder(),
                child: Image.asset(
                  'images/Write_Message.png',
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
