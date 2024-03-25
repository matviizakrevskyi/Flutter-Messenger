import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/screens/search/search_cubit.dart';
import 'package:flutter_messenger/screens/widgets/custom_text_field.dart';
import 'package:flutter_messenger/screens/widgets/search_user_item.dart';
import 'package:flutter_messenger/styling/styling.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Ink(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(19)),
                            border: Border.all(color: CustomColors.textPrimaryColor, width: 2)),
                        child: InkWell(
                          customBorder:
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          onTap: () => cubit.onBackButton(),
                          child: const Center(child: Icon(Icons.arrow_back)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: cubit.searchController,
                        hintText: "Search",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Ink(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(19)),
                            border: Border.all(color: CustomColors.textPrimaryColor, width: 2)),
                        child: InkWell(
                          customBorder:
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          onTap: () => cubit.onSearchButton(),
                          child: const Center(child: Icon(Icons.search)),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1.5,
                  color: Colors.grey.withOpacity(0.3),
                ),
                if (state.users.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                        itemCount: state.users.length,
                        itemBuilder: (context, index) {
                          final item = state.users[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                SearchUserItem(
                                  userName: item.name,
                                  userEmail: item.email,
                                  onTap: () => cubit.onItem(item.id),
                                )
                              ],
                            ),
                          );
                        }),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
