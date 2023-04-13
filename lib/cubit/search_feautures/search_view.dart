import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movieapi_v2/cubit/search_feautures/search_cubit.dart';
import 'package:flutter_movieapi_v2/cubit/search_feautures/search_states.dart';
import 'package:flutter_movieapi_v2/widgets/search_list.dart';
import 'package:flutter_movieapi_v2/widgets/search_bar.dart';
import '../../dependency_injection/locator.dart';
import '../movie_features/movie_view.dart';
import 'package:flutter_movieapi_v2/model/search_result.dart';

class SearchPage extends StatefulWidget {

  String? query;

  SearchPage(this.query);

  @override
  State<SearchPage> createState() => _SearchPageState(this.query);
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
              } else if (state is ResponseState) {

                debugPrint('Response State');
                debugPrint('${state.searchResult?.data.search.movies[0].name}');
                debugPrint('${state.searchResult?.data.search.movies[0].posterImage?.url}');
                debugPrint('${state.searchResult?.data.search.movies[0].emsVersionId}');
                debugPrint('${state.searchResult?.data.search.movies[0].emsId}');
                //List<Movie>? movies;
                //movies=state.searchResult?.data.search.movies;

                return SearchListWidget(state.searchResult);
              } else {
                final error = state as ErrorState;
                return buildError(error);
              }
              return Text("");
            },
    );
  }

  Center buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Center buildError(ErrorState error) {
    return Center(
      child: Text(error.message),
    );
  }
}