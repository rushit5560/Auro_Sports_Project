import 'package:auro_sports_app/common/custom_color.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        centerTitle: true,
        backgroundColor: CustomColor.kOrangeColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          searchBar(),
        ],
      ),
    );
  }
  
  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 40,
          child: Center(
            child: TextFormField(
              cursorColor: CustomColor.kOrangeColor,
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search_rounded,
                    color: CustomColor.kOrangeColor,
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 0),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    // borderSide: BorderSide(width: 5),
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
