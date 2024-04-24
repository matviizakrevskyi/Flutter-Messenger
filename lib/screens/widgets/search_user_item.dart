import 'package:flutter/material.dart';
import 'package:flutter_messenger/domain/user.dart';
import 'package:flutter_messenger/screens/widgets/user_icon_widget.dart';
import 'package:flutter_messenger/styling/styling.dart';

class SearchUserItem extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const SearchUserItem({super.key, required this.onTap, required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 60 - 32 - 8,
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
                              user.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: CustomTextStyles.h4,
                            ),
                            Text(
                              user.email,
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
            const SizedBox(
              width: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: UserIcon(
                onTap: null,
                name: user.name[0],
                avatarColor: user.avatarColor,
                size: const Size(54, 54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
