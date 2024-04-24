import 'package:flutter/material.dart';
import 'package:flutter_messenger/styling/styling.dart';

class ColorsListWidget extends StatelessWidget {
  final int selectedColorIndex;
  final Function(int) onColor;

  const ColorsListWidget({super.key, required this.selectedColorIndex, required this.onColor});

  @override
  Widget build(BuildContext context) {
    const colors = CustomColors.avatarColors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 4,
              ),
              Text(
                "Select color:",
                style: CustomTextStyles.main2,
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  final item = colors[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: item,
                          border: Border.all(
                              width: 2,
                              color: selectedColorIndex == index
                                  ? CustomColors.textPrimaryColor
                                  : CustomColors.placeholder),
                          borderRadius: const BorderRadius.all(Radius.circular(4))),
                      child: InkWell(
                        onTap: () {
                          onColor(index);
                        },
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
