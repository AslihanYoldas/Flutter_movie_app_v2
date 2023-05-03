import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movieapi_v2/cubit/search_feautures/search_cubit.dart';
import 'package:flutter_movieapi_v2/cubit/search_feautures/search_states.dart';
import 'package:flutter_movieapi_v2/widgets/search_list.dart';
import '../../utils/utils.dart';

class SearchPage extends StatefulWidget {

  String? query;

  SearchPage(this.query, {super.key});

  @override
  State<SearchPage> createState() => _SearchPageState(query);
}

class _SearchPageState extends State<SearchPage> {
  String? query;

  _SearchPageState(this.query);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: buildBody(),
    );
  }

  BlocConsumer<SearchCubit, SearchStates> buildBody() {
    return BlocConsumer<SearchCubit, SearchStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is InitState ) {
                BlocProvider.of<SearchCubit>(context).fetchSearchResults(query);

              } else if (state is LoadingState) {
                return buildLoading();
              } else if (state is ResponseState ) {

                debugPrint('Response State');


                return SearchListWidget(state.searchResult);
              } else {

                return buildError();
              }
              return buildLoading();
            },
    );
  }


  Center buildError() {
    return Center(
      child: Text(''),
    );
  }
}