import 'package:flutter/material.dart';
import 'package:flutter_messenger/domain/extentions/date_time_ext.dart';
import 'package:flutter_messenger/styling/styling.dart';

class ChatPreviewWidget extends StatelessWidget {
  final String userName;
  final String lastMessage;
  final DateTime lastMessageTime;
  final VoidCallback onTap;

  const ChatPreviewWidget(
      {super.key,
      required this.userName,
      required this.lastMessage,
      required this.lastMessageTime,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
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
              height: 0,
              thickness: 1.5,
              color: Colors.grey.withOpacity(0.3),
            ),
          ],
        ),
      ),
    );
  }
}
