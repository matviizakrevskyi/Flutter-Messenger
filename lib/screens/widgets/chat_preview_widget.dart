import 'package:flutter/material.dart';
import 'package:flutter_messenger/domain/extentions/date_time_ext.dart';
import 'package:flutter_messenger/domain/user.dart';
import 'package:flutter_messenger/screens/widgets/user_icon_widget.dart';
import 'package:flutter_messenger/styling/styling.dart';

class ChatPreviewWidget extends StatelessWidget {
  final User user;
  final String lastMessage;
  final DateTime lastMessageTime;
  final VoidCallback onTap;

  const ChatPreviewWidget(
      {super.key,
      required this.user,
      required this.lastMessage,
      required this.lastMessageTime,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            UserIcon(
              onTap: () {},
              name: user.name[0],
              avatarColor: user.avatarColor,
              size: const Size(60, 60),
            ),
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 60 - 32 - 8,
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: CustomTextStyles.h4,
                            ),
                            Text(
                              lastMessage,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: CustomTextStyles.textSecondary,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            lastMessageTime.toYMDFormat,
                            style: CustomTextStyles.main2,
                          ),
                          Text(lastMessageTime.toHMFormat),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Divider(
                    height: 1,
                    thickness: 1.5,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
