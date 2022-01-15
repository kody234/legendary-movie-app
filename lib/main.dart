import 'package:flutter/material.dart';
import 'package:movie_app/app_theme.dart';
import 'package:movie_app/size_config.dart';
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
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                SizeConfig().init(constraints, orientation);
                return Consumer<ViewLayer>(
                  builder: (BuildContext context, value, Widget? child) {
                    return MaterialApp(
                        theme: AppTheme().light(),
                        darkTheme: AppTheme().dark(),
                        themeMode:
                            Provider.of<ViewLayer>(context, listen: false)
                                .appThemeMode,
                        debugShowCheckedModeBanner: false,
                        home: HomePage());
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
