import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/auth_provider.dart';
import 'package:flutterapp/model/connection/connection_provider.dart';
import 'package:flutterapp/model/quote/quote_provider.dart';
import 'package:flutterapp/view/main_menu.dart';
import 'package:flutterapp/view/src/loginPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => QuoteProvider()
          ),
          ChangeNotifierProvider(
              create: (_) => ConnectionProvider()
          ),
          ChangeNotifierProvider(
              create: (_) => AuthProvider()
          )
        ],
        child: MyApp()
    )
    //MyApp()
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/Login",
      routes: {
        "/Login": (path) => LoginPage(),
        "/MainMenu": (path) => MainMenu()
      }, /*MainMenu()*/ /*Calculator()*/
    );
  }
}



