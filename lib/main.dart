import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/di/injection.dart';
import 'package:flutter_messenger/screens/auth/auth_cubit.dart';
import 'package:flutter_messenger/screens/auth/auth_screen.dart';
import 'package:flutter_messenger/screens/home/home_cubit.dart';
import 'package:flutter_messenger/screens/home/home_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      routes: {
        '/': (context) => BlocProvider<AuthCubit>(
              create: (BuildContext context) => getIt.get(),
              child: AuthScreen(),
            ),
        '/home': (context) => BlocProvider<HomeCubit>(
              create: (BuildContext context) => getIt.get(),
              child: HomeScreen(),
            ),
      },
    );
  }
}
