import 'package:flutter/material.dart';
import 'package:movie_app/size_config.dart';
import 'package:movie_app/ui/searched_movies.dart';

class SearchCard extends StatefulWidget {
  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(0.7 * SizeConfig.heightMultiplier!),
          ),
        ),
        child: TextField(
          onEditingComplete: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        SearchedMovies(query: _searchControl.text)));

            FocusScope.of(context).unfocus();
          },
          style: TextStyle(
            fontSize: 2.2 * SizeConfig.textMultiplier!,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(0.7 * SizeConfig.heightMultiplier!),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius:
                  BorderRadius.circular(0.7 * SizeConfig.heightMultiplier!),
            ),
            hintText: "Search..",
            prefixIcon: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            SearchedMovies(query: _searchControl.text)));
                FocusScope.of(context).unfocus();
              },
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            suffixIcon: Icon(
              Icons.filter_list,
              color: Colors.black,
            ),
            hintStyle: TextStyle(
              fontSize: 2.2 * SizeConfig.textMultiplier!,
              color: Colors.black,
            ),
          ),
          maxLines: 1,
          controller: _searchControl,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchControl;
  }
}
