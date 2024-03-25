import 'package:flutter/material.dart';
import 'package:flutter_messenger/styling/styling.dart';

class SearchUserItem extends StatelessWidget {
  final String userName;
  final String userEmail;
  final VoidCallback onTap;

  const SearchUserItem(
      {super.key, required this.userName, required this.userEmail, required this.onTap});

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
              mainAxisAlignment: MainAxisAlignment.start,
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
                        userEmail,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: CustomTextStyles.textSecondary,
                      ),
                    ],
                  ),
                ),
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
