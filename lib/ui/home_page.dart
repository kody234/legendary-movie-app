import 'package:flutter/material.dart';
import 'package:movie_app/component/trending_column.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color textColor = Color(0xFF12153D);
  int currentTab = 0;

  void tabClicked(int index) {
    setState(() {
      currentTab = index;
    });
  }

  List<Widget> tabs = [
    const TrendingMovies(),
    Expanded(
      child: Container(
        color: Colors.blue,
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                children: const [
                  Icon(
                    Icons.menu,
                    size: 38,
                    color: Color(0xFF12153D),
                  ),
                  Icon(
                    Icons.search,
                    size: 32,
                    color: Color(0xFF12153D),
                  )
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
                                ? textColor
                                : textColor.withOpacity(0.3),
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
                        'In Theater',
                        style: TextStyle(
                            color: currentTab == 1
                                ? textColor
                                : textColor.withOpacity(0.3),
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
    );
  }
}
