import 'package:anydownloader/searchResult.dart';
import 'package:flutter/material.dart';
import 'package:anydownloader/home.dart';
void main() {
  runApp(const Initials());
}

class Initials extends StatelessWidget {
  const Initials({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
         '/searchResult': (context) => SearchResult(
              searchResult: ModalRoute.of(context)!.settings.arguments.toString()),

        '/home':(context)=>const Home(),
      },
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

