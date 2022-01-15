import 'package:flutter/material.dart';
import 'package:movie_app/component/top_rated_movies.dart';
import 'package:movie_app/component/trending_column.dart';
import 'package:movie_app/view_layer.dart';
import 'package:movie_app/widgets/custom_drawer.dart';
import 'package:movie_app/widgets/search_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;

  void tabClicked(int index) {
    setState(() {
      currentTab = index;
    });
  }

  List<Widget> tabs = [const TrendingMovies(), const TopRatedMovies()];

  @override
  Widget build(BuildContext context) {
    ViewLayer provider = Provider.of<ViewLayer>(context, listen: false);
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 56,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(builder: (context) {
                      return IconButton(
                        iconSize: 38,
                        icon: Icon(Icons.menu),
                        color: provider.textColor,
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    }),
                    Expanded(child: SearchCard())
                  ],
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          tabClicked(0);
                        },
                        child: Text(
                          'Trending',
                          style: TextStyle(
                              color: currentTab == 0
                                  ? provider.textColor
                                  : provider.textColor.withOpacity(0.3),
                              fontWeight: FontWeight.w600,
                              fontSize: 32),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          tabClicked(1);
                        },
                        child: Text(
                          'Top Rated',
                          style: TextStyle(
                              color: currentTab == 1
                                  ? provider.textColor
                                  : provider.textColor.withOpacity(0.3),
                              fontWeight: FontWeight.w600,
                              fontSize: 32),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                child: tabs[currentTab],
              )
            ],
          ),
        ),
        drawer: CustomDrawer(),
      ),
    );
  }
}
