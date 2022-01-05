import 'package:flutter/material.dart';
import 'package:movie_app/ui/home_page.dart';
import 'package:movie_app/view_layer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ViewLayer())],
      builder: (context, state) {
        return const MaterialApp(
            debugShowCheckedModeBanner: false, home: HomePage());
      },
    );
  }
}
