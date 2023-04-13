import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movieapi_v2/model/search_result.dart';
import 'package:flutter_movieapi_v2/widgets/search_list.dart';

import '../cubit/search_feautures/search_cubit.dart';
import '../cubit/search_feautures/search_view.dart';
import '../dependency_injection/locator.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}


class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController editingController = TextEditingController();
  late SearchCubit _search_view_model ;


  @override
  void initState() {
    _search_view_model = locator.get<SearchCubit>();
  }
  @override
  Widget build(BuildContext context) {
      return Container(
        color: Colors.black,
        margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
        padding: EdgeInsets.all(20),
        child: Column(children: <Widget>[
          TextField(
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white),
            onSubmitted: (value) {
              debugPrint('EKRAN GİRDİ:$value');

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage(value)));
            },
            controller: editingController,
            decoration: const InputDecoration(
              hintText: 'Type Text Here',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber)),

              filled: true,
              fillColor: Colors.black,
              labelText: "Search movies",
              labelStyle: TextStyle(color: Colors.amber),
              prefixIcon: Icon(
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
