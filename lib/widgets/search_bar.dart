import 'package:flutter/material.dart';
import '../cubit/search_feautures/search_view.dart';


class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}


class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
      return Container(
        color: Colors.black,
        margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        padding: const EdgeInsets.all(20),
        child: Column(children: <Widget>[
          TextField(
            cursorColor: Colors.white,
            style: const TextStyle(color: Colors.white),
            onSubmitted: (value) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage(value)));
            },
            controller: editingController,
            decoration:  InputDecoration(
              hintText: 'Batman',
                hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color:  Colors.blueGrey,
                    width: 3.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.amber,
                    width: 2.0,
                  ),
                ),



              filled: true,
              fillColor: Colors.black,
              labelText: "Search movies",
              labelStyle: const TextStyle(color: Colors.amber),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.amber,
              ),
            ),
          ),
        ],
    ),
      );
  }
}
