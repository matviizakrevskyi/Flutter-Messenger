import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/domain/extentions/date_time_ext.dart';
import 'package:flutter_messenger/screens/chat/chat_cubit.dart';
import 'package:flutter_messenger/screens/widgets/chat_text_field.dart';
import 'package:flutter_messenger/screens/widgets/user_icon_widget.dart';
import 'package:flutter_messenger/styling/styling.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: CustomColors.main,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: UserIcon(
                  onTap: () {},
                  name: cubit.anotherUser?.name[0] ?? 'U',
                  avatarColor: cubit.anotherUser?.avatarColor ?? CustomColors.defaoultAvatarColor,
                  size: const Size(40, 40),
                ),
              )
            ],
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cubit.anotherUser?.name ?? "UserName",
                  style: CustomTextStyles.h4,
                ),
              ],
            ),
          ),
          body: Column(children: [
            Divider(
              height: 1,
              thickness: 1.5,
              color: Colors.grey.withOpacity(0.3),
            ),
            Expanded(
              child: ListView.builder(
                  reverse: true,
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return _MessageItem(
                        item.text, item.userId == cubit.user?.id, item.time.toHMFormat);
                  }),
            ),
            const SizedBox(
              height: 8,
            ),
            Divider(
              height: 1,
              thickness: 1.5,
              color: Colors.grey.withOpacity(0.3),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ChatTextField(
                controller: cubit.textController,
                onSend: () => cubit.onSendMessege(),
              ),
            )
          ]),
        );
      },
    );
  }
}

class _MessageItem extends StatelessWidget {
  final String text;
  final bool isYourMessage;
  final String time;

  const _MessageItem(this.text, this.isYourMessage, this.time);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isYourMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
            decoration: BoxDecoration(
              color: isYourMessage
                  ? CustomColors.textPrimaryColor.withOpacity(0.05)
                  : CustomColors.textPrimaryColor,
              border: Border.all(
                color: CustomColors.textPrimaryColor,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(
                      text,
                      style: CustomTextStyles.main.copyWith(
                          color: isYourMessage
                              ? CustomColors.textPrimaryColor
                              : CustomColors.textWhiteColor),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        time,
                        style: CustomTextStyles.textSecondary2,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
