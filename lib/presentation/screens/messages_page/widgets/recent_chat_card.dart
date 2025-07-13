import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_gap.dart';

class RecentChatCard extends StatelessWidget {
  final String img;
  final String name;
  final String chat;
  final String? members;
  final String timeStamp;
  final int? count;

  const RecentChatCard({
    super.key,
    required this.img,
    required this.name,
    required this.chat,
    this.members,
    required this.timeStamp,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 3,
                  blurRadius: 6,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(img, width: 54, height: 54, fit: BoxFit.contain),
                const Gap(15, isHorizontal: true),

                /// This `Expanded` makes the text column take remaining space
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 25,
                          fontFamily: 'GolosText',
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        chat,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'GolosText',
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              members != null ? members! : '',
                              style: const TextStyle(
                                fontSize: 10,
                                fontFamily: 'GolosText',
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          if (members != null)
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: Text(
                                '|',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                          Text(
                            timeStamp,
                            style: const TextStyle(
                              fontSize: 10,
                              fontFamily: 'GolosText',
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Badge (conditionally show only if count is not null and > 0)
          if (count != null && count! > 0)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  count! > 99 ? "99+" : count.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
