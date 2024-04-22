import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/screens/search/search_cubit.dart';
import 'package:flutter_messenger/screens/widgets/custom_text_field.dart';
import 'package:flutter_messenger/screens/widgets/search_user_item.dart';
import 'package:flutter_messenger/styling/styling.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
                      child: IconButton(
                          onPressed: () => cubit.onBackButton(),
                          icon: const Icon(Icons.arrow_back)),
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: cubit.searchController,
                        hintText: "Search",
                        customHeight: 40,
                        customBorderRadius: 22,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: IconButton(
                          onPressed: () => cubit.onSearchButton(), icon: const Icon(Icons.search)),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1.5,
                  color: Colors.grey.withOpacity(0.3),
                ),
                state.isLoading
                    ? Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
                        child: const CircularProgressIndicator(
                          color: CustomColors.textPrimaryColor,
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.only(top: 8),
                            itemCount: state.users.length,
                            itemBuilder: (context, index) {
                              final item = state.users[index];
                              return SearchUserItem(
                                userName: item.name,
                                userEmail: item.email,
                                onTap: () => cubit.onItem(item),
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
