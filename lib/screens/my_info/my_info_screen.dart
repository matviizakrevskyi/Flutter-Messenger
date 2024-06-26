import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/screens/my_info/my_info_cubit.dart';
import 'package:flutter_messenger/screens/my_info/my_info_state.dart';
import 'package:flutter_messenger/screens/widgets/colors_list_widget.dart';
import 'package:flutter_messenger/screens/widgets/custom_button.dart';
import 'package:flutter_messenger/screens/widgets/custom_text_field.dart';
import 'package:flutter_messenger/screens/widgets/logout_popup_widget.dart';
import 'package:flutter_messenger/styling/styling.dart';

class MyInfoScreen extends StatelessWidget {
  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyInfoCubit>();
    return BlocBuilder<MyInfoCubit, MyInfoState>(
      builder: (context, state) {
        return Scaffold(
          body: state.isLoading
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 100),
                    child: CircularProgressIndicator(
                      color: CustomColors.textPrimaryColor,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color:
                                  state.user != null ? state.user!.avatarColor : CustomColors.main,
                              border: Border.all(color: CustomColors.placeholder),
                              borderRadius: const BorderRadius.all(Radius.circular(50)),
                            ),
                            child: Center(
                                child: Text(
                              state.user?.name[0] ?? "",
                              style: CustomTextStyles.h1.copyWith(fontSize: 42),
                            )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        state.user?.name ?? '',
                        style: CustomTextStyles.h1,
                      ),
                      Text(
                        state.user?.email ?? "",
                        style: CustomTextStyles.main
                            .copyWith(color: CustomColors.textPrimaryColor.withOpacity(0.8)),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      AnimatedOpacity(
                        opacity: state.animationOpacity,
                        duration: Duration(milliseconds: state.animationOpacity == 0 ? 0 : 200),
                        child: state.stage == MyInfoStage.defaultStage
                            ? _DefaultPartWidget(
                                onChangeProfileButton: () {
                                  cubit.toChangingData();
                                },
                                onPopupCancel: () {
                                  cubit.popupCancel();
                                },
                                onPopupConfirm: () {
                                  cubit.logOutConfirm();
                                },
                              )
                            : _EditingPartWidget(
                                onBack: () {
                                  cubit.toDefaultStage();
                                },
                                onChange: () {
                                  cubit.changeUserData();
                                },
                                nameController: cubit.nameController,
                                isActive: state.isEditingButtonActive,
                                selectedColorIndex: state.selectedColorIndex,
                                onColor: (index) {
                                  cubit.selectColor(index);
                                },
                              ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

class _DefaultPartWidget extends StatelessWidget {
  final VoidCallback onChangeProfileButton;
  final VoidCallback onPopupCancel;
  final VoidCallback onPopupConfirm;

  const _DefaultPartWidget(
      {required this.onChangeProfileButton,
      required this.onPopupCancel,
      required this.onPopupConfirm});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBigButton(
          onTap: onChangeProfileButton,
          child: const Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Text(
                "Change profile data",
                style: CustomTextStyles.main,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        CustomBigButton(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => LogOutPopupWidget(
                onCancel: onPopupCancel,
                onConfirm: onPopupConfirm,
              ),
            );
          },
          child: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Text(
                "Log Out",
                style: CustomTextStyles.main.copyWith(color: Colors.red),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _EditingPartWidget extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onChange;
  final TextEditingController nameController;
  final bool isActive;
  final int selectedColorIndex;
  final Function(int) onColor;

  const _EditingPartWidget(
      {required this.onBack,
      required this.onChange,
      required this.nameController,
      required this.isActive,
      required this.selectedColorIndex,
      required this.onColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                onTap: onBack,
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    "Back",
                    style: CustomTextStyles.main,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(
          controller: nameController,
          hintText: 'Enter your name',
        ),
        const SizedBox(
          height: 32,
        ),
        ColorsListWidget(
          selectedColorIndex: selectedColorIndex,
          onColor: (index) {
            onColor(index);
          },
        ),
        const SizedBox(
          height: 32,
        ),
        CustomBigButton(
          isActive: isActive,
          onTap: onChange,
          child: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Text(
                "Change data",
                style: CustomTextStyles.main.copyWith(
                    color: isActive ? CustomColors.textPrimaryColor : CustomColors.placeholder),
              )
            ],
          ),
        )
      ],
    );
  }
}
