import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movieapi_v2/view/movie_success_view.dart';

import '../../utils/utils.dart';
import 'movie_cubit.dart';
import 'movie_states.dart';



class MoviePage extends StatelessWidget {
  String? reviewId;
  String? detailId;


  MoviePage(this.reviewId, this.detailId, {super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit(),
      child: buildScaffold(),
    );
  }

  Scaffold buildScaffold() {
    return Scaffold(

      backgroundColor: Colors.black,
      body: BlocConsumer<MovieCubit, MovieStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if (state is InitState) {
            BlocProvider.of<MovieCubit>(context).fetchMovie(reviewId!, detailId!);

          } else if (state is LoadingState) {
            return buildLoading();

          } else if (state is ResponseState) {




            return MovieView(state.detail,state.review );
          }
          else {
            final error = state as ErrorState;
            return buildError(error);
          }
          return buildLoading();
        },
      ),
    );
  }


  Center buildError(ErrorState error) {
    return Center(
      child: Text(error.message),
    );
  }
}