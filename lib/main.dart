import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screeningtest_nusantara/provider/auth_provider.dart';
import 'package:screeningtest_nusantara/provider/books_provider.dart';
import 'package:screeningtest_nusantara/screens/add_book.dart';
import 'package:screeningtest_nusantara/screens/login.dart';
import 'package:screeningtest_nusantara/screens/main_screen.dart';
import 'package:screeningtest_nusantara/screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: const Login(),
        routes: {
          '/main': (context) => MainScreen(),
          '/login': (context) => Login(),
          '/sign-up': (context) => Register(),
          '/add-book': (context) => AddBook(),
        },
      ),
    );
  }
}
