import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/di/injection.dart';
import 'package:flutter_messenger/screens/auth/auth_cubit.dart';
import 'package:flutter_messenger/screens/auth/auth_screen.dart';
import 'package:flutter_messenger/screens/chat/chat_cubit.dart';
import 'package:flutter_messenger/screens/chat/chat_screen.dart';
import 'package:flutter_messenger/screens/home_cover/home_cover_cubit.dart';
import 'package:flutter_messenger/screens/home_cover/home_cover_screen.dart';
import 'package:flutter_messenger/screens/search/search_cubit.dart';
import 'package:flutter_messenger/screens/search/search_screen.dart';
import 'package:flutter_messenger/styling/styling.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: CustomColors.colorSheme),
      navigatorKey: navigatorKey,
      routes: {
        '/': (context) => BlocProvider<AuthCubit>(
              create: (BuildContext context) => getIt.get(),
              child: AuthScreen(),
            ),
        '/home': (context) => BlocProvider<HomeCoverCubit>(
              create: (BuildContext context) => getIt.get(),
              child: const HomeCoverScreen(),
            ),
        '/search': (context) => BlocProvider<SearchCubit>(
              create: (BuildContext context) => getIt.get(),
              child: SearchScreen(),
            ),
        '/chat': (context) => BlocProvider<ChatCubit>(
              create: (BuildContext context) => getIt.get(),
              child: ChatScreen(),
            ),
      },
    );
  }
}
