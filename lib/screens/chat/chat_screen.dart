import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/domain/extentions/date_time_ext.dart';
import 'package:flutter_messenger/screens/chat/chat_cubit.dart';
import 'package:flutter_messenger/screens/widgets/chat_text_field.dart';
import 'package:flutter_messenger/styling/styling.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: CustomColors.main,
            title: Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cubit.anotherUser?.name ?? "UserName",
                    style: CustomTextStyles.h4,
                  ),
                ],
              ),
            ),
          ),
          body: Column(children: [
            Divider(
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

class _AppBar extends StatelessWidget {
  final String title;
  final VoidCallback onBack;

  _AppBar({required this.title, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Ink(
          //   height: 38,
          //   width: 38,
          //   decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: const BorderRadius.all(Radius.circular(19)),
          //       border: Border.all(color: CustomColors.textPrimaryColor, width: 2)),
          //   child: InkWell(
          //     customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          //     onTap: onBack,
          //     child: const Center(child: Icon(Icons.arrow_back)),
          //   ),
          // ),
          Row(
            children: [
              Text(
                title,
                style: CustomTextStyles.h4,
              ),
            ],
          ),
          const SizedBox(
            width: 44,
          )
        ],
      ),
    );
  }
}

class _MessageItem extends StatelessWidget {
  final String text;
  final bool isYourMessage;
  final String time;

  _MessageItem(this.text, this.isYourMessage, this.time);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isYourMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
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
                children: [
                  Text(
                    text,
                    style: CustomTextStyles.main.copyWith(
                        color: isYourMessage
                            ? CustomColors.textPrimaryColor
                            : CustomColors.textWhiteColor),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    time,
                    style: CustomTextStyles.textSecondary2,
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
